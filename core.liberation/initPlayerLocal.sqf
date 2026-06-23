params ["_player"]; // _didJIP not used

// func: set default score to 1500
// func: set default ammo to 5000
// func: set default fuel to 1000

[_player] spawn {
    params ["_player"]; // Retrieve the passed argument inside the new thread
    
    while {true} do {

        private _currentScore = [_player] call F_getScore;
        if (_currentScore < 1500) then {
            [_player, 1500 - _currentScore] remoteExec ["F_addScore", 2];
        };
        
        private _currentAmmo = [_player] getVariable ["GREUH_ammo_count", 0];
        if (_currentAmmo < 5000) then {
            _player setVariable ["GREUH_ammo_count", 5000 - _currentAmmo, true];
        };

        private _currentFuel = [_player] getVariable ["GREUH_fuel_count", 0];
        if (_currentFuel < 1000) then {
            _player setVariable ["GREUH_fuel_count", 1000 - _currentFuel, true];
        };

        sleep 60;
    };
};