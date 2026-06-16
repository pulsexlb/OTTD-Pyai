from typing import Any
from aiopyopenttdadmin import Admin, AdminUpdateType, openttdpacket as p, Auth
import asyncio
import json as js

from event import Event, EventQueue
from query import QueryList

class OpenttdControl:
    ip_address: str
    port: int
    admin: Admin
    company_id: int

    events: EventQueue
    queries: QueryList

    def __init__(
            self,
            ip_address: str,
            port: int,
            company_id: int,
            password: str,
            name: str = "OtherAIAdmin",
            version: str = "15.3"
        ) -> None:
        auth = Auth(
            name = name,
            version = version,
            password = password
        )
        self.company_id = company_id
        self.ip_address = ip_address
        self.port = port
        self.admin = Admin(ip = ip_address, port = port, auth = auth)
        self.events = EventQueue()
        self.queries = QueryList()

    async def _receive_message_hander(self, admin: Admin, packet: p.GameScriptPacket) -> None:
        data = js.loads(packet.json.rstrip('\x00'))
        company = int(data["company"])
        if company != -1 and company != self.company_id:
            return
        data = data["msg"]
        if data["type"] == "event":
            event_data = data["event"]
            event = Event.from_json(event_data)
            print(f"Received event: {type(event).__name__} -> {event.__dict__}")
            self.events.push(event)
        if data["type"] == "query_result":
            query_id = data["id"]
            query_data = data["result"]
            print(f"Received query result {query_data} | id: {query_id}")
            self.queries.add_result(query_id, query_data)

    async def _send_msg(self, msg: dict) -> None:
        await self.admin.send_gamescript(msg)

    async def query(self, msg: str, checktime: float = 0.1, timeout: float = 1) -> Any:
        """
        query something from openttd
        - checktime: How long to check the query result
        - timeout: Max time to check the query result
        """
        query_id = self.queries.new_query()
        await self._send_msg({
            "type": "query",
            "query": {
                "id": query_id,
                "msg": msg
            }
        })
        for _ in range(int(timeout/checktime)):
            result = self.queries.check_result(query_id)
            if result != None:
                return result
            await asyncio.sleep(checktime)
        return None

    async def run(self):
        """
        run the control
        """
        await self.admin.connect()
        await self.admin.subscribe(AdminUpdateType.GAMESCRIPT)

        self.admin.add_handler(p.GameScriptPacket)(self._receive_message_hander)

        await self.admin.run()

class OpenttdAI:
    control: OpenttdControl

    def __init__(self, control: OpenttdControl) -> None:
        self.control = control

    async def run(self):
        while True:
            if self.control.admin.authenticated:
                break
            await asyncio.sleep(0.1)
        handle_event = asyncio.create_task(self.handle_events())
        query_event = asyncio.create_task(self.send_query())
        await asyncio.gather(handle_event, query_event)

    async def handle_events(self):
        while True:
            events = self.control.events
            while True:
                event = events.pop()
                if event == None:
                    break
                print(f"Handle event: {type(event).__name__} -> {event.__dict__}")
            await asyncio.sleep(0.5)

    async def send_query(self):
        while True:
            result = await self.control.query("a sim query")
            print(f"Handle query result: {result}")
            await asyncio.sleep(10)

ip_address = "127.0.0.1"
port_number = 3977

async def main():
    control = OpenttdControl(ip_address, port_number, 1, "123456")
    control_task = asyncio.create_task(control.run())
    ai = OpenttdAI(control)
    ai_task = asyncio.create_task(ai.run())
    await asyncio.gather(control_task, ai_task)

if __name__ == "__main__":
    asyncio.run(main())
