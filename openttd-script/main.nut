// Script

import("library.scplib", "SCPLib", 45);

class OtherAIGS extends GSController
{
  function Start();
  function HandleEvents();
  function RegisterCommands();
  
  function _OnSendAdminMessage(message, self)
  {
    GSLog.Info("AI company id " + message.GetIntData(0) + " send Message: " + message.GetStringData(1));
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
    this.Sleep(5);
  }
}

function OtherAIGS::HandleEvents()
{
  while (GSEventController.IsEventWaiting()) {
    local ev = GSEventController.GetNextEvent();
    if (ev == null) continue;
  }
}


function OtherAIGS::RegisterCommands()
{
  this._scp.AddCommand("SendAdminMsg", this._commandSet, this, this._OnSendAdminMessage);
}
