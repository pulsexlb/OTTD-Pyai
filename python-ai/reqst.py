from typing import Optional
from control import OpenttdControl

from openttd_types import AirportType, BridgeType, BuildType, CargoClass, CargoType, CompanyID, DateType, DistributionType, EngineID, ErrorCategories, Gender, GroupID, Money, ObjectType, PlaneType, RailType, RoadType, SignID, StationID, SubsidyID, SubsidyParticipantType, TileIndex, TownEffect, TownID, VehicleType, WaypointType


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


class AccountingReq:

    control: OpenttdControl

    def __init__(self, control: OpenttdControl) -> None:
        self.control = control

    async def get_costs(self) -> Money:
        """Get the current value of the costs."""
        return await self.control.query("get_costs")

    async def reset_costs(self) -> None:
        """Reset the costs to zero."""
        return await self.control.query("reset_costs")


class AirportReq:

    control: OpenttdControl

    def __init__(self, control: OpenttdControl) -> None:
        self.control = control

    async def query_is_valid_airport_type(self, type: AirportType) -> bool:
        """Checks whether the given AirportType is valid and available."""
        return await self.control.query("is_valid_airport_type", params={"type": type.value})

    async def query_is_airport_information_available(self, type: AirportType) -> bool:
        """Can you get information on this airport type?"""
        return await self.control.query("is_airport_information_available", params={"type": type.value})

    async def query_get_airport_price(self, type: AirportType) -> Money:
        """Get the cost to build this AirportType."""
        return await self.control.query("get_airport_price", params={"type": type.value})

    async def query_is_hangar_tile(self, tile: TileIndex) -> bool:
        """Checks whether the given tile is actually a tile with a hangar."""
        return await self.control.query("is_hangar_tile", params={"tile": tile})

    async def query_is_airport_tile(self, tile: TileIndex) -> bool:
        """Checks whether the given tile is actually a tile with an airport."""
        return await self.control.query("is_airport_tile", params={"tile": tile})

    async def query_get_airport_width(self, type: AirportType) -> int:
        """Get the width of this type of airport."""
        return await self.control.query("get_airport_width", params={"type": type.value})

    async def query_get_airport_height(self, type: AirportType) -> int:
        """Get the height of this type of airport."""
        return await self.control.query("get_airport_height", params={"type": type.value})

    async def query_get_airport_coverage_radius(self, type: AirportType) -> int:
        """Get the coverage radius of this type of airport."""
        return await self.control.query("get_airport_coverage_radius", params={"type": type.value})

    async def query_get_num_hangars(self, tile: TileIndex) -> int:
        """Get the number of hangars of the airport."""
        return await self.control.query("get_num_hangars", params={"tile": tile})

    async def query_get_hangar_of_airport(self, tile: TileIndex) -> TileIndex:
        """Get the first hangar tile of the airport."""
        return await self.control.query("get_hangar_of_airport", params={"tile": tile})

    async def build_airport(self, tile: TileIndex, type: AirportType, station_id: StationID) -> bool:
        """Builds a airport with tile at the topleft corner."""
        return await self.control.query("build_airport", params={"tile": tile, "type": type.value, "station_id": station_id})

    async def remove_airport(self, tile: TileIndex) -> bool:
        """Removes an airport."""
        return await self.control.query("remove_airport", params={"tile": tile})

    async def query_get_airport_type(self, tile: TileIndex) -> AirportType:
        """Get the AirportType of an existing airport."""
        result = await self.control.query("get_airport_type", params={"tile": tile})
        return AirportType(result)

    async def query_get_noise_level_increase(self, tile: TileIndex, type: AirportType) -> int:
        """Get the noise that will be added to the nearest town if an airport was built at this tile."""
        return await self.control.query("get_noise_level_increase", params={"tile": tile, "type": type.value})

    async def query_get_nearest_town(self, tile: TileIndex, type: AirportType) -> TownID:
        """Get the TownID of the town whose local authority will influence an airport at some tile."""
        return await self.control.query("get_nearest_town", params={"tile": tile, "type": type.value})

    async def query_get_maintenance_cost_factor(self, type: AirportType) -> int:
        """Get the maintenance cost factor of an airport type."""
        return await self.control.query("get_maintenance_cost_factor", params={"type": type.value})

    async def query_get_monthly_maintenance_cost(self, type: AirportType) -> Money:
        """Get the monthly maintenance cost of an airport type."""
        return await self.control.query("get_monthly_maintenance_cost", params={"type": type.value})

    async def query_get_airport_num_helipads(self, type: AirportType) -> int:
        """Get the number of helipads of this airport type."""
        return await self.control.query("get_airport_num_helipads", params={"type": type.value})


