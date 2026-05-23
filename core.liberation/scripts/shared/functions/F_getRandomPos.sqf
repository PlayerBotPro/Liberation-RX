params ["_start_pos", "_radius"];

private _pos = (_start_pos getPos [_radius, floor random 360]);
_pos set [2, 0];
_pos;
