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
            self.events.push(event)
        if data["type"] == "query_result":
            query_id = data["id"]
            query_data = data["result"]
            self.queries.add_result(query_id, query_data)

    async def _send_msg(self, msg: dict) -> None:
        await self.admin.send_gamescript({"company": self.company_id, "msg": msg})

    async def query(self, key: str, params: dict = {}, checktime: float = 0.1, timeout: float = 10) -> Any:
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
                "params": params,
                "key": key
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