class BridgeReq:

    control: OpenttdControl

    def __init__(self, control: OpenttdControl) -> None:
        self.control = control

    async def query_is_valid_bridge(self, bridge_type: BridgeType) -> bool:
        """Checks whether the given bridge type is valid."""
        return await self.control.query("is_valid_bridge", params={"bridge_type": bridge_type})

    async def query_is_bridge_tile(self, tile: TileIndex) -> bool:
        """Checks whether the given tile is actually a bridge start or end tile."""
        return await self.control.query("is_bridge_tile", params={"tile": tile})

    async def query_get_bridge_type(self, tile: TileIndex) -> BridgeType:
        """Get the BridgeType of a bridge at a given tile."""
        return await self.control.query("get_bridge_type", params={"tile": tile})

    async def query_get_bridge_name(self, bridge_type: BridgeType, vehicle_type: VehicleType) -> str:
        """Get the name of a bridge."""
        return await self.control.query("get_bridge_name", params={"bridge_type": bridge_type, "vehicle_type": vehicle_type.value})

    async def query_get_max_speed(self, bridge_type: BridgeType) -> int:
        """Get the maximum speed of a bridge."""
        return await self.control.query("get_max_speed", params={"bridge_type": bridge_type})

    async def query_get_bridge_price(self, bridge_type: BridgeType, length: int) -> Money:
        """Get the new cost of a bridge, excluding the road and/or rail."""
        return await self.control.query("get_bridge_price", params={"bridge_type": bridge_type, "length": length})

    async def query_get_max_length(self, bridge_type: BridgeType) -> int:
        """Get the maximum length of a bridge."""
        return await self.control.query("get_max_length", params={"bridge_type": bridge_type})

    async def query_get_min_length(self, bridge_type: BridgeType) -> int:
        """Get the minimum length of a bridge."""
        return await self.control.query("get_min_length", params={"bridge_type": bridge_type})

    async def build_bridge(self, vehicle_type: VehicleType, bridge_type: BridgeType, start: TileIndex, end: TileIndex) -> bool:
        """Build a bridge from one tile to the other."""
        return await self.control.query("build_bridge", params={"vehicle_type": vehicle_type.value, "bridge_type": bridge_type, "start": start, "end": end})

    async def remove_bridge(self, tile: TileIndex) -> bool:
        """Removes a bridge, by executing it on either the start or end tile."""
        return await self.control.query("remove_bridge", params={"tile": tile})

    async def query_get_other_bridge_end(self, tile: TileIndex) -> TileIndex:
        """Get the tile that is on the other end of a bridge starting at tile."""
        return await self.control.query("get_other_bridge_end", params={"tile": tile})


class CargoReq:

    control: OpenttdControl

    def __init__(self, control: OpenttdControl) -> None:
        self.control = control

    async def query_is_valid_cargo(self, cargo_type: CargoType) -> bool:
        """Checks whether the given cargo type is valid."""
        return await self.control.query("is_valid_cargo", params={"cargo_type": cargo_type})

    async def query_is_valid_town_effect(self, towneffect_type: TownEffect) -> bool:
        """Checks whether the given town effect type is valid."""
        return await self.control.query("is_valid_town_effect", params={"towneffect_type": towneffect_type.value})

    async def query_get_cargo_name(self, cargo_type: CargoType) -> str:
        """Get the name of the cargo type."""
        return await self.control.query("get_cargo_name", params={"cargo_type": cargo_type})

    async def query_get_cargo_label(self, cargo_type: CargoType) -> str:
        """Gets the string representation of the cargo label."""
        return await self.control.query("get_cargo_label", params={"cargo_type": cargo_type})

    async def query_is_freight(self, cargo_type: CargoType) -> bool:
        """Checks whether the give cargo is a freight or not."""
        return await self.control.query("is_freight", params={"cargo_type": cargo_type})

    async def query_has_cargo_class(self, cargo_type: CargoType, cargo_class: CargoClass) -> bool:
        """Check if this cargo is in the requested cargo class."""
        return await self.control.query("has_cargo_class", params={"cargo_type": cargo_type, "cargo_class": cargo_class.value})

    async def query_get_town_effect(self, cargo_type: CargoType) -> TownEffect:
        """Get the effect this cargo has on a town."""
        result = await self.control.query("get_town_effect", params={"cargo_type": cargo_type})
        return TownEffect(result)

    async def query_get_cargo_income(self, cargo_type: CargoType, distance: int, days_in_transit: int) -> Money:
        """Get the income for transporting a piece of cargo over the given distance within the specified time."""
        return await self.control.query("get_cargo_income", params={"cargo_type": cargo_type, "distance": distance, "days_in_transit": days_in_transit})

    async def query_get_distribution_type(self, cargo_type: CargoType) -> DistributionType:
        """Get the cargo distribution type for a cargo."""
        result = await self.control.query("get_distribution_type", params={"cargo_type": cargo_type})
        return DistributionType(result)

    async def query_get_weight(self, cargo_type: CargoType, amount: int) -> int:
        """Get the weight in tonnes for the given amount of cargo for the specified type."""
        return await self.control.query("get_weight", params={"cargo_type": cargo_type, "amount": amount})


