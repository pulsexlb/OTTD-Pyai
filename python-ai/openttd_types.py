from enum import Enum

VehicleID  = type('VehicleID',  (int,), {})
StationID  = type('StationID',  (int,), {})
EngineID   = type('EngineID',   (int,), {})
CompanyID  = type('CompanyID',  (int,), {})
IndustryID = type('IndustryID', (int,), {})
SubsidyID  = type('SubsidyID',  (int,), {})
TownID     = type('TownID',     (int,), {})
TileIndex  = type('TileIndex',  (int,), {})


# See: https://docs.openttd.org/gs-api/classGSEventVehicleCrashed#ac59fab58c99a5530a9340a1d404560f1
class CrashReason(Enum):
    CRASH_TRAIN = 0  # Two trains collided.
    CRASH_RV_LEVEL_CROSSING = 1  # Road vehicle got under a train.
    CRASH_RV_UFO = 2  # Road vehicle got under a landing ufo.
    CRASH_PLANE_LANDING = 3  # Plane crashed on landing.
    CRASH_AIRCRAFT_NO_AIRPORT = 4  # Aircraft crashed after it found not a single airport for landing.
    CRASH_FLOODED = 5  # Vehicle was flooded. 
