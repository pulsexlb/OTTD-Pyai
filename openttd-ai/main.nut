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
  AILog.Info("OtherAI started with id " + this._companyId);
  local ret = this._scp.TellServer("SendAdminMsg", this._commandSet, this._companyId, "Hello from AI");
  if (ret == 0) {
    AILog.Info("Message sent successfully");
  } else if (ret == 1) {
    AILog.Info("Message delayed (handshake ongoing)");
  } else {
    AILog.Error("Failed to send message, error code: " + ret);
  }
  while (true) {
    while (this._scp.Check()) {}
    this.HandleEvents();
    this.Sleep(5);
  }
}

function OtherAI::HandleEvents()
{
  while (AIEventController.IsEventWaiting()) {
	local ev = AIEventController.GetNextEvent();
    if (ev == null) continue;
  }
}

function OtherAI::RegisterCommands()
{
  this._scp.AddCommand("SendAdminMsg", this._commandSet, this, null);
}
