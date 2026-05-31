//url = "https://forums.bohemia.net/forums/topic/169501-link-to-website-in-briefing/";

params ["_ctrl", "_index"];

private _display = ctrlParent _ctrl;
private _diaryList = _display displayCtrl 1001;
private _diarySubList = _display displayCtrl 1002;
private _diaryEntry = _display displayCtrl 1013;
private _curSubject = _diaryList lbText (lbCurSel _diaryList);
private _curEntry = _diarySubList lbText (_index * 2);

// diag_log format ["[TXU] subject: '%1', entry: '%2'", _curSubject, _curEntry];

if (_curSubject == "LRX Info" && _curEntry == "Website Links") then {
	if (isNull (_diaryEntry controlsGroupCtrl 10001)) then {
		private _btnHeight = 0.02 * safeZoneH;

		// Hide diary entry html
		private _contentHtml = _diaryEntry controlsGroupCtrl 1003;
		_contentHtml ctrlSetFade 1;
		_contentHtml ctrlCommit 0;

		// Inject button
		ctrlPosition _diaryEntry params ["_entryX", "_entryY", "_entryW", "_entryH"];
		_ctrl = _display ctrlCreate ["TXU_TS_INFOBUTTON1", 10001, _diaryEntry];
		_ctrl ctrlSetPosition[0.02, 0.01, _entryW / 2, _btnHeight];
		_ctrl ctrlCommit 0;
		ctrlSetFocus _ctrl;
		_ctrl = _display ctrlCreate ["TXU_TS_INFOBUTTON2", 10002, _diaryEntry];
		_ctrl ctrlSetPosition[0.02, 0.05, _entryW / 2, _btnHeight];
		_ctrl ctrlCommit 0;
		_ctrl = _display ctrlCreate ["TXU_TS_INFOBUTTON3", 10003, _diaryEntry];
		_ctrl ctrlSetPosition[0.02, 0.09, _entryW / 2, _btnHeight];
		_ctrl ctrlCommit 0;
	};
} else {
	// If its not the mod info entry AND the injected button exists
	if !(isNull (_diaryEntry controlsGroupCtrl 10001)) then {
		// Delete injected button
		{ctrlDelete (_diaryEntry controlsGroupCtrl _x)} foreach [10001,10002,10003,10004];
		// Unhide entry html
		private _contentHtml = _diaryEntry controlsGroupCtrl 1003;
		_contentHtml ctrlSetFade 0;
		_contentHtml ctrlCommit 0;
	};
};
