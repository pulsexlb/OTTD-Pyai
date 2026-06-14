class OtherAIGS extends GSInfo {
  function GetAuthor()      { return "PulseX"; }
  function GetName()        { return "OtherAIGS"; }
  function GetDescription() { return "Game script for AI using admin port to control"; }
  function GetVersion()     { return 1; }
  function GetDate()        { return "2026-06-14"; }
  function CreateInstance() { return "OtherAIGS"; }
  function GetShortName()   { return "OTGS"; }
  function GetAPIVersion()  { return "15"; }
}

RegisterGS(OtherAIGS());
