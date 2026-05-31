// AUTHOR	      :	Terox (terox_@hotmail.com)
// MP MACHINE	  :	all
// Called from	  :	client init;


//////////////////////////////
//     DEFINE FUNCTIONS     //
//////////////////////////////

TXU_INFO_CtrlEHAdded = false;

// Functions - GUI CONTROL
TXU_INFO_fctrl_Buttons = compileFinal preprocessfilelinenumbers ("addons\TXU\fctrl_Buttons.sqf");
TXU_INFO_fmapEH = compileFinal preprocessfilelinenumbers ("addons\TXU\fmapEH.sqf");

waitUntil {!(isNull (findDisplay 46))};
addMissionEventHandler ["Map", {_this spawn TXU_INFO_fmapEH}];

systemChat "-------- TXU INFO Initialized --------";
