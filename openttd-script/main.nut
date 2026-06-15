// Script

import("library.scplib", "SCPLib", 45);

class OtherAIGS extends GSController
{
  function Start();
  function HandleEvents();
  function RegisterCommands();
  
  function _OnSendAdminMessage(message, self)
  {
    GSLog.Info("AI company id " + message.GetIntData(0) + " send Message: " + message.GetData(1));
    local data = {
        company = message.GetIntData(0)
        msg = message.GetData(1)
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
        local company = data.company;
        local message = data.msg;
      }
    }
  }
}


function OtherAIGS::RegisterCommands()
{
  this._scp.AddCommand("SendAdminMsg", this._commandSet, this, this._OnSendAdminMessage);
}
