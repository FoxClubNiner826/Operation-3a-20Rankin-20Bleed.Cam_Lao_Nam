/*
    File: fn_intelSearch.sqf
    Author: FoxClubNiner
    Description:
        Determines if the caller is the Scout or not then picks a random voice line from the pool, 
        removes it so it can’t repeat until exhausted, and broadcasts it with FoxClub_fnc_Conversation.
*/

_scout = missionNamespace getVariable ["scout", objNull];
if (_caller == _scout) then {
    // Get or initialize the shuffled list
    private _scoutSearchMessages = missionNamespace getVariable ["scoutSearchIntelMessageQueue", []];
    private _lastScoutSearchMessage = missionNamespace getVariable ["lastScoutSearchIntelMessage", ""];

    // If the list is empty, generate and shuffle a new one
    if (_scoutSearchMessages isEqualTo []) then {
        _scoutSearchMessages = ["scoutsearch1", "scoutsearch2", "scoutsearch3"];
        _scoutSearchMessages = _scoutSearchMessages call BIS_fnc_arrayShuffle;

    // Ensure the first message isn't the same as the last used one
    if (!(_lastScoutSearchMessage isEqualTo "") && {_scoutSearchMessages select 0 == _lastScoutSearchMessage}) then {
        // Pick a random index (excluding 0) to swap with
        private _swapIndex = 1 + floor (random ((count _scoutSearchMessages) - 1));
        private _temp = _scoutSearchMessages select 0;
        _scoutSearchMessages set [0, _scoutSearchMessages select _swapIndex];
        _scoutSearchMessages set [_swapIndex, _temp];
        };
    };

    // Select the first message from the shuffled list
    private _message = _scoutSearchMessages deleteAt 0;

    // Save the updated queue and last message back to missionNamespace
    missionNamespace setVariable ["scoutSearchIntelMessageQueue", _scoutSearchMessages, true];
    missionNamespace setVariable ["lastScoutSearchIntelMessage", _message, true];

    // Play function
    [_message, [_caller]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 50}];                 

} else {

    // If anyone other than the scout used the holdAction then run this code block
    // Get or initialize the shuffled list
    private _searchMessages = missionNamespace getVariable ["searchIntelMessageQueue", []];
    private _lastSearchMessage = missionNamespace getVariable ["lastSearchIntelMessage", ""];

    // If the list is empty, generate and shuffle a new one
    if (_searchMessages isEqualTo []) then {
    _searchMessages = ["search1", "search2", "search3"];
    _searchMessages = _searchMessages call BIS_fnc_arrayShuffle;

    // Ensure the first message isn't the same as the last used one
    if (!(_lastSearchMessage isEqualTo "") && {_searchMessages select 0 == _lastSearchMessage}) then {
        // Pick a random index (excluding 0) to swap with
        private _swapIndex = 1 + floor (random ((count _searchMessages) - 1));
        private _temp = _searchMessages select 0;
        _searchMessages set [0, _searchMessages select _swapIndex];
        _searchMessages set [_swapIndex, _temp];
        };
    };

    // Select the first message from the shuffled list
    private _message = _searchMessages deleteAt 0;

    // Save the updated queue and last message back to missionNamespace
    missionNamespace setVariable ["searchIntelMessageQueue", _searchMessages, true];
    missionNamespace setVariable ["lastSearchIntelMessage", _message, true];

    // Play function
    [_message, [_caller]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 50}];       
};