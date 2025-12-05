private _title = localize "STR_A3_Revive";
private _iconIdle = bis_fnc_reviveGetActionIcon;
private _iconProgress = ICON_USERACTION_REVIVE;
private _condShow = "[_target] call bis_fnc_reviveIsValid";
private _condProgress = _condShow;
private _codeStart =
{
	SET_BEING_REVIVED(_a0,true);
	hint "on start fired";
	[_caller, _target] call foxClub_fnc_revive_conversation_start;
	//start revive animation
	player playAction "medicStart";
};
private _codeProgress = {};
private _codeCompleted =
{
	[_caller, _target] call foxClub_fnc_revive_conversation_finish;
	
	SET_BEING_REVIVED(_target,false);

	if (bis_revive_killfeedShow) then
	{
		SET_STATE_XTRA(_target,STATE_REVIVED,player);
	}
	else
	{
		SET_STATE(_target,STATE_REVIVED);
	};

	//remove FAK from target or player inventory
	if (bis_revive_requiredItems == 2 && {!CAN_USE_MEDIKIT2(player,_target)}) then
	{
		if (CAN_USE_FAK(_target)) then
		{
			_target removeItem "FirstAidKit";
		}
		else
		{
			player removeItem "FirstAidKit";
		};
	};

	//stop revive animation
	player playAction "medicStop";

	//add rating for successful revive
	player addRating RATING_REVIVE;

	//handle achievement for 5 revives completed
	private _reviveCount = (profileNamespace getVariable ["bis_reviveCount", 0]) + 1;
	profileNamespace setVariable ["bis_reviveCount", _reviveCount];
	if (_reviveCount == 5) then
	{
		setStatValue ["ExpGuardianAngel", 1];
	};
};
private _codeInterrupted =
{
	SET_BEING_REVIVED(_a0,false);

	//stop revive animation
	player playAction "medicStop";
};
private _arguments = [_unit];
private _duration = bis_revive_duration;
private _priority = 1000;

if (player getUnitTrait "Medic") then
{
	_duration = bis_revive_durationMedic;
};

private _actionID = [_unit,_title,_iconIdle,_iconProgress,_condShow,_condProgress,_codeStart,_codeProgress,_codeCompleted,_codeInterrupted,_arguments,_duration,_priority] call bis_fnc_holdActionAdd;
_unit setVariable [VAR_ACTION_ID_REVIVE,_actionID];
