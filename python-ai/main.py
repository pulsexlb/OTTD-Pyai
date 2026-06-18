import asyncio
from control import OpenttdControl
from reqst import CompanyReq

class OpenttdAI:
    control: OpenttdControl

    company: CompanyReq

    def __init__(self, control: OpenttdControl) -> None:
        self.control = control
        self.company = CompanyReq(control)

    async def run(self):
        while True:
            if self.control.admin.authenticated:
                break
            await asyncio.sleep(0.1)
        handle_event = asyncio.create_task(self.handle_events())
        query_event = asyncio.create_task(self.send_query_test())
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

    async def send_query_test(self):
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
