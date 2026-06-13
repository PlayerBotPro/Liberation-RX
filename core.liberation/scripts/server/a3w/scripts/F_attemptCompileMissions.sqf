// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: attemptCompileMissions.sqf
//	@file Author: AgentRev
//	LRX Integration: pSiKO

params ["_missionsArray"];

{
	compile preprocessFileLineNumbers format ["scripts\server\a3w\missions\sideMissions\%1.sqf", (_x select 0)];
	sleep 0.5;
} forEach _missionsArray;
