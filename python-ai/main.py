from aiopyopenttdadmin import Admin, AdminUpdateType, openttdpacket as p, Auth
import asyncio
import json as js

from event import Event, EventQueue

class OpenttdControl:
    ip_address: str
    port: int
    admin: Admin
    company_id: int

    events: EventQueue

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

    async def _send_msg(self, msg: dict) -> None:
        await self.admin.send_gamescript({
            "company": self.company_id,
            "msg": msg
        })

    async def run(self):
        await self.admin.connect()
        await self.admin.subscribe(AdminUpdateType.GAMESCRIPT)

        self.admin.add_handler(p.GameScriptPacket)(self._receive_message_hander)

        await self.admin.run()

class OpenttdAI:
    control: OpenttdControl

    def __init__(self, control: OpenttdControl) -> None:
        self.control = control

    async def run(self):
        handle_event = asyncio.create_task(self.handle_events())
        await asyncio.gather(handle_event)

    async def handle_events(self):
        while True:
            events = self.control.events
            while True:
                event = events.pop()
                if event == None:
                    break
                print(f"Handle event: {type(event).__name__} -> {event.__dict__}")
            await asyncio.sleep(0.5)

ip_address = "127.0.0.1"
port_number = 3977

async def main():
    control = OpenttdControl(ip_address, port_number, 1, "123456")
    ai = OpenttdAI(control)
    control_task = asyncio.create_task(control.run())
    ai_task = asyncio.create_task(ai.run())
    await asyncio.gather(control_task, ai_task)

if __name__ == "__main__":
    asyncio.run(main())
