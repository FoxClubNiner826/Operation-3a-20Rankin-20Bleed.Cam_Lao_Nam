//add secure action
private _title = "Secure";								//todo: localize
private _iconIdle = ICON_USERACTION_SECURE;
private _iconProgress = ICON_USERACTION_SECURE;
private _condShow = "[_target] call bis_fnc_reviveIsValidSecure";
private _condProgress = _condShow;
private _codeStart = {};
private _codeProgress = {};
private _codeCompleted =
{
	//trigger secure code on incapacitated & secured _unit
	[_target,player] remoteExec ["bis_fnc_reviveSecureUnit",0,false];

	//add rating for successful secure
	player addRating RATING_SECURE;
};
private _codeInterrupted = {};
private _arguments = [];
private _duration = 1;
private _priority = 1000;

private _actionID = [_unit,_title,_iconIdle,_iconProgress,_condShow,_condProgress,_codeStart,_codeProgress,_codeCompleted,_codeInterrupted,_arguments,_duration,_priority] call bis_fnc_holdActionAdd;
_unit setVariable [VAR_ACTION_ID_SECURE,_actionID];