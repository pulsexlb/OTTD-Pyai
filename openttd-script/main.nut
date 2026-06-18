// Script

import("library.scplib", "SCPLib", 45);

require("utils.nut")

class OtherAIGS extends GSController
{
  function Start();
  function HandleEvents();
  function RegisterCommands();
  
  function _OnSendAdminMessage(message, self)
  {
    local msg = {};
    local msg_type = message.GetStringData(1);
    switch (msg_type) {
      case "query_result": {
        local q_id = message.GetIntData(2);
        local q_res = {};
        local encoded = message.GetStringData(3);
        if (encoded != null && encoded != "") {
          local pairs = SplitString(encoded, "|");
          foreach (pair in pairs) {
            local kv = SplitString(pair, "=");
            if (kv.len() >= 2) {
              local key = kv[0];
              local val = kv[1];
              for (local i = 2; i < kv.len(); i++) {
                val += "=" + kv[i];
              }
              q_res[key] <- val;
            }
          }
        }
        msg = {
          type = msg_type
          id = q_id
          result = q_res
        };
        break;
      }
      case "event": {
        local event_name = message.GetStringData(2);
        local encoded = message.GetStringData(3);
        local event_data = {};
        if (encoded != null && encoded != "") {
          local pairs = SplitString(encoded, "|");
          foreach (pair in pairs) {
            local kv = SplitString(pair, "=");
            if (kv.len() >= 2) {
              local key = kv[0];
              local val_str = kv[1];
              for (local i = 2; i < kv.len(); i++) {
                val_str += "=" + kv[i];
              }
              local int_val = val_str.tointeger();
              if (int_val != null) {
                event_data[key] <- int_val;
              } else {
                event_data[key] <- val_str;
              }
            }
          }
        }
        msg = {
          type = msg_type
          event = {
            name = event_name
            data = event_data
          }
        };
        break;
      }
    }
    GSLog.Info("AI company id " + message.GetIntData(0) + " send Message: " + msg);
    local data = {
        company = message.GetIntData(0)
        msg = msg
    }
    GSAdmin.Send(data)
  }

  function _SentMessageToPython(message)
  {    
    local data = {
        company = -1
        msg = message
    }
    GSAdmin.Send(data)
  }

  _scp = null;
  _commandSet = "MsgCmdSet";
}

function OtherAIGS::Start()
{
  this._scp = SCPLib("OTGS", "1.0");
  this._scp.SetEventHandling(true);
  this._scp.SCPLogging_Error(true);
  this.RegisterCommands();

  GSLog.Info("OtherAI game script started");

  while (true) {
    while (this._scp.Check()) {}
    this.HandleEvents();
  }
}

