from enum import Enum

type VehicleID = int
type StationID = int
type EngineID = int
type CompanyID = int
type IndustryID = int
type SubsidyID = int
type TownID = int
type TileIndex = int
type Money = int


# See: https://docs.openttd.org/gs-api/classGSEventVehicleCrashed#ac59fab58c99a5530a9340a1d404560f1
class CrashReason(Enum):
    CRASH_TRAIN = 0  # Two trains collided.
    CRASH_RV_LEVEL_CROSSING = 1  # Road vehicle got under a train.
    CRASH_RV_UFO = 2  # Road vehicle got under a landing ufo.
    CRASH_PLANE_LANDING = 3  # Plane crashed on landing.
    CRASH_AIRCRAFT_NO_AIRPORT = 4  # Aircraft crashed after it found not a single airport for landing.
    CRASH_FLOODED = 5  # Vehicle was flooded. 


class Gender(Enum):
    GENDER_MALE = 0  # A male person.
    GENDER_FEMALE = 1  # A female person.
    GENDER_INVALID = 2  # An invalid gender. 


class AirportType(Enum):
    AT_SMALL = 0  # The small airport.
    AT_LARGE = 1  # The large airport.
    AT_METROPOLITAN = 2  # The metropolitan airport.
    AT_INTERNATIONAL = 3  # The international airport.
    AT_COMMUTER = 4  # The commuter airport.
    AT_INTERCON = 5  # The intercontinental airport.
    AT_HELIPORT = 6  # The heliport.
    AT_HELISTATION = 7  # The helistation.
    AT_HELIDEPOT = 8  # The helidepot.
    AT_INVALID = 9  # Invalid airport.


class PlaneType(Enum):
    PT_HELICOPTER = 0  # A helicopter.
    PT_SMALL_PLANE = 1  # A small plane.
    PT_BIG_PLANE = 2  # A big plane.
    PT_INVALID = 3  # An invalid PlaneType.


type BridgeType = int


class VehicleType(Enum):
    VT_RAIL = 0  # Rail type vehicle.
    VT_ROAD = 1  # Road type vehicle (bus / truck).
    VT_WATER = 2  # Water type vehicle.
    VT_AIR = 3  # Air type vehicle.
    VT_INVALID = 255  # An invalid vehicle type.


type CargoType = int


class CargoClass(Enum):
    CC_PASSENGERS = 0  # Passengers.
    CC_MAIL = 1  # Mail.
    CC_EXPRESS = 2  # Express cargo (Goods, Food, Candy, but also possible for passengers).
    CC_ARMOURED = 3  # Armoured cargo (Valuables, Gold, Diamonds).
    CC_BULK = 4  # Bulk cargo (Coal, Grain etc., Ores, Fruit).
    CC_PIECE_GOODS = 5  # Piece goods (Livestock, Wood, Steel, Paper).
    CC_LIQUID = 6  # Liquids (Oil, Water, Rubber).
    CC_REFRIGERATED = 7  # Refrigerated cargo (Food, Fruit).
    CC_HAZARDOUS = 8  # Hazardous cargo (Nuclear Fuel, Explosives, etc.).
    CC_COVERED = 9  # Covered/Sheltered Freight.
    CC_OVERSIZED = 10  # Oversized (stake/flatbed wagon).
    CC_POWDERIZED = 11  # Powderized, moist protected (powder/silo wagon).
    CC_NON_POURABLE = 12  # Non-pourable (open wagon, but not hopper wagon).
    CC_POTABLE = 13  # Potable / food / clean.
    CC_NON_POTABLE = 14  # Non-potable / non-food / dirty.


class TownEffect(Enum):
    TE_NONE = 0  # This cargo has no effect on a town.
    TE_PASSENGERS = 1  # This cargo supplies passengers to a town.
    TE_MAIL = 2  # This cargo supplies mail to a town.
    TE_GOODS = 3  # This cargo supplies goods to a town.
    TE_WATER = 4  # This cargo supplies water to a town.
    TE_FOOD = 5  # This cargo supplies food to a town.


class SpecialCargoType(Enum):
    CT_AUTO_REFIT = 0  # Automatically choose cargo type when doing auto-refitting.
    CT_NO_REFIT = 1  # Do not refit cargo of a vehicle.
    CT_INVALID = 2  # An invalid cargo type.


class DistributionType(Enum):
    DT_MANUAL = 0  # Manual distribution.
    DT_ASYMMETRIC = 1  # Asymmetric distribution.
    DT_SYMMETRIC = 2  # Symmetric distribution.
    INVALID_DISTRIBUTION_TYPE = 3  # Invalid distribution type.


