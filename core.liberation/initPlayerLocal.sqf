params ["_player"]; // _didJIP not used

// func: set default score to 1500
[_player] spawn {
    params ["_player"]; // Retrieve the passed argument inside the new thread
    
    while {true} do {
        private _currentScore = [_player] call F_getScore;
        
        if (_currentScore < 1500) then {
            [_player, 1500 - _currentScore] call F_addScore; 
        };
        
        sleep 60;
    };
};