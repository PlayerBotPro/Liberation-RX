/*
// AUTHOR       : Terox (terox_@hotmail.com)
// MP MACHINE   : all
//
// PARAMS : Bool to return if the map is open or not
*/

params ["_isOpen"];

if (_isOpen) then {
    if (!TXU_INFO_CtrlEHAdded) then {
        TXU_INFO_CtrlEHAdded = true;
        private _display = uiNamespace getVariable "RscDiary";
        private _diaryList = _display displayCtrl 1001;
        private _diarySubList = _display displayCtrl 1002;
        _diarySubList ctrlAddEventHandler ["LBSelChanged", { _this spawn TXU_INFO_buttons }];
    };
};
