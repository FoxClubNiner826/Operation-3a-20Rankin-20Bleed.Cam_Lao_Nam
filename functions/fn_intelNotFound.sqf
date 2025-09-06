/*
    File: fn_intelNotFound.sqf
    Author: FoxClubNiner
    Description:
        Determines if the caller is the Scout or not then picks a random voice line from the pool, 
        removes it so it can’t repeat until exhausted, and broadcasts it with FoxClub_fnc_Conversation.
*/

if (_caller == _scout) then {
            // Get or initialize the shuffled list
            private _scoutIntelMessages = missionNamespace getVariable ["intelScoutMessageQueue", []];
            private _lastScoutMessage = missionNamespace getVariable ["lastScoutIntelMessage", ""];

            // If the list is empty, generate and shuffle a new one
            if (_scoutIntelMessages isEqualTo []) then {
                _scoutIntelMessages = ["scoutnotfound1", "scoutnotfound2", "scoutnotfound3"];
                _scoutIntelMessages = _scoutIntelMessages call BIS_fnc_arrayShuffle;

                // Ensure the first message isn't the same as the last used one
                if (!(_lastScoutMessage isEqualTo "") && {_scoutIntelMessages select 0 == _lastScoutMessage}) then {
                    // Pick a random index (excluding 0) to swap with
                    private _swapIndex = 1 + floor (random ((count _scoutIntelMessages) - 1));
                    private _temp = _scoutIntelMessages select 0;
                    _scoutIntelMessages set [0, _scoutIntelMessages select _swapIndex];
                    _scoutIntelMessages set [_swapIndex, _temp];
                };
            };

            // Select the first message from the shuffled list
            private _message = _scoutIntelMessages deleteAt 0;

            // Save the updated queue and last message back to missionNamespace
            missionNamespace setVariable ["intelScoutMessageQueue", _scoutIntelMessages, true];
            missionNamespace setVariable ["lastScoutIntelMessage", _message, true];
    
            // Play function
            [_message, [_caller]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 50}];
            } else {
             // Get or initialize the shuffled list
            private _intelMessages = missionNamespace getVariable ["intelMessageQueue", []];
            private _lastMessage = missionNamespace getVariable ["lastIntelMessage", ""];

            // If the list is empty, generate and shuffle a new one
            if (_intelMessages isEqualTo []) then {
                _intelMessages = ["notfound1", "notfound2", "notfound3"];
                _intelMessages = _intelMessages call BIS_fnc_arrayShuffle;

                // Ensure the first message isn't the same as the last used one
                if (!(_lastMessage isEqualTo "") && {_intelMessages select 0 == _lastMessage}) then {
                    // Pick a random index (excluding 0) to swap with
                    private _swapIndex = 1 + floor (random ((count _intelMessages) - 1));
                    private _temp = _intelMessages select 0;
                    _intelMessages set [0, _intelMessages select _swapIndex];
                    _intelMessages set [_swapIndex, _temp];
                };
            };

            // Select the first message from the shuffled list
            private _message = _intelMessages deleteAt 0;

            // Save the updated queue and last message back to missionNamespace
            missionNamespace setVariable ["intelMessageQueue", _intelMessages, true];
            missionNamespace setVariable ["lastIntelMessage", _message, true];
    
            // Play function
            [_message, [_caller]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 50}];   
            };