function OtherAIGS::HandleEvents()
{
  while (GSEventController.IsEventWaiting()) {
    local ev = GSEventController.GetNextEvent();
    if (ev == null) continue;
    local ev_type = ev.GetEventType();
    switch (ev_type) {
      case GSEvent.ET_ADMIN_PORT: {
        local event = GSEventAdminPort.Convert(ev);
        local data = event.GetObject();
        local company = data.company.tointeger();
        local message = data.msg;
        switch (message.type) {
          case "query": {
            this._scp.TellCompany("ReceiveAIMsg", this._commandSet, company, "query", message.query.id, message.query.key);
            break;
          }
        }
        break;
      }

      case GSEvent.ET_COMPANY_BANKRUPT: {
        local event = GSEventCompanyBankrupt.Convert(ev);
        this._SentMessageToPython(
          {
            type="event"
            event={
              name="CompanyBankrupt"
              data={
                company_id=event.GetCompanyID()
              }
            }
          }
        );
        break;
      }
      case GSEvent.ET_COMPANY_IN_TROUBLE: {
        local event = GSEventCompanyInTrouble.Convert(ev);
        this._SentMessageToPython(
          {
            type="event"
            event={
              name="CompanyInTrouble"
              data={
                company_id=event.GetCompanyID()
              }
            }
          }
        );
        break;
      }
      case GSEvent.ET_COMPANY_MERGER: {
        local event = GSEventCompanyMerger.Convert(ev);
        this._SentMessageToPython(
          {
            type="event"
            event={
              name="CompanyMerger"
              data={
                old_company_id=event.GetOldCompanyID()
                new_company_id=event.GetNewCompanyID()
              }
            }
          }
        );
        break;
      }
      case GSEvent.ET_COMPANY_NEW: {
        local event = GSEventCompanyNew.Convert(ev);
        this._SentMessageToPython(
          {
            type="event"
            event={
              name="CompanyNew"
              data={
                company_id=event.GetCompanyID()
              }
            }
          }
        );
        break;
      }
      case GSEvent.ET_COMPANY_RENAMED: {
        local event = GSEventCompanyRenamed.Convert(ev);
        this._SentMessageToPython(
          {
            type="event"
            event={
              name="CompanyRenamed"
              data={
                company_id=event.GetCompanyID()
                name=event.GetNewName()
              }
            }
          }
        );
        break;
      }
      case GSEvent.ET_EXCLUSIVE_TRANSPORT_RIGHTS: {
        local event = GSEventExclusiveTransportRights.Convert(ev);
        this._SentMessageToPython(
          {
            type="event"
            event={
              name="ExclusiveTransportRights"
              data={
                company_id=event.GetCompanyID()
                town_id=event.GetTownID()
              }
            }
          }
        );
        break;
      }
      case GSEvent.ET_INDUSTRY_CLOSE: {
        local event = GSEventIndustryClose.Convert(ev);
        this._SentMessageToPython(
          {
            type="event"
            event={
              name="IndustryClose"
              data={
                industry_id=event.GetIndustryID()
              }
            }
          }
        );
        break;
      }
      case GSEvent.ET_INDUSTRY_OPEN: {
        local event = GSEventIndustryOpen.Convert(ev);
        this._SentMessageToPython(
          {
            type="event"
            event={
              name="IndustryOpen"
              data={
                industry_id=event.GetIndustryID()
              }
            }
          }
        );
        break;
      }
      case GSEvent.ET_PRESIDENT_RENAMED : {
        local event = GSEventPresidentRenamed.Convert(ev);
        this._SentMessageToPython(
          {
            type="event"
            event={
              name="PresidentRenamed"
              data={
                company_id=event.GetCompanyID()
                name=event.GetNewName()
              }
            }
          }
        );
        break;
      }
      case GSEvent.ET_ROAD_RECONSTRUCTION: {
        local event = GSEventRoadReconstruction.Convert(ev);
        this._SentMessageToPython(
          {
            type="event"
            event={
              name="RoadReconstruction"
              data={
                company_id=event.GetCompanyID()
                town_id=event.GetTownID()
              }
            }
          }
        );
        break;
      }
      case GSEvent.ET_STATION_FIRST_VEHICLE: {
        local event = GSEventStationFirstVehicle.Convert(ev);
        this._SentMessageToPython(
          {
            type="event"
            event={
              name="StationFirstVehicle"
              data={
                station_id=event.GetStationID()
                vehicle_id=event.GetVehicleID()
              }
            }
          }
        );
        break;
      }
      case GSEvent.ET_SUBSIDY_AWARDED: {
        local event = GSEventSubsidyAwarded.Convert(ev);
        this._SentMessageToPython(
          {
            type="event"
            event={
              name="SubsidyAwarded"
              data={
                subsidy_id=event.GetSubsidyID()
              }
            }
          }
        );
        break;
      }
      case GSEvent.ET_SUBSIDY_EXPIRED: {
        local event = GSEventSubsidyExpired.Convert(ev);
        this._SentMessageToPython(
          {
            type="event"
            event={
              name="SubsidyExpired"
              data={
                subsidy_id=event.GetSubsidyID()
              }
            }
          }
        );
        break;
      }
      case GSEvent.ET_SUBSIDY_OFFER: {
        local event = GSEventSubsidyOffer.Convert(ev);
        this._SentMessageToPython(
          {
            type="event"
            event={
              name="SubsidyOffer"
              data={
                subsidy_id=event.GetSubsidyID()
              }
            }
          }
        );
        break;
      }
      case GSEvent.ET_SUBSIDY_OFFER_EXPIRED: {
        local event = GSEventSubsidyOfferExpired.Convert(ev);
        this._SentMessageToPython(
          {
            type="event"
            event={
              name="SubsidyOfferExpired"
              data={
                subsidy_id=event.GetSubsidyID()
              }
            }
          }
        );
        break;
      }
      case GSEvent.ET_TOWN_FOUNDED: {
        local event = GSEventTownFounded.Convert(ev);
        this._SentMessageToPython(
          {
            type="event"
            event={
              name="GSTownFounded"
              data={
                town_id=event.GetTownID()
              }
            }
          }
        );
        break;
      }
      case GSEvent.ET_VEHICLE_CRASHED: {
        local event = GSEventVehicleCrashed.Convert(ev);
        this._SentMessageToPython(
          {
            type="event"
            event={
              name="VehicleCrashed"
              data={
                vehicle_id=event.GetVehicleID()
                crash_site=event.GetCrashSite()
                crash_reason=event.GetCrashReason()
                victims=event.GetVictims()
                vehicle_owner=event.GetVehicleOwner()
              }
            }
          }
        );
        break;
      }
    }
  }
}


function OtherAIGS::RegisterCommands()
{
  this._scp.AddCommand("SendAdminMsg", this._commandSet, this, this._OnSendAdminMessage);
  this._scp.AddCommand("ReceiveAIMsg", this._commandSet, this, null);
}
