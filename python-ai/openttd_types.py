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