class BaseReq:

    control: OpenttdControl

    def __init__(self, control: OpenttdControl) -> None:
        self.control = control

    async def rand(self) -> int:
        """Get a random value."""
        return await self.control.query("rand")

    async def rand_item(self, unused_param: int) -> int:
        """Get a random value."""
        return await self.control.query("rand_item", params={"unused_param": unused_param})

    async def rand_range(self, max: int) -> int:
        """Get a random value in a range."""
        return await self.control.query("rand_range", params={"max": max})

    async def rand_range_item(self, unused_param: int, max: int) -> int:
        """Get a random value in a range."""
        return await self.control.query("rand_range_item", params={"unused_param": unused_param, "max": max})

    async def chance(self, out: int, max: int) -> bool:
        """Returns approximately out times true when called max times."""
        return await self.control.query("chance", params={"out": out, "max": max})

    async def chance_item(self, unused_param: int, out: int, max: int) -> bool:
        """Returns approximately out times true when called max times."""
        return await self.control.query("chance_item", params={"unused_param": unused_param, "out": out, "max": max})


class DateReq:

    control: OpenttdControl

    def __init__(self, control: OpenttdControl) -> None:
        self.control = control

    async def query_is_valid_date(self, date: DateType) -> bool:
        """Validates if a date value represent a valid date."""
        return await self.control.query("is_valid_date", params={"date": date})

    async def query_get_current_date(self) -> DateType:
        """Get the current date."""
        return await self.control.query("get_current_date")

    async def query_get_year(self, date: DateType) -> int:
        """Get the year of the given date."""
        return await self.control.query("get_year", params={"date": date})

    async def query_get_month(self, date: DateType) -> int:
        """Get the month of the given date."""
        return await self.control.query("get_month", params={"date": date})

    async def query_get_day_of_month(self, date: DateType) -> int:
        """Get the day (of the month) of the given date."""
        return await self.control.query("get_day_of_month", params={"date": date})

    async def query_get_date(self, year: int, month: int, day_of_month: int) -> DateType:
        """Get the date given a year, month and day of month."""
        return await self.control.query("get_date", params={"year": year, "month": month, "day_of_month": day_of_month})


class ErrorReq:

    control: OpenttdControl

    def __init__(self, control: OpenttdControl) -> None:
        self.control = control

    async def query_get_error_category(self) -> ErrorCategories:
        """Check the membership of the last thrown error."""
        result = await self.control.query("get_error_category")
        return ErrorCategories(result)

    async def query_get_last_error(self) -> int:
        """Get the last error."""
        return await self.control.query("get_last_error")

    async def query_get_last_error_string(self) -> str:
        """Get the last error in string format."""
        return await self.control.query("get_last_error_string")


class LogReq:

    control: OpenttdControl

    def __init__(self, control: OpenttdControl) -> None:
        self.control = control

    async def info(self, message: str) -> None:
        """Print an Info message to the logs."""
        return await self.control.query("log_info", params={"message": message})

    async def warning(self, message: str) -> None:
        """Print a Warning message to the logs."""
        return await self.control.query("log_warning", params={"message": message})

    async def error(self, message: str) -> None:
        """Print an Error message to the logs."""
        return await self.control.query("log_error", params={"message": message})


