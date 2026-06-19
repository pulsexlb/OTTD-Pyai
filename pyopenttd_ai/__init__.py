import sys
import os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))


import asyncio
from control import OpenttdControl
from openttd_types import CompanyID
from reqst import AccountingReq, AirportReq, BaseReq,\
        BaseStationReq, BridgeReq, CargoReq, CompanyReq,\
        DateReq, EngineReq, ErrorReq, GameSettingsReq, GroupReq,\
        IndustryReq, IndustryTypeReq, InfrastructureReq, LogReq,\
        MapReq, MarineReq, NewGRFReq, ObjectTypeReq, OrderReq, RailReq,\
        RoadReq, SignReq, StationReq, SubsidyReq, TileReq, TownReq, TunnelReq, VehicleReq, WaypointReq

class OpenttdAI:
    control: OpenttdControl

    company: CompanyReq
    accounting: AccountingReq
    airport: AirportReq
    bridge: BridgeReq
    cargo: CargoReq
    base: BaseReq
    date: DateReq
    error: ErrorReq
    log: LogReq
    game_map: MapReq
    base_station: BaseStationReq
    engine: EngineReq
    game_settings: GameSettingsReq
    sign: SignReq
    subsidy: SubsidyReq
    tunnel: TunnelReq
    newgrf: NewGRFReq
    infrastructure: InfrastructureReq
    station: StationReq
    waypoint: WaypointReq
    group: GroupReq
    marine: MarineReq
    object_type: ObjectTypeReq
    industry: IndustryReq
    industry_type: IndustryTypeReq
    town: TownReq
    order: OrderReq
    vehicle: VehicleReq
    rail: RailReq
    road: RoadReq
    tile: TileReq

    def __init__(self, control: OpenttdControl) -> None:
        self.control = control
        self.company = CompanyReq(control)
        self.accounting = AccountingReq(control)
        self.airport = AirportReq(control)
        self.bridge = BridgeReq(control)
        self.cargo = CargoReq(control)
        self.base = BaseReq(control)
        self.date = DateReq(control)
        self.error = ErrorReq(control)
        self.log = LogReq(control)
        self.game_map = MapReq(control)
        self.base_station = BaseStationReq(control)
        self.engine = EngineReq(control)
        self.game_settings = GameSettingsReq(control)
        self.sign = SignReq(control)
        self.subsidy = SubsidyReq(control)
        self.tunnel = TunnelReq(control)
        self.newgrf = NewGRFReq(control)
        self.infrastructure = InfrastructureReq(control)
        self.station = StationReq(control)
        self.waypoint = WaypointReq(control)
        self.group = GroupReq(control)
        self.marine = MarineReq(control)
        self.object_type = ObjectTypeReq(control)
        self.industry = IndustryReq(control)
        self.industry_type = IndustryTypeReq(control)
        self.town = TownReq(control)
        self.order = OrderReq(control)
        self.vehicle = VehicleReq(control)
        self.rail = RailReq(control)
        self.road = RoadReq(control)
        self.tile = TileReq(control)

    async def run(self):
        while True:
            if self.control.admin.authenticated:
                break
            await asyncio.sleep(0.1)

