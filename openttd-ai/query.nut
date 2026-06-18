function Query(key, params) {
    switch (key) {
        case "is_mine": {
            return AICompany.IsMine(params.company_id.tointeger());
            break;
        }
        case "set_name": {
            return AICompany.SetName(params.name);
            break;
        }
        case "set_president_name": {
            return AICompany.SetPresidentName(params.name);
            break;
        }
        case "set_president_gender": {
            return AICompany.SetPresidentGender(params.gender.tointeger());
            break;
        }
        case "set_loan_amount": {
            return AICompany.SetLoanAmount(params.loan.tointeger());
            break;
        }
        case "set_minimum_loan_amount": {
            return AICompany.SetMinimumLoanAmount(params.loan.tointeger());
            break;
        }
        case "build_company_hq": {
            return AICompany.BuildCompanyHQ(params.tile.tointeger());
            break;
        }
        case "set_auto_renew_status": {
            return AICompany.SetAutoRenewStatus(params.autorenew.tointeger());
            break;
        }
        case "set_auto_renew_months": {
            return AICompany.SetAutoRenewMonths(params.months.tointeger());
            break;
        }
        case "set_auto_renew_money": {
            return AICompany.SetAutoRenewMoney(params.money.tointeger());
            break;
        }
        case "get_quarterly_income": {
            return AICompany.GetQuarterlyIncome(params.company_id.tointeger(), params.quarter.tointeger());
            break;
        }
        case "get_quarterly_expenses": {
            return AICompany.GetQuarterlyExpenses(params.company_id.tointeger(), params.quarter.tointeger());
            break;
        }
        case "get_quarterly_cargo_delivered": {
            return AICompany.GetQuarterlyCargoDelivered(params.company_id.tointeger(), params.quarter.tointeger());
            break;
        }
        case "get_quarterly_performance_rating": {
            return AICompany.GetQuarterlyPerformanceRating(params.company_id.tointeger(), params.quarter.tointeger());
            break;
        }
        case "get_quarterly_company_value": {
            return AICompany.GetQuarterlyCompanyValue(params.company_id.tointeger(), params.quarter.tointeger());
            break;
        }
        case "get_company_name": {
            return AICompany.GetName(params.company_id.tointeger());
            break;
        }
        case "get_president_name": {
            return AICompany.GetPresidentName(params.company_id.tointeger());
            break;
        }
        case "get_president_gender": {
            return AICompany.GetPresidentGender(params.company_id.tointeger());
            break;
        }
        case "get_loan_amount": {
            return AICompany.GetLoanAmount();
            break;
        }
        case "get_max_loan_amount": {
            return AICompany.GetMaxLoanAmount();
            break;
        }
        case "get_loan_interval": {
            return AICompany.GetLoanInterval();
            break;
        }
        case "get_bank_balance": {
            return AICompany.GetBankBalance(params.company_id.tointeger());
            break;
        }
        case "get_company_hq": {
            return AICompany.GetCompanyHQ(params.company_id.tointeger());
            break;
        }
        case "get_auto_renew_status": {
            return AICompany.GetAutoRenewStatus(params.company_id.tointeger());
            break;
        }
        case "get_auto_renew_months": {
            return AICompany.GetAutoRenewMonths(params.company_id.tointeger());
            break;
        }
        case "get_auto_renew_money": {
            return AICompany.GetAutoRenewMoney(params.company_id.tointeger());
            break;
        }
    }
}
