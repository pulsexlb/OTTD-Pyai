from aiopyopenttdadmin import Admin, AdminUpdateType, openttdpacket as p, Auth
import asyncio
import json as js

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
            message = message.split(" ", 1)
            await admin._send(p.AdminGameScriptPacket({"company": int(message[0]), "msg": message[1]}))
    
    @admin.add_handler(p.GameScriptPacket)
    async def script_packet(admin: Admin, packet: p.GameScriptPacket):
        data = js.loads(packet.json.rstrip('\x00'))
        print(f'company {data["company"]} sent a message: {data["msg"]}')

    asyncio.create_task(message_send())
    await admin.run()

if __name__ == "__main__":
    asyncio.run(main())
