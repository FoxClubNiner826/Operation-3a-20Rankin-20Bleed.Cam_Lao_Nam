/*
    File: fn_fixLeadership.sqf
    Author: FoxClubNiner
    Description:
        Determines if the caller is the Scout or not then picks a random voice line from the pool, 
        removes it so it can’t repeat until exhausted, and broadcasts it with FoxClub_fnc_Conversation.
*/


    params ["_group"];

    private _aiLeader = leader _group;
    private _aiName = name _aiLeader;
    private _aiRole = getText (configFile >> "CfgVehicles" >> typeOf _aiLeader >> "displayName");

    private _humans = units _group select { isPlayer _x };
    if (_humans isEqualTo []) exitWith {
        [format["No human players available. %1 (%2) remains leader of %3.",
            _aiName,
            _aiRole,
            groupId _group
        ]] remoteExec ["systemChat", 0];

        diag_log format ["[LeaderChange] No human players available. %1 (%2) remains leader of %3.",
            _aiName,
            _aiRole,
            groupId _group
        ];
    };

    // Select the first human in group order
    private _orderedUnits = units _group;
    private _firstHuman = objNull;
    {
        if (_x in _humans) exitWith { _firstHuman = _x };
    } forEach _orderedUnits;

    if (!isNull _firstHuman) then {
        private _humanName = name _firstHuman;
        private _humanRole = getText (configFile >> "CfgVehicles" >> typeOf _firstHuman >> "displayName");

        [_group, _firstHuman] remoteExec ["selectLeader", 2];

        [format["%1 (%2) was leader of %3. Leadership reassigned to %4 (%5) (index %6).",
            _aiName,
            _aiRole,
            groupId _group,
            _humanName,
            _humanRole,
            _orderedUnits find _firstHuman
        ]] remoteExec ["systemChat", 0];

        diag_log format ["[LeaderChange] %1 (%2) was leader of %3. Leadership reassigned to %4 (%5) (index %6).",
            _aiName,
            _aiRole,
            groupId _group,
            _humanName,
            _humanRole,
            _orderedUnits find _firstHuman
        ];
    };

/*
[] spawn {
    sleep 3;

    private _group = playergroup;

    _group addEventHandler ["LeaderChanged", {
        params ["_group", "_newLeader"];

        if (!isPlayer _newLeader) then {

            private _aiName = name _newLeader;
            private _aiRole = getText (configFile >> "CfgVehicles" >> typeOf _newLeader >> "displayName");

            private _humans = (units _group) select { isPlayer _x };

            if (_humans isNotEqualTo []) then {

                private _orderedUnits = units _group;
                private _firstHuman = objNull;

                {
                    if (_x in _humans) exitWith { _firstHuman = _x; };
                } forEach _orderedUnits;

                if (!isNull _firstHuman) then {

                    private _humanName = name _firstHuman;
                    private _humanRole = getText (configFile >> "CfgVehicles" >> typeOf _firstHuman >> "displayName");

                    // Assign human as leader
                    [_group, _firstHuman] remoteExec ["selectLeader", 0, true];

                    // Broadcast systemChat
                    [format["%1 (%2) was given command of %3. Leadership has been reassigned to %4 (%5) (index %6).",
                        _aiName,
                        _aiRole,
                        groupId _group,
                        _humanName,
                        _humanRole,
                        _orderedUnits find _firstHuman
                    ]] remoteExec ["systemChat", 0];

                    // Log to RPT
                    diag_log format ["[LeaderChange] %1 (%2) was given command of %3. Leadership reassigned to %4 (%5) (index %6).",
                        _aiName,
                        _aiRole,
                        groupId _group,
                        _humanName,
                        _humanRole,
                        _orderedUnits find _firstHuman
                    ];
                };

            } else {
                [format["No human players available. %1 (%2) is now the leader of %3.",
                    _aiName,
                    _aiRole,
                    groupId _group
                ]] remoteExec ["systemChat", 0];

                diag_log format ["[LeaderChange] No human players available. %1 (%2) is now the leader of %3.",
                    _aiName,
                    _aiRole,
                    groupId _group
                ];
            };
        };
    }];
};