class MapReq:

    control: OpenttdControl

    def __init__(self, control: OpenttdControl) -> None:
        self.control = control

    async def query_is_valid_tile(self, tile: TileIndex) -> bool:
        """Checks whether the given tile is valid."""
        return await self.control.query("is_valid_tile", params={"tile": tile})

    async def query_get_map_size(self) -> int:
        """Gets the number of tiles in the map."""
        return await self.control.query("get_map_size")

    async def query_get_map_size_x(self) -> int:
        """Gets the amount of tiles along the SW and NE border."""
        return await self.control.query("get_map_size_x")

    async def query_get_map_size_y(self) -> int:
        """Gets the amount of tiles along the SE and NW border."""
        return await self.control.query("get_map_size_y")

    async def query_get_tile_x(self, tile: TileIndex) -> int:
        """Gets the place along the SW/NE border (X-value)."""
        return await self.control.query("get_tile_x", params={"tile": tile})

    async def query_get_tile_y(self, tile: TileIndex) -> int:
        """Gets the place along the SE/NW border (Y-value)."""
        return await self.control.query("get_tile_y", params={"tile": tile})

    async def query_get_tile_index(self, x: int, y: int) -> TileIndex:
        """Gets the TileIndex given a x,y-coordinate."""
        return await self.control.query("get_tile_index", params={"x": x, "y": y})

    async def query_distance_manhattan(self, tile_from: TileIndex, tile_to: TileIndex) -> int:
        """Calculates the Manhattan distance between two tiles."""
        return await self.control.query("distance_manhattan", params={"tile_from": tile_from, "tile_to": tile_to})

    async def query_distance_max(self, tile_from: TileIndex, tile_to: TileIndex) -> int:
        """Calculates the distance between two tiles via 1D calculation."""
        return await self.control.query("distance_max", params={"tile_from": tile_from, "tile_to": tile_to})

    async def query_distance_square(self, tile_from: TileIndex, tile_to: TileIndex) -> int:
        """The squared distance between the two tiles."""
        return await self.control.query("distance_square", params={"tile_from": tile_from, "tile_to": tile_to})

    async def query_distance_from_edge(self, tile: TileIndex) -> int:
        """Calculates the shortest distance to the edge."""
        return await self.control.query("distance_from_edge", params={"tile": tile})


class BaseStationReq:

    control: OpenttdControl

    def __init__(self, control: OpenttdControl) -> None:
        self.control = control

    async def query_is_valid_base_station(self, station_id: StationID) -> bool:
        """Checks whether the given basestation is valid and owned by you."""
        return await self.control.query("is_valid_base_station", params={"station_id": station_id})

    async def query_get_name(self, station_id: StationID) -> str:
        """Get the name of a basestation."""
        return await self.control.query("get_name", params={"station_id": station_id})

    async def set_name(self, station_id: StationID, name: str) -> bool:
        """Set the name this basestation."""
        return await self.control.query("set_name", params={"station_id": station_id, "name": name})

    async def query_get_location(self, station_id: StationID) -> TileIndex:
        """Get the current location of a basestation."""
        return await self.control.query("get_location", params={"station_id": station_id})

    async def query_get_construction_date(self, station_id: StationID) -> int:
        """Get the last calendar-date a station part was added to this station."""
        return await self.control.query("get_construction_date", params={"station_id": station_id})


