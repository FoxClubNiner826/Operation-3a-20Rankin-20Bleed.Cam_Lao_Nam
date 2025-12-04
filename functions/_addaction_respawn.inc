private _title = localize "STR_A3_ForceRespawn";
private _iconIdle = bis_fnc_reviveGetActionIcon;
private _iconProgress = ICON_USERACTION_RESPAWN;
private _condShow = "lifeState player == 'INCAPACITATED'";
private _condProgress = _condShow;
private _codeStart = {SET_FORCING_RESPAWN(player, true);};
private _codeProgress = {};
private _codeCompleted =
{
	bis_revive_deathReason = DEATH_REASON_FORCED_RESPAWN;

	player setDamage 1;
};
private _codeInterrupted = {SET_FORCING_RESPAWN(player, false);};
private _arguments = [];
private _duration = bis_revive_forceRespawnDuration;
private _priority = 1000;

private _actionID = [player,_title,_iconIdle,_iconProgress,_condShow,_condProgress,_codeStart,_codeProgress,_codeCompleted,_codeInterrupted,_arguments,_duration,_priority,true,true] call bis_fnc_holdActionAdd;
player setVariable [VAR_ACTION_ID_RESPAWN,_actionID];