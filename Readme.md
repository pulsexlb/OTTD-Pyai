English | [简体中文](./Readme_zh.md)

# PyOpenTTD AI

**PyOpenTTD AI** is an interface project that allows developers to write OpenTTD AI in Python. Built on top of the OpenTTD Admin Port protocol, it wraps in-game company control, data queries, and event subscriptions into an asynchronous Python API, enabling you to quickly build and iterate on your own AI strategies using familiar Python syntax.

---

## Important Notes

This project:
- **Is extremely unstable**: The OpenTTD Admin Port protocol was not designed for stable AI control, and the encapsulation provided here is still incomplete. Unexpected disconnections, data loss, or abnormal behavior may occur during use.
- **Depends on the Admin Port**: Communication is entirely through the server’s `admin_port`. Therefore, this project can only be used in multiplayer games.

---

## Quick Start

### Prerequisites

- Place the `openttd-ai` folder under `/path/to/your/openttd/ai`
- Place the `openttd-script` folder under `/path/to/your/openttd/game`
- Start a new multiplayer game, select `OtherAIGS` as the game script, and enter the game
- Open the game console and type `start_ai OtherAI` to start the AI

### Minimal Example

```python
from pyopenttd_ai import OpenttdAI
from pyopenttd_ai.control import OpenttdControl, ConnectionSetting
import asyncio


class AI(OpenttdAI):
    def __init__(self, control: OpenttdControl) -> None:
        super().__init__(control)

    async def run(self):
        # Wait for authentication to complete
        while True:
            if self.control.admin.authenticated:
                break
            await asyncio.sleep(0.1)

        # Start event handling and query tasks
        handle_event = asyncio.create_task(self.handle_events())
        query_event = asyncio.create_task(self.send_query())
        await asyncio.gather(handle_event, query_event)

    async def handle_events(self):
        """Pop and process game events one by one from the event stack"""
        while True:
            events = self.control.events
            while True:
                event = events.pop()
                if event is None:
                    break
                print(f"Handle event: {type(event).__name__} -> {event.__dict__}")
            await asyncio.sleep(0.5)

    async def send_query(self):
        """Use the API to query the company name and then modify it"""
        result = await self.company.query_name()
        print(f"Handle query result: query_name -> {result}")
        await asyncio.sleep(1)
        result = await self.company.set_name("Pyai-OTTD")
        print(f"Handle query result: set_name -> {result}")


# Connection settings
connection_setting = ConnectionSetting(
    ip_address="127.0.0.1",          # Server IP
    port_num=3977,                   # Admin port number
    password="123456",               # Admin port password
    connection_name="OtherAIAdmin",  # Connection name (appears in server logs)
    connection_version="15.3"        # Server OpenTTD version
)

company_id = 1  # Your AI company ID (run `companies` in the server console; #num minus 1)


async def main():
    control = OpenttdControl(company_id, connection_setting)
    control_task = asyncio.create_task(control.run())
    ai = AI(control)
    ai_task = asyncio.create_task(ai.run())
    await asyncio.gather(control_task, ai_task)


if __name__ == "__main__":
    asyncio.run(main())
```

> For the full runnable code, see [`example.py`](./example.py).

---

## API Calls

All game queries and operations are performed through a series of asynchronous methods on objects such as `self.company`, `self.station`, `self.vehicle`, etc. Each method returns an awaitable object, and results are typically game data dictionaries or status codes.

**Examples**:

```python
# Query the current company name
result = await self.company.query_name()
# Returns the current name as a string

# Change the company name to "Pyai-OTTD"
result = await self.company.set_name("Pyai-OTTD")
# Returns 1 on success, 0 on failure
```

The project encapsulates the following API classes, covering most game elements:

| Class | Description |
|-------|-------------|
| `CompanyReq` | Company operations (name, money, color, etc.) |
| `AccountingReq` | Financial data |
| `AirportReq` | Airport construction and management |
| `BridgeReq` | Bridges |
| `CargoReq` | Cargo information |
| `BaseReq` | Basic requests (e.g., ping) |
| `DateReq` | In-game date |
| `ErrorReq` | Error handling |
| `LogReq` | Logging |
| `MapReq` | Map information |
| `BaseStationReq` | Station base class |
| `EngineReq` | Engines / vehicle engines |
| `GameSettingsReq` | Game settings |
| `SignReq` | Signs |
| `SubsidyReq` | Subsidies |
| `TunnelReq` | Tunnels |
| `NewGRFReq` | NewGRF related |
| `InfrastructureReq` | Infrastructure |
| `StationReq` | Stations |
| `WaypointReq` | Waypoints |
| `GroupReq` | Vehicle groups |
| `MarineReq` | Water / ships |
| `ObjectTypeReq` | Object types |
| `IndustryReq` | Industries |
| `IndustryTypeReq` | Industry types |
| `TownReq` | Towns |
| `OrderReq` | Vehicle orders |
| `VehicleReq` | Vehicles |
| `RailReq` | Railways |
| `RoadReq` | Roads |
| `TileReq` | Tiles |

For all available methods and detailed parameters, please refer to the source file [`pyopenttd_ai/reqst.py`](./pyopenttd_ai/reqst.py). It is recommended to consult this file directly during development for the most up-to-date interface definitions.

---

## Game Event Handling

Game events sent by OpenTTD are stored in an **event stack** (`self.control.events`), from which you can retrieve and process them at any time.

**Event processing loop example**:

```python
while True:
    events = self.control.events
    while True:
        event = events.pop()
        if event is None:
            break
        print(f"Handle event: {type(event).__name__} -> {event.__dict__}")
    await asyncio.sleep(0.5)
```

Each call to `pop()` retrieves the earliest event; a return value of `None` indicates the stack is empty.

For all supported event types, see [`pyopenttd_ai/event.py`](./pyopenttd_ai/event.py). This file defines the data fields associated with each event.

---

## Stability Warning & Contributions

- **This project is extremely unstable** – interfaces and behaviour may change without prior notice.  
- It is currently **not suitable** for official competitions, long-running server environments, or any scenario where reliable output is expected.  
- If you encounter problems or are willing to contribute code, tests, or documentation, issues and pull requests are welcome.
