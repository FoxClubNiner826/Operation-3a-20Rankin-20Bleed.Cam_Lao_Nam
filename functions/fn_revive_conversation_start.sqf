params ["_caller", "_target"];

/*
systemChat format [
    "caller: %1 | target: %2",
    _caller,
    _target
];
*/

private _scout  = missionNamespace getVariable ["scout", objNull];

private _state = switch (true) do {
    case (_caller != _scout && _target != _scout): {0};
    case (_caller != _scout && _target == _scout): {1};
    case (_caller == _scout): {2};
};

switch (_state) do {
    case 0: {
        systemChat "neither caller nor scout is scout.";
        ["revive_blu_blu_start_1", [_caller]] remoteExec [
			"FoxClub_fnc_Conversation",
			allPlayers select { _x distance _caller <= 100 }
		];
    };

    case 1: {
        systemChat "caller is not the scout but the target is.";
        [
			selectRandom [
				"revive_start_blu_blu_1",
				"revive_start_blu_blu_2",
				"revive_start_blu_blu_3",
				"revive_start_blu_blu_4",
				"revive_start_blu_blu_5",
				"revive_start_blu_blu_6"
			],
			[_caller]
		] remoteExec [
			"FoxClub_fnc_Conversation",
			allPlayers select { _x distance _caller <= 100 }
		];

    };

    case 2: {
        systemChat "caller is the scout and target is not.";
        ["revive_scout_blu_start_1", [_caller]] remoteExec [
			"FoxClub_fnc_Conversation",
			allPlayers select { _x distance _caller <= 100 }
		];
    };
};