type DateType = int


type RailType = int
type RoadType = int
type SignID = int
type SubsidyID = int


class SubsidyParticipantType(Enum):
    SPT_INDUSTRY = 0  # Subsidy participant is an industry.
    SPT_TOWN = 1  # Subsidy participant is a town.
    SPT_INVALID = 2  # Invalid/unknown participant type.


class WaypointType(Enum):
    WAYPOINT_RAIL = 0  # Rail waypoint.
    WAYPOINT_BUOY = 1  # Buoy.
    WAYPOINT_ANY = 2  # All waypoint types.


type GroupID = int
type ObjectType = int
type IndustryType = int


class CargoAcceptState(Enum):
    CAS_NOT_ACCEPTED = 0  # The CargoType is not accepted by this industry.
    CAS_ACCEPTED = 1  # The industry currently accepts this CargoType.
    CAS_TEMP_REFUSED = 2  # The industry temporarily refuses to accept this CargoType.


class BuildType(Enum):
    BT_DOCK = 0  # Build a dock.
    BT_DEPOT = 1  # Build a ship depot.
    BT_BUOY = 2  # Build a buoy.
    BT_LOCK = 3  # Build a lock.
    BT_CANAL = 4  # Build a canal.


class TownAction(Enum):
    TOWN_ACTION_ADVERTISE_SMALL = 0  # Small advertisement campaign.
    TOWN_ACTION_ADVERTISE_MEDIUM = 1  # Medium advertisement campaign.
    TOWN_ACTION_ADVERTISE_LARGE = 2  # Large advertisement campaign.
    TOWN_ACTION_ROAD_REBUILD = 3  # Rebuild the roads.
    TOWN_ACTION_BUILD_STATUE = 4  # Build a statue.
    TOWN_ACTION_FUND_BUILDINGS = 5  # Fund the creation of extra buildings.
    TOWN_ACTION_BUY_RIGHTS = 6  # Buy exclusive rights.
    TOWN_ACTION_BRIBE = 7  # Bribe the town.


class TownRating(Enum):
    TOWN_RATING_NONE = 0
    TOWN_RATING_APPALLING = 1
    TOWN_RATING_VERY_POOR = 2
    TOWN_RATING_POOR = 3
    TOWN_RATING_MEDIOCRE = 4
    TOWN_RATING_GOOD = 5
    TOWN_RATING_VERY_GOOD = 6
    TOWN_RATING_EXCELLENT = 7
    TOWN_RATING_OUTSTANDING = 8
    TOWN_RATING_INVALID = 9


class RoadLayout(Enum):
    ROAD_LAYOUT_ORIGINAL = 0
    ROAD_LAYOUT_BETTER_ROADS = 1
    ROAD_LAYOUT_2x2 = 2
    ROAD_LAYOUT_3x3 = 3
    ROAD_LAYOUT_RANDOM = 4
    ROAD_LAYOUT_INVALID = 5


class TownSize(Enum):
    TOWN_SIZE_SMALL = 0
    TOWN_SIZE_MEDIUM = 1
    TOWN_SIZE_LARGE = 2
    TOWN_SIZE_INVALID = 3

type OrderPosition = int


class ErrorCategories(Enum):
    ERR_CAT_NONE = 0  # Error messages not related to any category.
    ERR_CAT_GENERAL = 1  # Error messages related to general things.
    ERR_CAT_VEHICLE = 2  # Error messages related to building / maintaining vehicles.
    ERR_CAT_STATION = 3  # Error messages related to building / maintaining stations.
    ERR_CAT_BRIDGE = 4  # Error messages related to building / removing bridges.
    ERR_CAT_TUNNEL = 5  # Error messages related to building / removing tunnels.
    ERR_CAT_TILE = 6  # Error messages related to raising / lowering and demolishing tiles.
    ERR_CAT_SIGN = 7  # Error messages related to building / removing signs.
    ERR_CAT_RAIL = 8  # Error messages related to building / maintaining rails.
    ERR_CAT_ROAD = 9  # Error messages related to building / maintaining roads.
    ERR_CAT_ORDER = 10  # Error messages related to managing orders.
    ERR_CAT_MARINE = 11  # Error messages related to building / removing ships, docks and channels.
    ERR_CAT_WAYPOINT = 12  # Error messages related to building / maintaining waypoints.
    ERR_CAT_BIT_SIZE = 13  # DO NOT USE!
