params ["_unit"];

if (time < (_unit getVariable ["GRLIB_isProtected", 0])) exitWith {};
_unit setVariable ["GRLIB_isProtected", round(time + 60)];

_unit setUnitPos "DOWN";
if !(PAR_AidKit in (items _unit) || PAR_Medikit in (items _unit)) exitWith {};
sleep 10 + (floor random 30);
if (alive _unit) then {
    _unit action ["HealSoldierSelf", _unit];
    sleep 6;
    _unit setUnitPos "AUTO";
};