class EngineReq:

    control: OpenttdControl

    def __init__(self, control: OpenttdControl) -> None:
        self.control = control

    async def query_is_valid_engine(self, engine_id: EngineID) -> bool:
        """Checks whether the given engine type is valid."""
        return await self.control.query("is_valid_engine", params={"engine_id": engine_id})

    async def query_is_buildable(self, engine_id: EngineID) -> bool:
        """Checks whether the given engine type is buildable for a company."""
        return await self.control.query("is_buildable", params={"engine_id": engine_id})

    async def query_get_name(self, engine_id: EngineID) -> str:
        """Get the name of an engine."""
        return await self.control.query("get_name", params={"engine_id": engine_id})

    async def query_get_cargo_type(self, engine_id: EngineID) -> CargoType:
        """Get the cargo-type of an engine."""
        return await self.control.query("get_cargo_type", params={"engine_id": engine_id})

    async def query_can_refit_cargo(self, engine_id: EngineID, cargo_type: CargoType) -> bool:
        """Check if the cargo of an engine can be refitted to your requested."""
        return await self.control.query("can_refit_cargo", params={"engine_id": engine_id, "cargo_type": cargo_type})

    async def query_can_pull_cargo(self, engine_id: EngineID, cargo_type: CargoType) -> bool:
        """Check if the engine can pull a wagon with the given cargo."""
        return await self.control.query("can_pull_cargo", params={"engine_id": engine_id, "cargo_type": cargo_type})

    async def query_get_capacity(self, engine_id: EngineID) -> int:
        """Get the capacity of an engine."""
        return await self.control.query("get_capacity", params={"engine_id": engine_id})

    async def query_get_reliability(self, engine_id: EngineID) -> int:
        """Get the reliability of an engine."""
        return await self.control.query("get_reliability", params={"engine_id": engine_id})

    async def query_get_max_speed(self, engine_id: EngineID) -> int:
        """Get the maximum speed of an engine."""
        return await self.control.query("get_max_speed", params={"engine_id": engine_id})

    async def query_get_engine_price(self, engine_id: EngineID) -> Money:
        """Get the new cost of an engine."""
        return await self.control.query("get_engine_price", params={"engine_id": engine_id})

    async def query_get_max_age(self, engine_id: EngineID) -> int:
        """Get the maximum age of a brand new engine."""
        return await self.control.query("get_max_age", params={"engine_id": engine_id})

    async def query_get_running_cost(self, engine_id: EngineID) -> Money:
        """Get the running cost of an engine."""
        return await self.control.query("get_running_cost", params={"engine_id": engine_id})

    async def query_get_power(self, engine_id: EngineID) -> int:
        """Get the power of an engine."""
        return await self.control.query("get_power", params={"engine_id": engine_id})

    async def query_get_weight(self, engine_id: EngineID) -> int:
        """Get the weight of an engine."""
        return await self.control.query("get_weight", params={"engine_id": engine_id})

    async def query_get_max_tractive_effort(self, engine_id: EngineID) -> int:
        """Get the maximum tractive effort of an engine."""
        return await self.control.query("get_max_tractive_effort", params={"engine_id": engine_id})

    async def query_get_design_date(self, engine_id: EngineID) -> int:
        """Get the calendar-date this engine was designed."""
        return await self.control.query("get_design_date", params={"engine_id": engine_id})

    async def query_get_vehicle_type(self, engine_id: EngineID) -> VehicleType:
        """Get the type of an engine."""
        result = await self.control.query("get_vehicle_type", params={"engine_id": engine_id})
        return VehicleType(result)

    async def query_is_wagon(self, engine_id: EngineID) -> bool:
        """Check if an engine is a wagon."""
        return await self.control.query("is_wagon", params={"engine_id": engine_id})

    async def query_can_run_on_rail(self, engine_id: EngineID, track_rail_type: RailType) -> bool:
        """Check if a train vehicle can run on a RailType."""
        return await self.control.query("can_run_on_rail", params={"engine_id": engine_id, "track_rail_type": track_rail_type})

    async def query_has_power_on_rail(self, engine_id: EngineID, track_rail_type: RailType) -> bool:
        """Check if a train engine has power on a RailType."""
        return await self.control.query("has_power_on_rail", params={"engine_id": engine_id, "track_rail_type": track_rail_type})

    async def query_can_run_on_road(self, engine_id: EngineID, road_type: RoadType) -> bool:
        """Check if a road vehicle can run on a RoadType."""
        return await self.control.query("can_run_on_road", params={"engine_id": engine_id, "road_type": road_type})

    async def query_has_power_on_road(self, engine_id: EngineID, road_type: RoadType) -> bool:
        """Check if a road vehicle has power on a RoadType."""
        return await self.control.query("has_power_on_road", params={"engine_id": engine_id, "road_type": road_type})

    async def query_get_road_type(self, engine_id: EngineID) -> RoadType:
        """Get the RoadType of the engine."""
        return await self.control.query("get_road_type", params={"engine_id": engine_id})

    async def query_get_rail_type(self, engine_id: EngineID) -> RailType:
        """Get the first RailType of the engine."""
        return await self.control.query("get_rail_type", params={"engine_id": engine_id})

    async def query_is_articulated(self, engine_id: EngineID) -> bool:
        """Check if the engine is articulated."""
        return await self.control.query("is_articulated", params={"engine_id": engine_id})

    async def query_get_plane_type(self, engine_id: EngineID) -> PlaneType:
        """Get the PlaneType of the engine."""
        result = await self.control.query("get_plane_type", params={"engine_id": engine_id})
        return PlaneType(result)

    async def query_get_maximum_order_distance(self, engine_id: EngineID) -> int:
        """Get the maximum allowed distance between two orders for an engine."""
        return await self.control.query("get_maximum_order_distance", params={"engine_id": engine_id})


class GameSettingsReq:

    control: OpenttdControl

    def __init__(self, control: OpenttdControl) -> None:
        self.control = control

    async def query_is_valid(self, setting: str) -> bool:
        """Is the given game setting a valid setting for this instance of OpenTTD?"""
        return await self.control.query("is_valid", params={"setting": setting})

    async def query_get_value(self, setting: str) -> int:
        """Gets the value of the game setting."""
        return await self.control.query("get_value", params={"setting": setting})

    async def query_is_disabled_vehicle_type(self, vehicle_type: VehicleType) -> bool:
        """Checks whether the given vehicle-type is disabled for companies."""
        return await self.control.query("is_disabled_vehicle_type", params={"vehicle_type": vehicle_type.value})


