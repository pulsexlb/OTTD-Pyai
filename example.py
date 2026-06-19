from pyopenttd_ai import OpenttdAI
from pyopenttd_ai.control import OpenttdControl, ConnectionSetting
import asyncio


class AI(OpenttdAI):
    def __init__(self, control: OpenttdControl) -> None:
        super().__init__(control)

    async def run(self):
        while True:
            if self.control.admin.authenticated:
                break
            await asyncio.sleep(0.1)
        handle_event = asyncio.create_task(self.handle_events())
        query_event = asyncio.create_task(self.send_query())
        await asyncio.gather(handle_event, query_event)

    async def handle_events(self):
        """You can handle any game event by using event stack"""
        while True:
            events = self.control.events
            while True:
                event = events.pop()
                if event == None:
                    break
                print(f"Handle event: {type(event).__name__} -> {event.__dict__}")
            await asyncio.sleep(0.5)

    async def send_query(self):
        """You can send query (including command to ai) by using api and get the result"""
        result = await self.company.query_name()
        print(f"Handle query result: query_name -> {result}")

        await asyncio.sleep(1)

        result = await self.company.query_president_name()
        print(f"Handle query result: query_president_name -> {result}")

        await asyncio.sleep(1)

        result = await self.company.query_president_gender()
        print(f"Handle query result: query_president_gender -> {result}")

        await asyncio.sleep(1)

        result = await self.company.query_loan_amount()
        print(f"Handle query result: query_loan_amount -> {result}")

        await asyncio.sleep(1)

        result = await self.company.query_max_loan_amount()
        print(f"Handle query result: query_max_loan_amount -> {result}")

        await asyncio.sleep(1)

        result = await self.company.query_loan_interval()
        print(f"Handle query result: query_loan_interval -> {result}")

        await asyncio.sleep(1)

        result = await self.company.query_bank_balance()
        print(f"Handle query result: query_bank_balance -> {result}")

        await asyncio.sleep(1)

        result = await self.company.query_company_hq()
        print(f"Handle query result: query_company_hq -> {result}")

        await asyncio.sleep(1)

        result = await self.company.query_auto_renew_status()
        print(f"Handle query result: query_auto_renew_status -> {result}")

        await asyncio.sleep(1)

        result = await self.company.query_auto_renew_months()
        print(f"Handle query result: query_auto_renew_months -> {result}")

        await asyncio.sleep(1)

        result = await self.company.query_auto_renew_money()
        print(f"Handle query result: query_auto_renew_money -> {result}")

        await asyncio.sleep(1)

        result = await self.company.query_quarterly_income()
        print(f"Handle query result: query_quarterly_income -> {result}")

        await asyncio.sleep(1)

        result = await self.company.query_quarterly_expenses()
        print(f"Handle query result: query_quarterly_expenses -> {result}")

        await asyncio.sleep(1)

        result = await self.company.query_quarterly_cargo_delivered()
        print(f"Handle query result: query_quarterly_cargo_delivered -> {result}")

        await asyncio.sleep(1)

        result = await self.company.query_quarterly_performance_rating()
        print(f"Handle query result: query_quarterly_performance_rating -> {result}")

        await asyncio.sleep(1)

        result = await self.company.query_quarterly_company_value()
        print(f"Handle query result: query_quarterly_company_value -> {result}")

        await asyncio.sleep(1)

        result = await self.company.set_name("Pyai-OTTD")
        print(f"Handle query result: set_name -> {result}")

        await asyncio.sleep(1)

connection_setting = ConnectionSetting(
    ip_address="127.0.0.1",  # Server's ip
    port_num=3977,  # Server's admin port number (See it in your openttd.cfg)
    password="123456",  # Server's admin port password
    connection_name="OtherAIAdmin",  # Connection name, will display in logs
    connection_version="15.3"  # Server's openttd version
)

company_id = 1  # Company id of your ai.
                # Run `companies` in your openttd console and the `#num` - 1 is your company id

async def main():
    control = OpenttdControl(company_id, connection_setting)
    control_task = asyncio.create_task(control.run())
    ai = AI(control)
    ai_task = asyncio.create_task(ai.run())
    await asyncio.gather(control_task, ai_task)

if __name__ == "__main__":
    asyncio.run(main())
