from typing import Optional
from control import OpenttdControl

from openttd_types import CompanyID, Gender, Money, TileIndex


class CompanyReq:

    control: OpenttdControl
    company_id: CompanyID

    def __init__(self, control: OpenttdControl) -> None:
        self.control = control
        self.company_id = control.company_id

    async def query_name(self, company_id: Optional[CompanyID] = None) -> str:
        """Get the name of the given company."""
        if company_id == None:
            company_id = self.company_id
        return await self.control.query("get_company_name", params={"company_id": company_id})

    async def query_president_name(self, company_id: Optional[CompanyID] = None) -> str:
        """Get the name of the president of the given company."""
        if company_id == None:
            company_id = self.company_id
        return await self.control.query("get_president_name", params={"company_id": company_id})

    async def query_president_gender(self, company_id: Optional[CompanyID] = None) -> Gender:
        """Get the gender of the president of the given company."""
        if company_id == None:
            company_id = self.company_id
        return await self.control.query("get_president_gender", params={"company_id": company_id})

    async def query_loan_amount(self) -> Money:
        """Gets the amount your company have loaned."""
        return await self.control.query("get_loan_amount")

    async def query_max_loan_amount(self) -> Money:
        """Gets the maximum amount your company can loan."""
        return await self.control.query("get_max_loan_amount")

    async def query_loan_interval(self) -> Money:
        """Gets the interval/loan step."""
        return await self.control.query("get_loan_interval")

    async def query_bank_balance(self, company_id: Optional[CompanyID] = None) -> Money:
        """Gets the bank balance."""
        if company_id == None:
            company_id = self.company_id
        return await self.control.query("get_bank_balance", params={"company_id": company_id})

    async def query_company_hq(self, company_id: Optional[CompanyID] = None) -> TileIndex:
        """Return the location of a company's HQ."""
        if company_id == None:
            company_id = self.company_id
        return await self.control.query("get_company_hq", params={"company_id": company_id})

    async def query_auto_renew_status(self, company_id: Optional[CompanyID] = None) -> bool:
        """Return whether autorenew is enabled for a company."""
        if company_id == None:
            company_id = self.company_id
        return await self.control.query("get_auto_renew_status", params={"company_id": company_id})

    async def query_auto_renew_months(self, company_id: Optional[CompanyID] = None) -> int:
        """Return the number of months before/after max age to autorenew an engine for a company."""
        if company_id == None:
            company_id = self.company_id
        return await self.control.query("get_auto_renew_months", params={"company_id": company_id})

    async def query_auto_renew_money(self, company_id: Optional[CompanyID] = None) -> Money:
        """Return the minimum money needed to autorenew an engine for a company."""
        if company_id == None:
            company_id = self.company_id
        return await self.control.query("get_auto_renew_money", params={"company_id": company_id})

    async def query_is_mine(self, company_id: Optional[CompanyID] = None) -> bool:
        """Check if a CompanyID is your CompanyID, to ease up checks."""
        if company_id == None:
            company_id = self.company_id
        return await self.control.query("is_mine", params={"company_id": company_id})

    async def set_name(self, name: str) -> bool:
        """Set the name of your company."""
        return await self.control.query("set_name", params={"name": name})

    async def set_president_name(self, name: str) -> bool:
        """Set the name of your president."""
        return await self.control.query("set_president_name", params={"name": name})

    async def set_president_gender(self, gender: Gender) -> bool:
        """Set the gender of the president of your company."""
        return await self.control.query("set_president_gender", params={"gender": gender})

    async def set_loan_amount(self, loan: Money) -> bool:
        """Sets the amount to loan."""
        return await self.control.query("set_loan_amount", params={"loan": loan})

    async def set_minimum_loan_amount(self, loan: Money) -> bool:
        """Sets the minimum amount to loan, i.e. the given amount of loan rounded up."""
        return await self.control.query("set_minimum_loan_amount", params={"loan": loan})

    async def build_company_hq(self, tile: TileIndex) -> bool:
        """Build your company's HQ on the given tile."""
        return await self.control.query("build_company_hq", params={"tile": tile})

    async def set_auto_renew_status(self, autorenew: bool) -> bool:
        """Set whether autorenew is enabled for your company."""
        return await self.control.query("set_auto_renew_status", params={"autorenew": autorenew})

    async def set_auto_renew_months(self, months: int) -> bool:
        """Set the number of months before/after max age to autorenew an engine for your company."""
        return await self.control.query("set_auto_renew_months", params={"months": months})

    async def set_auto_renew_money(self, money: Money) -> bool:
        """Set the minimum money needed to autorenew an engine for your company."""
        return await self.control.query("set_auto_renew_money", params={"money": money})

    async def query_quarterly_income(self, company_id: Optional[CompanyID] = None, quarter: int = 1) -> Money:
        """Get the income of the company in the given economy-quarter."""
        if company_id == None:
            company_id = self.company_id
        return await self.control.query("get_quarterly_income", params={"company_id": company_id, "quarter": quarter})

    async def query_quarterly_expenses(self, company_id: Optional[CompanyID] = None, quarter: int = 1) -> Money:
        """Get the expenses of the company in the given economy-quarter."""
        if company_id == None:
            company_id = self.company_id
        return await self.control.query("get_quarterly_expenses", params={"company_id": company_id, "quarter": quarter})

    async def query_quarterly_cargo_delivered(self, company_id: Optional[CompanyID] = None, quarter: int = 1) -> int:
        """Get the amount of cargo delivered by the given company in the given economy-quarter."""
        if company_id == None:
            company_id = self.company_id
        return await self.control.query("get_quarterly_cargo_delivered", params={"company_id": company_id, "quarter": quarter})

    async def query_quarterly_performance_rating(self, company_id: Optional[CompanyID] = None, quarter: int = 1) -> int:
        """Get the performance rating of the given company in the given economy-quarter."""
        if company_id == None:
            company_id = self.company_id
        return await self.control.query("get_quarterly_performance_rating", params={"company_id": company_id, "quarter": quarter})

    async def query_quarterly_company_value(self, company_id: Optional[CompanyID] = None, quarter: int = 1) -> Money:
        """Get the value of the company in the given economy-quarter."""
        if company_id == None:
            company_id = self.company_id
        return await self.control.query("get_quarterly_company_value", params={"company_id": company_id, "quarter": quarter})