class SignReq:

    control: OpenttdControl

    def __init__(self, control: OpenttdControl) -> None:
        self.control = control

    async def query_is_valid_sign(self, sign_id: SignID) -> bool:
        """Checks whether the given sign index is valid."""
        return await self.control.query("is_valid_sign", params={"sign_id": sign_id})

    async def set_sign_name(self, sign_id: SignID, name: str) -> bool:
        """Set the name of a sign."""
        return await self.control.query("set_sign_name", params={"sign_id": sign_id, "name": name})

    async def query_get_sign_name(self, sign_id: SignID) -> str:
        """Get the name of the sign."""
        return await self.control.query("get_sign_name", params={"sign_id": sign_id})

    async def query_get_sign_location(self, sign_id: SignID) -> TileIndex:
        """Gets the location of the sign."""
        return await self.control.query("get_sign_location", params={"sign_id": sign_id})

    async def build_sign(self, location: TileIndex, name: str) -> SignID:
        """Builds a sign on the map."""
        return await self.control.query("build_sign", params={"location": location, "name": name})

    async def remove_sign(self, sign_id: SignID) -> bool:
        """Removes a sign from the map."""
        return await self.control.query("remove_sign", params={"sign_id": sign_id})


class SubsidyReq:

    control: OpenttdControl

    def __init__(self, control: OpenttdControl) -> None:
        self.control = control

    async def query_is_valid_subsidy(self, subsidy_id: SubsidyID) -> bool:
        """Check whether this is a valid SubsidyID."""
        return await self.control.query("is_valid_subsidy", params={"subsidy_id": subsidy_id})

    async def query_is_awarded(self, subsidy_id: SubsidyID) -> bool:
        """Checks whether this subsidy is already awarded to some company."""
        return await self.control.query("is_awarded", params={"subsidy_id": subsidy_id})

    async def query_get_awarded_to(self, subsidy_id: SubsidyID) -> CompanyID:
        """Get the company index of the company this subsidy is awarded to."""
        return await self.control.query("get_awarded_to", params={"subsidy_id": subsidy_id})

    async def query_get_expire_date(self, subsidy_id: SubsidyID) -> int:
        """Get the economy-date this subsidy expires."""
        return await self.control.query("get_expire_date", params={"subsidy_id": subsidy_id})

    async def query_get_cargo_type(self, subsidy_id: SubsidyID) -> CargoType:
        """Get the cargo type that has to be transported in order to be awarded this subsidy."""
        return await self.control.query("get_cargo_type", params={"subsidy_id": subsidy_id})

    async def query_get_source_type(self, subsidy_id: SubsidyID) -> SubsidyParticipantType:
        """Returns the type of source of subsidy."""
        result = await self.control.query("get_source_type", params={"subsidy_id": subsidy_id})
        return SubsidyParticipantType(result)

    async def query_get_source_index(self, subsidy_id: SubsidyID) -> int:
        """Return the source IndustryID/TownID the subsidy is for."""
        return await self.control.query("get_source_index", params={"subsidy_id": subsidy_id})

    async def query_get_destination_type(self, subsidy_id: SubsidyID) -> SubsidyParticipantType:
        """Returns the type of destination of subsidy."""
        result = await self.control.query("get_destination_type", params={"subsidy_id": subsidy_id})
        return SubsidyParticipantType(result)

    async def query_get_destination_index(self, subsidy_id: SubsidyID) -> int:
        """Return the destination IndustryID/TownID the subsidy is for."""
        return await self.control.query("get_destination_index", params={"subsidy_id": subsidy_id})


class TunnelReq:

    control: OpenttdControl

    def __init__(self, control: OpenttdControl) -> None:
        self.control = control

    async def query_is_tunnel_tile(self, tile: TileIndex) -> bool:
        """Checks whether the given tile is actually a tunnel entrance or exit."""
        return await self.control.query("is_tunnel_tile", params={"tile": tile})

    async def query_get_other_tunnel_end(self, tile: TileIndex) -> TileIndex:
        """Get the tile that is on the other end of a tunnel starting at tile."""
        return await self.control.query("get_other_tunnel_end", params={"tile": tile})


class NewGRFReq:

    control: OpenttdControl

    def __init__(self, control: OpenttdControl) -> None:
        self.control = control

    async def query_is_loaded(self, grf_id: int) -> bool:
        """Check if the given NewGRF is loaded."""
        return await self.control.query("is_loaded", params={"grf_id": grf_id})


class InfrastructureReq:

    control: OpenttdControl

    def __init__(self, control: OpenttdControl) -> None:
        self.control = control

    async def query_get_road_count(self, roadtype: RoadType) -> int:
        """Get the number of road pieces you have built."""
        return await self.control.query("get_road_count", params={"roadtype": roadtype})

    async def query_get_rail_count(self, railtype: RailType) -> int:
        """Get the number of rail pieces you have built."""
        return await self.control.query("get_rail_count", params={"railtype": railtype})

    async def query_get_bridge_count(self, bridge_type: BridgeType) -> int:
        """Get the number of bridges you have built."""
        return await self.control.query("get_bridge_count", params={"bridge_type": bridge_type})

    async def query_get_tunnel_count(self) -> int:
        """Get the number of tunnels you have built."""
        return await self.control.query("get_tunnel_count")

    async def query_get_signal_count(self) -> int:
        """Get the number of signals you have built."""
        return await self.control.query("get_signal_count")

    async def query_get_station_count(self) -> int:
        """Get the number of stations you have built."""
        return await self.control.query("get_station_count")


