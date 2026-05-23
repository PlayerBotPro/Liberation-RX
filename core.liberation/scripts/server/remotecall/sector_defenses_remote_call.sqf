if (!isServer && hasInterface) exitWith {};

params ["_sector", "_defense"];

if (_defense == 0) then {
    GRLIB_sector_defense deleteAt _sector;
} else {
    GRLIB_sector_defense set [_sector, _defense];
};

publicVariable "GRLIB_sector_defense";
