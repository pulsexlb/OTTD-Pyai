class OtherAI extends AIInfo {
  function GetAuthor()      { return "PulseX"; }
  function GetName()        { return "OtherAI"; }
  function GetDescription() { return "AI using admin port to control"; }
  function GetVersion()     { return 1; }
  function GetDate()        { return "2026-06-14"; }
  function CreateInstance() { return "OtherAI"; }
  function GetShortName()   { return "OTHR"; }
  function GetAPIVersion()  { return "15"; }
}

RegisterAI(OtherAI());
