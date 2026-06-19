"""
Events return from openttd
"""

from typing import Any, Dict, List, Type

from openttd_types import (
    CompanyID,
    CrashReason,
    EngineID,
    IndustryID,
    StationID,
    SubsidyID,
    TileIndex,
    TownID,
    VehicleID,
)


class Event:
    def to_json(self) -> Dict[str, Any]:
        data: Dict[str, Any] = {}
        for attr, value in self.__dict__.items():
            data[attr] = value
        return {"name": type(self).__name__, "data": data}

    @classmethod
    def from_json(cls, data: Dict[str, Any]) -> 'Event':
        name = data.get("name", "")
        raw_data = data.get("data", {})
        event_cls = _EVENT_REGISTRY.get(name)
        if event_cls is None:
            raise ValueError(f"Unknown event name: {name}")
        return event_cls(**raw_data)


_EVENT_REGISTRY: Dict[str, Type[Event]] = {}


def _register(cls: Type[Event]) -> Type[Event]:
    _EVENT_REGISTRY[cls.__name__] = cls
    return cls


@_register
class AircraftDestTooFar(Event):
    vehicle_id: VehicleID

    def __init__(self, vehicle_id: VehicleID) -> None:
        self.vehicle_id = vehicle_id


@_register
class DisasterZeppelinerCleared(Event):
    station_id: StationID

    def __init__(self, station_id: StationID) -> None:
        self.station_id = station_id


@_register
class DisasterZeppelinerCrashed(Event):
    station_id: StationID

    def __init__(self, station_id: StationID) -> None:
        self.station_id = station_id


@_register
class EngineAvailable(Event):
    engine_id: EngineID

    def __init__(self, engine_id: EngineID) -> None:
        self.engine_id = engine_id


@_register
class VehicleAutoReplaced(Event):
    old_vehicle_id: VehicleID
    new_vehicle_id: VehicleID

    def __init__(self, old_vehicle_id: VehicleID, new_vehicle_id: VehicleID) -> None:
        self.old_vehicle_id = old_vehicle_id
        self.new_vehicle_id = new_vehicle_id


@_register
class VehicleLost(Event):
    vehicle_id: VehicleID

    def __init__(self, vehicle_id: VehicleID) -> None:
        self.vehicle_id = vehicle_id


@_register
class VehicleUnprofitable(Event):
    vehicle_id: VehicleID

    def __init__(self, vehicle_id: VehicleID) -> None:
        self.vehicle_id = vehicle_id


@_register
class VehicleWaitingInDepot(Event):
    vehicle_id: VehicleID

    def __init__(self, vehicle_id: VehicleID) -> None:
        self.vehicle_id = vehicle_id


@_register
class CompanyBankrupt(Event):
    company_id: CompanyID

    def __init__(self, company_id: CompanyID) -> None:
        self.company_id = company_id


@_register
class CompanyInTrouble(Event):
    company_id: CompanyID

    def __init__(self, company_id: CompanyID) -> None:
        self.company_id = company_id


@_register
class CompanyMerger(Event):
    old_company_id: CompanyID
    new_company_id: CompanyID

    def __init__(self, old_company_id: CompanyID, new_company_id: CompanyID) -> None:
        self.old_company_id = old_company_id
        self.new_company_id = new_company_id


@_register
class CompanyNew(Event):
    company_id: CompanyID

    def __init__(self, company_id: CompanyID) -> None:
        self.company_id = company_id


@_register
class CompanyRenamed(Event):
    company_id: CompanyID
    new_name: str

    def __init__(self, company_id: CompanyID, name: str) -> None:
        self.company_id = company_id
        self.new_name = name

    def to_json(self) -> Dict[str, Any]:
        return {
            "name": type(self).__name__,
            "data": {
                "company_id": self.company_id,
                "name": self.new_name,
            },
        }


@_register
class ExclusiveTransportRights(Event):
    company_id: CompanyID
    town_id: TownID

    def __init__(self, company_id: CompanyID, town_id: TownID) -> None:
        self.company_id = company_id
        self.town_id = town_id


@_register
class IndustryClose(Event):
    industry_id: IndustryID

    def __init__(self, industry_id: IndustryID) -> None:
        self.industry_id = industry_id


@_register
class IndustryOpen(Event):
    industry_id: IndustryID

    def __init__(self, industry_id: IndustryID) -> None:
        self.industry_id = industry_id


@_register
class PresidentRenamed(Event):
    company_id: CompanyID
    new_name: str

    def __init__(self, company_id: CompanyID, name: str) -> None:
        self.company_id = company_id
        self.new_name = name

    def to_json(self) -> Dict[str, Any]:
        return {
            "name": type(self).__name__,
            "data": {
                "company_id": self.company_id,
                "name": self.new_name,
            },
        }


@_register
class RoadReconstruction(Event):
    company_id: CompanyID
    town_id: TownID

    def __init__(self, company_id: CompanyID, town_id: TownID) -> None:
        self.company_id = company_id
        self.town_id = town_id


@_register
class StationFirstVehicle(Event):
    station_id: StationID
    vehicle_id: VehicleID

    def __init__(self, station_id: StationID, vehicle_id: VehicleID) -> None:
        self.station_id = station_id
        self.vehicle_id = vehicle_id


@_register
class SubsidyAwarded(Event):
    subsidy_id: SubsidyID

    def __init__(self, subsidy_id: SubsidyID) -> None:
        self.subsidy_id = subsidy_id


@_register
class SubsidyExpired(Event):
    subsidy_id: SubsidyID

    def __init__(self, subsidy_id: SubsidyID) -> None:
        self.subsidy_id = subsidy_id


@_register
class SubsidyOffer(Event):
    subsidy_id: SubsidyID

    def __init__(self, subsidy_id: SubsidyID) -> None:
        self.subsidy_id = subsidy_id


@_register
class SubsidyOfferExpired(Event):
    subsidy_id: SubsidyID

    def __init__(self, subsidy_id: SubsidyID) -> None:
        self.subsidy_id = subsidy_id


@_register
class GSTownFounded(Event):
    town_id: TownID

    def __init__(self, town_id: TownID) -> None:
        self.town_id = town_id


@_register
class VehicleCrashed(Event):
    vehicle_id: VehicleID
    crash_site: int
    crash_reason: CrashReason
    victims: int
    vehicle_owner: CompanyID

    def __init__(
        self,
        vehicle_id: VehicleID,
        crash_site: int,
        crash_reason: int,
        victims: TileIndex,
        vehicle_owner: CompanyID,
    ) -> None:
        self.vehicle_id = vehicle_id
        self.crash_site = crash_site
        self.crash_reason = CrashReason(crash_reason)
        self.victims = victims
        self.vehicle_owner = vehicle_owner


class EventQueue:
    """
    A structure that store events witch are going to handle.
    """
    events: List[Event] = []

    def __init__(self) -> None:
        pass

    def push(self, event: Event):
        self.events.append(event)

    def pop(self) -> Event | None:
        if len(self.events) == 0:
            return None
        first = self.events[0]
        del self.events[0]
        return first
