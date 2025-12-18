// Allows players to set the respawn delay
private _respawn_delay = [paramsArray, 0, -1, [0]] call BIS_fnc_param;
[{true}, _respawn_delay, ""] call BIS_fnc_setRespawnDelay;