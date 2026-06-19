[English](./Readme.md) | 简体中文

# PyOpenTTD AI

**PyOpenTTD AI** 是一个允许开发者使用 Python 语言编写 OpenTTD AI 的接口项目。它基于 OpenTTD 的 Admin Port 协议，将游戏内的公司控制、数据查询和事件订阅封装为异步 Python API，使你可以用熟悉的 Python 语法快速构建和迭代自己的 AI 策略。

---

## 提醒

该项目：
- **极度不稳定**：由于 OpenTTD Admin Port 协议本身并非为稳定的 AI 控制设计，且本项目对其封装尚不完整，运行过程中可能出现意外断开、数据丢失或行为异常。
- **依赖 Admin Port**：本接口完全通过 OpenTTD 服务端的 `admin_port` 进行通信。因此此项目只能用于联机游戏。

---

## 快速开始

### 前置步骤

- 将`openttd-ai`放在`/path/to/your/openttd/ai`下
- 将`openttd-script`放在`/path/to/your/openttd/game`下
- 开启新的联机游戏，选择`OtherAIGS`作为游戏脚本，并进入游戏
- 打开游戏控制台，输入`start_ai OtherAI`开启ai

### 最小示例

```python
from pyopenttd_ai import OpenttdAI
from pyopenttd_ai.control import OpenttdControl, ConnectionSetting
import asyncio


class AI(OpenttdAI):
    def __init__(self, control: OpenttdControl) -> None:
        super().__init__(control)

    async def run(self):
        # 等待认证完成
        while True:
            if self.control.admin.authenticated:
                break
            await asyncio.sleep(0.1)

        # 启动事件处理与查询任务
        handle_event = asyncio.create_task(self.handle_events())
        query_event = asyncio.create_task(self.send_query())
        await asyncio.gather(handle_event, query_event)

    async def handle_events(self):
        """从事件栈中逐个取出并处理游戏事件"""
        while True:
            events = self.control.events
            while True:
                event = events.pop()
                if event is None:
                    break
                print(f"Handle event: {type(event).__name__} -> {event.__dict__}")
            await asyncio.sleep(0.5)

    async def send_query(self):
        """调用 API 查询公司名称并修改"""
        result = await self.company.query_name()
        print(f"Handle query result: query_name -> {result}")
        await asyncio.sleep(1)
        result = await self.company.set_name("Pyai-OTTD")
        print(f"Handle query result: set_name -> {result}")


# 连接设置
connection_setting = ConnectionSetting(
    ip_address="127.0.0.1",          # 服务器 IP
    port_num=3977,                   # admin_port 端口号
    password="123456",               # admin_port 密码
    connection_name="OtherAIAdmin",  # 连接名称（会显示在服务端日志中）
    connection_version="15.3"        # 服务端 OpenTTD 版本
)

company_id = 1  # 你的 AI 公司 ID（在服务端控制台输入 `companies` 查看，#num 减 1）


async def main():
    control = OpenttdControl(company_id, connection_setting)
    control_task = asyncio.create_task(control.run())
    ai = AI(control)
    ai_task = asyncio.create_task(ai.run())
    await asyncio.gather(control_task, ai_task)


if __name__ == "__main__":
    asyncio.run(main())
```

> 完整可执行代码请见[`example.py`](./example.py)。

---

## API 调用

所有对游戏的查询与操作都通过 `self.company`、`self.station`、`self.vehicle` 等一系列异步方法完成。每个方法返回一个可等待对象，结果通常为游戏数据字典或状态码。

**示例**：

```python
# 查询当前公司名称
result = await self.company.query_name()
# 返回当前名称字符串

# 修改公司名称为 "Pyai-OTTD"
result = await self.company.set_name("Pyai-OTTD")
# 成功返回 1，失败返回 0
```

该项目封装了以下 API 类，覆盖了绝大多数游戏元素：

| 类名 | 说明 |
|------|------|
| `CompanyReq` | 公司相关操作（名称、金钱、颜色等） |
| `AccountingReq` | 财务数据 |
| `AirportReq` | 机场建造与管理 |
| `BridgeReq` | 桥梁 |
| `CargoReq` | 货物信息 |
| `BaseReq` | 基础请求（如 ping） |
| `DateReq` | 游戏日期 |
| `ErrorReq` | 错误处理 |
| `LogReq` | 日志 |
| `MapReq` | 地图信息 |
| `BaseStationReq` | 车站基类 |
| `EngineReq` | 发动机 / 车辆引擎 |
| `GameSettingsReq` | 游戏设置 |
| `SignReq` | 标识牌 |
| `SubsidyReq` | 补贴 |
| `TunnelReq` | 隧道 |
| `NewGRFReq` | NewGRF 相关 |
| `InfrastructureReq` | 基础设施 |
| `StationReq` | 车站 |
| `WaypointReq` | 路径点 |
| `GroupReq` | 车辆组 |
| `MarineReq` | 水域 / 船舶 |
| `ObjectTypeReq` | 物体类型 |
| `IndustryReq` | 工业设施 |
| `IndustryTypeReq` | 工业类型 |
| `TownReq` | 城镇 |
| `OrderReq` | 车辆指令 |
| `VehicleReq` | 车辆 |
| `RailReq` | 铁路 |
| `RoadReq` | 道路 |
| `TileReq` | 地块 |

全部可用方法及详细参数请参阅源码文件 [`pyopenttd_ai/reqst.py`](./pyopenttd_ai/reqst.py)。建议在开发过程中直接查阅该文件以获取最新的接口定义。

---

## 游戏事件处理

由openttd发来的游戏事件将被存入一个**事件栈**（`self.control.events`），你可以随时从中取出并处理。

**事件处理循环示例**：

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

每调用一次 `pop()` 将取出最早的一个事件，返回 `None` 时表示栈空。。

支持的所有事件类型请查看 [`pyopenttd_ai/event.py`](./pyopenttd_ai/event.py)，文件中定义了每种事件对应的数据字段。

---

## 稳定性警告与贡献

- **此项目非常不稳定**，接口和行为可能在没有事先通知的情况下发生破坏性变更。  
- 目前**不适合**用于任何正式比赛、长期运行的服务器环境或期望可靠产出的场景。  
- 如果您在使用中遇到问题，或愿意为项目贡献代码、测试、文档，欢迎提交 Issue 或 Pull Request。  

