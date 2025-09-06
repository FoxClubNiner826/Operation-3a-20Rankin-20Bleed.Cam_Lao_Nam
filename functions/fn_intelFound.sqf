/*
    File: fn_intelFound.sqf
    Author: FoxClubNiner
    Description:
        Determines if the caller is the Scout or not then picks a random voice line from the pool, 
        removes it so it can’t repeat until exhausted, and broadcasts it with FoxClub_fnc_Conversation.
*/

private _message = if (_caller == _scout) then {    
    private _availableScoutMessages = missionNamespace getVariable [
        "availablescoutIntelMessages",
        ["scoutfound1", "scoutfound2", "scoutfound3"]
    ];

    if (count _availableScoutMessages > 0) then {
        private _selected = selectRandom _availableScoutMessages;
        _availableScoutMessages = _availableScoutMessages - [_selected]; 
        missionNamespace setVariable ["availablescoutIntelMessages", _availableScoutMessages, true];
        _selected
    } else {
        selectRandom ["scoutfound1", "scoutfound2", "scoutfound3"]
    };
} else {
    private _availableMessages = missionNamespace getVariable [
        "availableIntelMessages",
        ["found1", "found2", "found3"]
    ];

    if (count _availableMessages > 0) then {
        private _selected = selectRandom _availableMessages;
        _availableMessages = _availableMessages - [_selected]; 
        missionNamespace setVariable ["availableIntelMessages", _availableMessages, true];
        _selected
    } else {
        selectRandom ["found1", "found2", "found3"]
    };
};

[_message, [_caller]] remoteExec [
    "FoxClub_fnc_Conversation", 
    allPlayers select {_x distance _caller <= 50}
];