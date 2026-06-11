params ["_unit"];

if (time < (_unit getVariable ["GRLIB_isProtected", 0])) exitWith {};
_unit setVariable ["GRLIB_isProtected", round(time + 60)];

if (isPlayer _unit) exitWith {
    _unit setUnconscious true;
    [3000] call BIS_fnc_bloodEffect;
    "colorCorrections" ppEffectAdjust [1, 1.6, -0.35, [1, 1, 1, 0], [1, 1, 1, 0], [0.75, 0.25, 0, 1.0]];
    "colorCorrections" ppEffectCommit 0;
    "colorCorrections" ppEffectEnable true;
    sleep 5;
    "colorCorrections" ppEffectEnable false;
    "colorCorrections" ppEffectCommit 2;
    "filmGrain" ppEffectEnable false;
    [3000] call BIS_fnc_bloodEffect;
    sleep 8;
    [3000] call BIS_fnc_bloodEffect;
    _unit setUnconscious false;
    showChat true;
};

_unit setUnitPos "DOWN";
if !(PAR_AidKit in (items _unit) || PAR_Medikit in (items _unit)) exitWith {};
sleep 10 + (floor random 30);
if (alive _unit) then {
    _unit action ["HealSoldierSelf", _unit];
    sleep 6;
    _unit setUnitPos "AUTO";
};
