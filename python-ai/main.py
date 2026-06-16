from aiopyopenttdadmin import Admin, AdminUpdateType, openttdpacket as p, Auth
import asyncio
import json as js

class OpenttdControl:
    ip_address: str
    port: int
    admin: Admin
    company_id: int

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

    async def _receive_message_hander(self, admin: Admin, packet: p.GameScriptPacket) -> None:
        data = js.loads(packet.json.rstrip('\x00'))
        print(f'company {data["company"]} sent a message: {data["msg"]}')

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

ip_address = "127.0.0.1"
port_number = 3977

if __name__ == "__main__":
    control = OpenttdControl(ip_address, port_number, 1, "123456")
    asyncio.run(control.run())