class StationReq(BaseStationReq):

    def __init__(self, control: OpenttdControl) -> None:
        super().__init__(control)


class WaypointReq(BaseStationReq):

    def __init__(self, control: OpenttdControl) -> None:
        super().__init__(control)

    async def query_is_valid_waypoint(self, waypoint_id: StationID) -> bool:
        """Checks whether the given waypoint is valid and owned by you."""
        return await self.control.query("is_valid_waypoint", params={"waypoint_id": waypoint_id})

    async def query_get_waypoint_id(self, tile: TileIndex) -> StationID:
        """Get the StationID of a tile, if there is a waypoint."""
        return await self.control.query("get_waypoint_id", params={"tile": tile})

    async def query_has_waypoint_type(self, waypoint_id: StationID, waypoint_type: WaypointType) -> bool:
        """Check if any part of the waypoint contains a waypoint of the type waypoint_type."""
        return await self.control.query("has_waypoint_type", params={"waypoint_id": waypoint_id, "waypoint_type": waypoint_type.value})


class GroupReq:

    control: OpenttdControl

    def __init__(self, control: OpenttdControl) -> None:
        self.control = control

    async def query_is_valid_group(self, group_id: GroupID) -> bool:
        """Checks whether the given group is valid."""
        return await self.control.query("is_valid_group", params={"group_id": group_id})

    async def create_group(self, vehicle_type: VehicleType, parent_group_id: GroupID) -> GroupID:
        """Create a new group."""
        return await self.control.query("create_group", params={"vehicle_type": vehicle_type.value, "parent_group_id": parent_group_id})

    async def delete_group(self, group_id: GroupID) -> bool:
        """Delete the given group."""
        return await self.control.query("delete_group", params={"group_id": group_id})

    async def query_get_vehicle_type(self, group_id: GroupID) -> VehicleType:
        """Get the vehicle type of a group."""
        result = await self.control.query("get_vehicle_type", params={"group_id": group_id})
        return VehicleType(result)

    async def set_group_name(self, group_id: GroupID, name: str) -> bool:
        """Set the name of a group."""
        return await self.control.query("set_group_name", params={"group_id": group_id, "name": name})

    async def query_get_group_name(self, group_id: GroupID) -> str:
        """Get the name of a group."""
        return await self.control.query("get_group_name", params={"group_id": group_id})

    async def set_parent(self, group_id: GroupID, parent_group_id: GroupID) -> bool:
        """Set parent group of a group."""
        return await self.control.query("set_parent", params={"group_id": group_id, "parent_group_id": parent_group_id})

    async def query_get_parent(self, group_id: GroupID) -> GroupID:
        """Get parent group of a group."""
        return await self.control.query("get_parent", params={"group_id": group_id})

    async def enable_auto_replace_protection(self, group_id: GroupID, enable: bool) -> bool:
        """Enable or disable autoreplace protected."""
        return await self.control.query("enable_auto_replace_protection", params={"group_id": group_id, "enable": enable})

    async def query_get_auto_replace_protection(self, group_id: GroupID) -> bool:
        """Get the autoreplace protection status."""
        return await self.control.query("get_auto_replace_protection", params={"group_id": group_id})

    async def query_get_num_engines(self, group_id: GroupID, engine_id: EngineID) -> int:
        """Get the number of engines in a given group."""
        return await self.control.query("get_num_engines", params={"group_id": group_id, "engine_id": engine_id})

    async def query_get_num_vehicles(self, group_id: GroupID, vehicle_type: VehicleType) -> int:
        """Get the total number of vehicles in a given group and its sub-groups."""
        return await self.control.query("get_num_vehicles", params={"group_id": group_id, "vehicle_type": vehicle_type.value})

    async def move_vehicle(self, group_id: GroupID, vehicle_id: VehicleID) -> bool:
        """Move a vehicle to a group."""
        return await self.control.query("move_vehicle", params={"group_id": group_id, "vehicle_id": vehicle_id})

    async def query_get_profit_this_year(self, group_id: GroupID) -> Money:
        """Get the current profit of a group."""
        return await self.control.query("get_profit_this_year", params={"group_id": group_id})

    async def query_get_profit_last_year(self, group_id: GroupID) -> Money:
        """Get the profit of last year of a group."""
        return await self.control.query("get_profit_last_year", params={"group_id": group_id})

    async def query_get_current_usage(self, group_id: GroupID) -> int:
        """Get the current vehicle usage of a group."""
        return await self.control.query("get_current_usage", params={"group_id": group_id})


