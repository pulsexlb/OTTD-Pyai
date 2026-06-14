from aiopyopenttdadmin import Admin, AdminUpdateType, openttdpacket as p, Auth
import asyncio

ip_address = "127.0.0.1"
port_number = 3977

auth = Auth(
    name = "OtherAIAdmin",
    version = "15.0",
    password = "123456"
)

async def main():
    admin = Admin(ip = ip_address, port = port_number, auth = auth)
    await admin.connect()
    await admin.subscribe(AdminUpdateType.GAMESCRIPT)

    
    @admin.add_handler(p.GameScriptPacket)
    async def script_packet(admin: Admin, packet: p.GameScriptPacket):
        print(f'ID: Message: {packet.json}')

    await admin.run()

if __name__ == "__main__":
    asyncio.run(main())
