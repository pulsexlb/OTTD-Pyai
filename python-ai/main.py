from aiopyopenttdadmin import Admin, AdminUpdateType, openttdpacket as p, Auth
import asyncio

ip_address = "127.0.0.1"
port_number = 3977

auth = Auth(
    name = "OtherAIAdmin",
    version = "15.3",
    password = "123456"
)

async def main():
    admin = Admin(ip = ip_address, port = port_number, auth = auth)
    await admin.connect()
    await admin.subscribe(AdminUpdateType.GAMESCRIPT)

    async def message_send():
        while True:
            message = await asyncio.to_thread(input, ">")
            await admin._send(p.AdminGameScriptPacket({"msg": message}))
    
    @admin.add_handler(p.GameScriptPacket)
    async def script_packet(admin: Admin, packet: p.GameScriptPacket):
        print(f'ID: Message: {packet.json}')

    async def run():
        await admin.run()

    send_task = asyncio.create_task(message_send())
    run_task = asyncio.create_task(run())

    await asyncio.gather(send_task, run_task)

if __name__ == "__main__":
    asyncio.run(main())