class MarineReq:

    control: OpenttdControl

    def __init__(self, control: OpenttdControl) -> None:
        self.control = control

    async def query_is_water_depot_tile(self, tile: TileIndex) -> bool:
        """Checks whether the given tile is actually a tile with a water depot."""
        return await self.control.query("is_water_depot_tile", params={"tile": tile})

    async def query_is_dock_tile(self, tile: TileIndex) -> bool:
        """Checks whether the given tile is actually a tile with a dock."""
        return await self.control.query("is_dock_tile", params={"tile": tile})

    async def query_is_buoy_tile(self, tile: TileIndex) -> bool:
        """Checks whether the given tile is actually a tile with a buoy."""
        return await self.control.query("is_buoy_tile", params={"tile": tile})

    async def query_is_lock_tile(self, tile: TileIndex) -> bool:
        """Checks whether the given tile is actually a tile with a lock."""
        return await self.control.query("is_lock_tile", params={"tile": tile})

    async def query_is_canal_tile(self, tile: TileIndex) -> bool:
        """Checks whether the given tile is actually a tile with a canal."""
        return await self.control.query("is_canal_tile", params={"tile": tile})

    async def query_are_water_tiles_connected(self, tile_from: TileIndex, tile_to: TileIndex) -> bool:
        """Checks whether the given tiles are directly connected."""
        return await self.control.query("are_water_tiles_connected", params={"tile_from": tile_from, "tile_to": tile_to})

    async def build_water_depot(self, tile: TileIndex, front: TileIndex) -> bool:
        """Builds a water depot on tile."""
        return await self.control.query("build_water_depot", params={"tile": tile, "front": front})

    async def build_dock(self, tile: TileIndex, station_id: StationID) -> bool:
        """Builds a dock where tile is the tile still on land."""
        return await self.control.query("build_dock", params={"tile": tile, "station_id": station_id})

    async def build_buoy(self, tile: TileIndex) -> bool:
        """Builds a buoy on tile."""
        return await self.control.query("build_buoy", params={"tile": tile})

    async def build_lock(self, tile: TileIndex) -> bool:
        """Builds a lock on tile."""
        return await self.control.query("build_lock", params={"tile": tile})

    async def build_canal(self, tile: TileIndex) -> bool:
        """Builds a canal on tile."""
        return await self.control.query("build_canal", params={"tile": tile})

    async def remove_water_depot(self, tile: TileIndex) -> bool:
        """Removes a water depot."""
        return await self.control.query("remove_water_depot", params={"tile": tile})

    async def remove_dock(self, tile: TileIndex) -> bool:
        """Removes a dock."""
        return await self.control.query("remove_dock", params={"tile": tile})

    async def remove_buoy(self, tile: TileIndex) -> bool:
        """Removes a buoy."""
        return await self.control.query("remove_buoy", params={"tile": tile})

    async def remove_lock(self, tile: TileIndex) -> bool:
        """Removes a lock."""
        return await self.control.query("remove_lock", params={"tile": tile})

    async def remove_canal(self, tile: TileIndex) -> bool:
        """Removes a canal."""
        return await self.control.query("remove_canal", params={"tile": tile})

    async def query_get_build_cost(self, build_type: BuildType) -> Money:
        """Get the baseprice of building a water-related object."""
        return await self.control.query("get_build_cost", params={"build_type": build_type.value})


class ObjectTypeReq:

    control: OpenttdControl

    def __init__(self, control: OpenttdControl) -> None:
        self.control = control

    async def query_is_valid_object_type(self, object_type: ObjectType) -> bool:
        """Checks whether the given object-type is valid."""
        return await self.control.query("is_valid_object_type", params={"object_type": object_type})

    async def query_get_object_type_name(self, object_type: ObjectType) -> str:
        """Get the name of an object-type."""
        return await self.control.query("get_object_type_name", params={"object_type": object_type})

    async def query_get_views(self, object_type: ObjectType) -> int:
        """Get the number of views for an object-type."""
        return await self.control.query("get_views", params={"object_type": object_type})

    async def build_object(self, object_type: ObjectType, view: int, tile: TileIndex) -> bool:
        """Build an object of the specified type."""
        return await self.control.query("build_object", params={"object_type": object_type, "view": view, "tile": tile})

    async def resolve_newgrf_id(self, grfid: int, grf_local_id: int) -> ObjectType:
        """Get a specific object-type from a grf."""
        return await self.control.query("resolve_newgrf_id", params={"grfid": grfid, "grf_local_id": grf_local_id})
