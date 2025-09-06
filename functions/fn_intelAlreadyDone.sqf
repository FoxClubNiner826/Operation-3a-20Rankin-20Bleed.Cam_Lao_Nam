/*
    File: fn_intelAlreadyDone.sqf
    Author: FoxClubNiner
    Description:
        Determines if the caller is the Scout or not then picks a random voice line from the pool, 
        removes it so it can’t repeat until exhausted, and broadcasts it with FoxClub_fnc_Conversation.
*/

private _message = if (_caller == _scout) then {    
    private _availableScoutMessages = missionNamespace getVariable [
        "availablescoutIntelMessagesDone",
        ["scoutfounddone1", "scoutfounddone2", "scoutfounddone3"]
    ];

    if (count _availableScoutMessages > 0) then {
        private _selected = selectRandom _availableScoutMessages;
        _availableScoutMessages = _availableScoutMessages - [_selected]; 
        missionNamespace setVariable ["availablescoutIntelMessagesDone", _availableScoutMessages, true];
        _selected
    } else {
        selectRandom ["scoutfounddone1", "scoutfounddone2", "scoutfounddone3"]
    };
} else {
    private _availableMessages = missionNamespace getVariable [
        "availableIntelMessagesDone",
        ["foundDone1", "foundDone2", "foundDone3"]
    ];

    if (count _availableMessages > 0) then {
        private _selected = selectRandom _availableMessages;
        _availableMessages = _availableMessages - [_selected]; 
        missionNamespace setVariable ["availableIntelMessagesDone", _availableMessages, true];
        _selected
    } else {
        selectRandom ["foundDone1", "foundDone2", "foundDone3"]
    };
};

[_message, [_caller]] remoteExec [
    "FoxClub_fnc_Conversation", 
    allPlayers select {_x distance _caller <= 50}
];