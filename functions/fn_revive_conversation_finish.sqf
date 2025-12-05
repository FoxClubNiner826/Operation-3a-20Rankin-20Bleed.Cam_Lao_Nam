params ["_caller", "_target"];

/*
systemChat format [
    "caller: %1 | target: %2",
    _caller,
    _target
];
*/

["revive_blu_scout_finish_1", [_target]] remoteExec [
			"FoxClub_fnc_Conversation",
			allPlayers select { _x distance _caller <= 100 }
		];