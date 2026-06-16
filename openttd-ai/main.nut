// AI

import("library.scplib", "SCPLib", 45);

class OtherAI extends AIController 
{
  function Start();
  function HandleEvents();
  function RegisterCommands();

  _scp = null;
  _commandSet = "MsgCmdSet";
  _companyId = 0;

  function _OnReceiveMessage(message, self)
  {
    AILog.Info("Get message from python: " + message.GetData(0));
  }

  function _SentMessageToPython(message)
  {
    this._scp.TellServer("SendAdminMsg", this._commandSet, this._companyId, message);
  }
}

function OtherAI::Start()
{
  if (!AICompany.SetName("OtherAI")) {
    local i = 2;
    while (!AICompany.SetName("OtherAI #" + i)) {
      i = i + 1;
    }
  }

  this._scp = SCPLib("OTHR", "1.0");
  this._scp.SetEventHandling(true);
  this.RegisterCommands();

  while (!this._scp.CanSpeakWith(16)) {
    AILog.Info("Waiting for GS registration...");
    while (this._scp.Check()) {}
    this.Sleep(1);
  }
  
  this._companyId = AICompany.ResolveCompanyID(AICompany.COMPANY_SELF);
  AILog.Info("OtherAI started with id " + this._companyId + " name " + AICompany.GetName(this._companyId));
  
  // this._SentMessageToPython(
  //   {
  //     type="establish_message"
  //     info={
  //       name=AICompany.GetName(this._companyId)
  //       company_id=this._companyId
  //     }
  //   }
  // );
  // idk why this message cannot be sent. but a string can be send. i really have no idea
  while (true) {
    while (this._scp.Check()) {}
    this.HandleEvents();
  }
}

function OtherAI::HandleEvents()
{
  while (AIEventController.IsEventWaiting()) {
	local ev = AIEventController.GetNextEvent();
    if (ev == null) continue;
    local ev_type = ev.GetEventType();
    switch (ev_type) {
      case AIEvent.ET_AIRCRAFT_DEST_TOO_FAR: {
        local event = AIEventAircraftDestTooFar.Convert(ev);    
        this._SentMessageToPython(
          {
            type="event"
            event={
              name="AircraftDestTooFar"
              data={
                vehicle_id=event.GetVehicleID()
              }
            }
          }
        );
        break;
      }
      case AIEvent.ET_DISASTER_ZEPPELINER_CLEARED: {
        local event = AIEventDisasterZeppelinerCleared.Convert(ev);
        this._SentMessageToPython(
          {
            type="event"
            event={
              name="DisasterZeppelinerCleared"
              data={
                station_id=event.GetStationID()
              }
            }
          }
        );
        break;
      }
      case AIEvent.ET_DISASTER_ZEPPELINER_CRASHED: {
        local event = AIEventDisasterZeppelinerCrashed.Convert(ev);
        this._SentMessageToPython(
          {
            type="event"
            event={
              name="DisasterZeppelinerCrashed"
              data={
                station_id=event.GetStationID()
              }
            }
          }
        );
        break;
      }
      case AIEvent.ET_ENGINE_AVAILABLE: {
        local event = AIEventEngineAvailable.Convert(ev);
        this._SentMessageToPython(
          {
            type="event"
            event={
              name="EngineAvailable"
              data={
                engine_id=event.GetEngineID()
              }
            }
          }
        );
        break;
      }
      case AIEvent.ET_ENGINE_PREVIEW: {
        local event = AIEventEnginePreview.Convert(ev);
        
        // it is not possible to ask python to perform the accept operation afterwards.
        break;
      }
      case AIEvent.ET_VEHICLE_AUTOREPLACED: {
        local event = AIEventVehicleAutoReplaced.Convert(ev);
        this._SentMessageToPython(
          {
            type="event"
            event={
              name="VehicleAutoReplaced"
              data={
                old_vehicle_id=event.GetOldVehicleID()
                new_vehicle_id=event.GetNewVehicleID()
              }
            }
          }
        );
        break;
      }
      case AIEvent.ET_VEHICLE_LOST: {
        local event = AIEventVehicleLost.Convert(ev);
        this._SentMessageToPython(
          {
            type="event"
            event={
              name="VehicleLost"
              data={
                vehicle_id=event.GetVehicleID()
              }
            }
          }
        );
        break;
      }
      case AIEvent.ET_VEHICLE_UNPROFITABLE: {
        local event = AIEventVehicleUnprofitable.Convert(ev);
        this._SentMessageToPython(
          {
            type="event"
            event={
              name="VehicleUnprofitable"
              data={
                vehicle_id=event.GetVehicleID()
              }
            }
          }
        );
        break;
      }
      case AIEvent.ET_VEHICLE_WAITING_IN_DEPOT: {
        local event = AIEventVehicleWaitingInDepot.Convert(ev);
        this._SentMessageToPython(
          {
            type="event"
            event={
              name="VehicleWaitingInDepot"
              data={
                vehicle_id=event.GetVehicleID()
              }
            }
          }
        );
        break;
      }
    }
  }
}

function OtherAI::RegisterCommands()
{
  this._scp.AddCommand("SendAdminMsg", this._commandSet, this, null);
  this._scp.AddCommand("ReceiveAIMsg", this._commandSet, this, this._OnReceiveMessage);
}
