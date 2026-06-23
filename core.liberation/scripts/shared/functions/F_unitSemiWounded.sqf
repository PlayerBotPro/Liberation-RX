params ["_unit"];

sleep 0.1;
if ([_unit] call PAR_is_wounded) exitWith {};
//if (!alive _unit) exitWith {};
//systemchat format ["semi wounded - unit: %1 - damage: %2 - protected: %3", name _unit, damage _unit, (_unit getVariable ["GRLIB_isProtected", 0])];

if (side _unit == GRLIB_side_friendly) then {
    gamelogic globalchat format ["Second chance for %1, lucky boy!", name _unit];
};

if (isPlayer _unit) exitWith {
    private _msg = format ["<t color='#80FF80' size='1.0'>Second Chance !</t>"];
    private _data = [_msg, 0, -1, 8, 0, -6, 5];
    _data spawn BIS_fnc_dynamicText;
    _unit setUnconscious true;
    [3000] call BIS_fnc_bloodEffect;
    "colorCorrections" ppEffectAdjust [1, 1.6, -0.35, [1, 1, 1, 0], [1, 1, 1, 0], [0.75, 0.25, 0, 1.0]];
    "colorCorrections" ppEffectCommit 0;
    "colorCorrections" ppEffectEnable true;
    sleep 5;
    "colorCorrections" ppEffectAdjust [1, 1, 0, [0,0,0,0], [1,1,1,1], [1,0,0,0]];
    "colorCorrections" ppEffectCommit 2;
    "colorCorrections" ppEffectEnable false;
    "filmGrain" ppEffectEnable false;
    [3000] call BIS_fnc_bloodEffect;
    sleep 8;
    [3000] call BIS_fnc_bloodEffect;
    _unit setUnconscious false;
    showChat true;
    _unit setVariable ["GRLIB_isLucky", nil];
};

_unit setUnconscious true;
_unit setVariable ["GRLIB_isLucky", 1];
if !(PAR_AidKit in (items _unit) || PAR_Medikit in (items _unit)) exitWith {};
sleep 3;
_unit setUnconscious false;
_unit setUnitPos "DOWN";
sleep 7 + (floor random 20);
if (alive _unit) then {
    _unit action ["HealSoldierSelf", _unit];
    sleep 6;
    _unit setUnitPos "AUTO";
    _unit setVariable ["GRLIB_isLucky", nil];
};
