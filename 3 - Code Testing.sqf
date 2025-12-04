null=[]spawn 
{ 
sleep 3;
ExtractHeli action ["engineOff", vehicle ExtractHeli];
sleep 10; 
 _group = ExtractHeliGroup;  
 _markerName = "marker1_4";   
 _waypointPosition = getMarkerPos _markerName;  
 _waypoint = _group addWaypoint [_waypointPosition, -1]; 
 _waypoint setWaypointType "GETOUT";  
 _group setCurrentWaypoint [_group, 4];
sleep 10;
_group = ExtractHeliGroup; 
 _markerName = "marker1_5";  
 _waypointPosition = getMarkerPos _markerName; 
 _waypoint = _group addWaypoint [_waypointPosition, -1]; 
 _waypoint setWaypointType "MOVE"; 
 _group setCurrentWaypoint [_group, 5]; 
};

if (missionNamespace getVariable ["waitPassed", false]) then {
    ["patrolleaves", [leader player]] remoteExec ["FoxClub_fnc_Conversation"];
};

 private _aopass = missionNamespace getVariable ["aopass", false];

 if (!_aopass) then {
    ["patrolleaves", [leader player]] remoteExec ["FoxClub_fnc_Conversation"];
};

[]spawn { 
    if (!alive SmokePassState) then { 
        ["nosmokeconvo", [ranger, leader player]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance heli <= 100}];  
        sleep 3; 
        ["extractpass", [ranger, HQRadio]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance heli <= 100}];  
    } else { 
        ["extractpass", [ranger, HQRadio]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance heli <= 100}];  
    }; 
}; 

[ranger, "CARELESS"] remoteExec ["setCombatBehaviour", ranger]; 
[rangercopilot, "CARELESS"] remoteExec ["setCombatBehaviour", rangercopilot]; 
[doorgunner1, "CARELESS"] remoteExec ["setCombatBehaviour", doorgunner1]; 
[doorgunner2, "CARELESS"] remoteExec ["setCombatBehaviour", doorgunner2];


if (isNil "SmokeThrown") then {
    _player addEventHandler ["FiredMan", {
    params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle"];

    // remove EH if task is complete
    if (!isNil "SmokeThrown") exitWith {
        _unit removeEventHandler [_thisEvent, _thisEventHandler];
    };

    // Handle each type of smoke grenade
    if ("vn_m18_purple_mag" in _magazine && _unit inArea "Grenade_Marker" && triggerActivated ExtractConvo) then {
        [_projectile] spawn {
            params ["_thrownSmoke"];
            waitUntil {uiSleep 1; abs (speed _thrownSmoke) == 0};
            if !(_thrownSmoke inArea "Grenade_Marker") exitWith {};
            _smokeEmitter = "SmokeShellPurple_Infinite" createVehicle getPos _thrownSmoke;
            };
        missionNamespace setVariable ["SmokeThrown", true, true];
        };
    }];
};

params ["_player", "_didJIP"];
if (isNil "SmokeThrown") then {
	_player addEventHandler ["FiredMan", {
		params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle"];
		
        
        if (!isNil "SmokeThrown") exitWith {
			_unit removeEventHandler [_thisEvent, _thisEventHandler];
		};
		
        
        if ("vn_m18_purple_mag" in _magazine && _unit distance markerPos "Grenade_Marker" < 100) then {
			[_projectile] spawn {
				params ["_thrownSmoke"];
				waitUntil {uiSleep 1; abs speed _thrownSmoke == 0};
				if !(_thrownSmoke inArea "Grenade_Marker") exitWith {};
			    _smokeEmitter = "SmokeShellPurple_Infinite" createVehicle getPos _thrownSmoke;
				deleteVehicle _thrownSmoke;
			};
			missionNamespace setVariable ["SmokeThrown", true, true];
			Covey sideChat "Covey, Rankin. I see grape smoke please confirm, over.";
		};
		

_scout = missionNamespace getVariable ["scout", objNull];

if (_caller == _scout) then {



} else {



};


if (pow in heli) then {
    _playersInHeli = (switchableUnits + playableUnits) select { _x in heli };
    _randomPlayer = selectRandom _playersinHeli;
    _scout = missionNamespace getVariable ["scout", objNull];

    if (_randomPlayer == _scout) then {
        ["scoutseesprisonPOW", [ranger, pow, _scout]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance heli <= 100}];
    } else {
        ["playersseeprisonPOW", [ranger, _randomPlayer, pow]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance heli <= 100}];
    };

} else {
    _playersInHeli = (switchableUnits + playableUnits) select { _x in heli };
    _randomPlayer = selectRandom _playersinHeli;
    _scout = missionNamespace getVariable ["scout", objNull];

    if (_randomPlayer == _scout) then {
        ["scoutseesprison", [ranger, _scout]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance heli <= 100}];
    } else {
        ["playersseeprison", [ranger, _randomPlayer]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance heli <= 100}];
    };
};


[]spawn {
    if (!alive SmokePassState) then {
        ["nosmokeconvo", [ranger, leader player]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance heli <= 100}]; 
        sleep 10;
        playsound "talkradio"; 
        ranger sideChat "Ranger, Hawk. Rankin has been exfiltrated. We are RTB. Over.";
        sleep 6;
        playsound "talkradio";
        HQRadio sideChat "Hawk, Ranger. Copy that. Safe return."; 
    } else {
        playsound "talkradio"; 
        ranger sideChat "Ranger, Hawk. Rankin has been exfiltrated. We are RTB. Over.";
        sleep 6;
        playsound "talkradio";
        HQRadio sideChat "Hawk, Ranger. Copy that. Safe return."; 
    };
};

[ranger, "CARELESS"] remoteExec ["setCombatBehaviour", ranger];
[rangercopilot, "CARELESS"] remoteExec ["setCombatBehaviour", rangercopilot];
[doorgunner1, "CARELESS"] remoteExec ["setCombatBehaviour", doorgunner1];
[doorgunner2, "CARELESS"] remoteExec ["setCombatBehaviour", doorgunner2];


playsound "talkradio"; 
ranger sideChat "Ranger, Hawk. Rankin has been exfiltrated. We are RTB. Over.";
sleep 6;
playsound "talkradio";
HQRadio sideChat "Hawk, Ranger. Copy that. Safe return.";

[]spawn {
    if (!alive SmokePassState) then {
        ["nosmokeconvo", [ranger, leader player]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance heli <= 100}]; 
        sleep 5;
        ["exfilconvo", [ranger, HQRadio]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance heli <= 100}]; 
    } else {
        ["exfilconvo", [ranger, HQRadio]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance heli <= 100}]; 
    };
};

// working fine:
/* Define objects (Replace with actual object variable names in your mission)
private _objects = [obj1, obj2, obj3, obj4, obj5, obj6, obj7, obj8, obj9, obj10, obj11, obj12, obj13, obj14, obj15, obj16];

{
    [
	_x,
	"<t color='#FFFF00'>Search for Intel</t>",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa", //idle icon 
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa", //progress icon
	"_this distance _target < 3", //condition
	"true", //condition progress
	{}, //code on start
	{}, // code every tick
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
        // Remove action for all players once hold action is complete
        [_target, _actionId] remoteExec ["BIS_fnc_holdActionRemove", 0, _target];
        
        private _soldierObject = _target in [obj11, obj12, obj13, obj14, obj15, obj16]; // Identify objects 11-16
        private _multiplier = if (_soldierObject) then {0.05} else {0.1}; // 5% multiplier for soldiers 11-16, 10% for others

        // Increase attempt count
        private _attemptCount = missionNamespace getVariable ["holdActionAttemptCount", 0];
        _attemptCount = _attemptCount + 1;
        missionNamespace setVariable ["holdActionAttemptCount", _attemptCount, true];
        
        // Calculate chance based on multiplier
        private _chance = _attemptCount * _multiplier * 100; // Adjust the chance based on multiplier
        private _randomRoll = random 100;

        // Check if intel was found
        if (_randomRoll < _chance) then {
            private _availableMessages = missionNamespace getVariable ["availableIntelMessages", ["found1", "found2", "found3"]];
            private _message = if (count _availableMessages > 0) then {
                private _selected = selectRandom _availableMessages;
                _availableMessages = _availableMessages - [_selected]; 
                missionNamespace setVariable ["availableIntelMessages", _availableMessages, true];
                _selected;
                } else {
                selectRandom ["found1", "found2", "found3"];
                };

        // Play function
        [_message, [_caller]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];

        // Makes sure no task is selected twice
        private _tasks = ["cacheTask", "gunboatTask", "samsiteTask"] select {!(missionNamespace getVariable [_x, false])};
        if (_tasks isNotEqualTo []) then {
            private _selectedTask = selectRandom _tasks;
            missionNamespace setVariable [_selectedTask, true, true];
            _tasks = _tasks - [_selectedTask];
        };

        // Remove all holdActions if no tasks remain 
        if (_tasks isEqualTo []) then {
            private _objects = [obj1, obj2, obj3, obj4, obj5, obj6, obj7, obj8, obj9, obj10, obj11, obj12, obj13, obj14, obj15, obj16];
            { [_x, _actionId] remoteExec ["BIS_fnc_holdActionRemove", 0, _x]; } forEach _objects;
        };
        
        // message if nothing found
        }  else {
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
            [_message, [_caller]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];
        };
	}, // code on finish
	{}, // code on interuption
	[], //arguements
	3, //duration
	8, //order from top
	true, //remove on finish
	false, //show if unconcious
	false //show in middle of screen
    ] call BIS_fnc_holdActionAdd;

} forEach _objects;
*/

///////////////////////////////////////////////////////
///////////////////////////////////////////////////////
// holdAction for bodies to search in Lumphat
///////////////////////////////////////////////////////
///////////////////////////////////////////////////////
/*
// Define objects for holdAction
private _objectsBody = [obj11, obj12, obj13, obj14, obj15, obj16];

{
    [
	_x,
	"<t color='#FFFF00'>Search Body for Intel</t>",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa", //idle icon 
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa", //progress icon
	"_this distance _target < 3", //condition
	"true", //condition progress
	{
        // This runs on holdAction start. The purpose is to determine if the scout character activated it because he has unique voice lines.
        params ["_target", "_caller", "_actionId", "_arguments"];
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
    }, //code on start
	{}, // code every tick
	{
		// This runs after the holdAction has been completed
        params ["_target", "_caller", "_actionId", "_arguments"];
        _scout = missionNamespace getVariable ["scout", objNull]; //prevents errors if noone is play scout
        // Remove action for all players once hold action is complete
        [_target, _actionId] remoteExec ["BIS_fnc_holdActionRemove", 0, _target];
        
        // Increase attempt count
        private _attemptCount = missionNamespace getVariable ["holdActionAttemptCount", 0];
        _attemptCount = _attemptCount + 1;
        missionNamespace setVariable ["holdActionAttemptCount", _attemptCount, true];
        [format ["Attempt Count: %1", _attemptCount]] remoteExec ["systemChat"];

        // Calculate chance based on multiplier. More attempts increase the chance of success.
        private _chance = _attemptCount * 0.05 * 100; // Adjust the chance based on multiplier
        private _randomRoll = random 100;
        [format ["Chance: %1%%", _chance]] remoteExec ["systemChat"];

        // Check if intel was found. If yes, then run the code below.
        if (_randomRoll < _chance) then {
            // check if the scout called the holdAction because he has unique voice lines.
            if (_caller == _scout) then {    
                private _availableScoutMessages = missionNamespace getVariable ["availablescoutIntelMessages", ["scoutfound1", "scoutfound2", "scoutfound3"]];
                private _message = if (count _availableScoutMessages > 0) then {
                private _selected = selectRandom _availableScoutMessages;
                _availableScoutMessages = _availableScoutMessages - [_selected]; 
                missionNamespace setVariable ["availablescoutIntelMessages", _availableScoutMessages, true];
                _selected;
                } else {
                selectRandom ["scoutfound1", "scoutfound2", "scoutfound3"];
                };

            // Play function
            [_message, [_caller]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 50}];
            } else {
                private _availableMessages = missionNamespace getVariable ["availableIntelMessages", ["found1", "found2", "found3"]];
                private _message = if (count _availableMessages > 0) then {
                private _selected = selectRandom _availableMessages;
                _availableMessages = _availableMessages - [_selected]; 
                missionNamespace setVariable ["availableIntelMessages", _availableMessages, true];
                _selected;
                } else {
                selectRandom ["found1", "found2", "found3"];
                };

            // Play function
            [_message, [_caller]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 50}];
            };
            
            // Makes sure no task is selected twice
            private _tasks = ["cacheTask", "gunboatTask", "samsiteTask"] select {!(missionNamespace getVariable [_x, false])};
            if (_tasks isNotEqualTo []) then {
                private _selectedTask = selectRandom _tasks;
                missionNamespace setVariable [_selectedTask, true, true];
                _tasks = _tasks - [_selectedTask];
            };

            // Remove all holdActions if no tasks remain 
            if (_tasks isEqualTo []) then {
                private _objects = [obj3, obj4, obj5, obj6, obj7, obj8, obj9, obj10, obj11, obj12, obj13, obj14, obj15, obj16];
                { [_x, _actionId] remoteExec ["BIS_fnc_holdActionRemove", 0, _x]; } forEach _objects;
            };

            // Sends reinforcements to Lumphat if players were spotted. Players get one guarenteed side task before backup comes.
            if (missionNamespace getVariable ["playersSpottedLumphat", false] && !(missionNamespace getVariable ["reinforcements", false])) then {
                missionNamespace setVariable ["reinforcements", true, true];
            };

            // message if nothing found missionNamespace getVariable ["reinforcements", false];
            // if the roll doesn't suceed then run the code below.
        } else {
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
        };
	}, // code on finish
	{}, // code on interuption
	[], //arguements
	5, //duration
	8, //order from top
	true, //remove on finish
	false, //show if unconcious
	false //show in middle of screen
    ] call BIS_fnc_holdActionAdd;

} forEach _objectsBody;

///////////////////////////////////////////////////////
///////////////////////////////////////////////////////
// holdAction for files to search in Lumphat
///////////////////////////////////////////////////////
///////////////////////////////////////////////////////

// Define objects (Replace with actual object variable names in your mission)
private _objectsFile = [obj4, obj3];

{
    [
	_x,
	"<t color='#FFFF00'>Search Folder for Intel</t>",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa", //idle icon 
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa", //progress icon
	"_this distance _target < 3", //condition
	"true", //condition progress
	{
        params ["_target", "_caller", "_actionId", "_arguments"];
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
    }, //code on start
	{}, // code every tick
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
        // Remove action for all players once hold action is complete
        [_target, _actionId] remoteExec ["BIS_fnc_holdActionRemove", 0, _target];

        // Increase attempt count
        private _attemptCount = missionNamespace getVariable ["holdActionAttemptCount", 0];
        _attemptCount = _attemptCount + 1;
        missionNamespace setVariable ["holdActionAttemptCount", _attemptCount, true];
        [format ["Attempt Count: %1", _attemptCount]] remoteExec ["systemChat"];
        
        // Calculate chance based on multiplier
        private _chance = _attemptCount * 0.10 * 100; // Adjust the chance based on multiplier
        private _randomRoll = random 100;
        [format ["Chance: %1%%", _chance]] remoteExec ["systemChat"];

        // Check if intel was found
        if (_randomRoll < _chance) then {
            private _availableMessages = missionNamespace getVariable ["availableIntelMessages", ["found1", "found2", "found3"]];
            private _message = if (count _availableMessages > 0) then {
                private _selected = selectRandom _availableMessages;
                _availableMessages = _availableMessages - [_selected]; 
                missionNamespace setVariable ["availableIntelMessages", _availableMessages, true];
                _selected;
                } else {
                selectRandom ["found1", "found2", "found3"];
                };

        // Play function
        [_message, [_caller]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 50}];

        // Makes sure no task is selected twice
        private _tasks = ["cacheTask", "gunboatTask", "samsiteTask"] select {!(missionNamespace getVariable [_x, false])};
        if (_tasks isNotEqualTo []) then {
            private _selectedTask = selectRandom _tasks;
            missionNamespace setVariable [_selectedTask, true, true];
            _tasks = _tasks - [_selectedTask];
        };

        // Remove all holdActions if no tasks remain 
        if (_tasks isEqualTo []) then {
            private _objects = [obj3, obj4, obj5, obj6, obj7, obj8, obj9, obj10, obj11, obj12, obj13, obj14, obj15, obj16];
            { [_x, _actionId] remoteExec ["BIS_fnc_holdActionRemove", 0, _x]; } forEach _objects;
        };
        
        // Sends reinforcements to Lumphat if players were spotted. Players get one guarenteed side task before backup comes.
            if (missionNamespace getVariable ["playersSpottedLumphat", false] && !(missionNamespace getVariable ["reinforcements", false])) then {
                missionNamespace setVariable ["reinforcements", true, true];
            };

        // message if nothing found
        }  else {
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
	}, // code on finish
	{}, // code on interuption
	[], //arguements
	5, //duration
	8, //order from top
	true, //remove on finish
	false, //show if unconcious
	false //show in middle of screen
    ] call BIS_fnc_holdActionAdd;

} forEach _objectsFile;

///////////////////////////////////////////////////////
///////////////////////////////////////////////////////
// holdAction for lockers to search in Lumphat
///////////////////////////////////////////////////////
///////////////////////////////////////////////////////

// Define objects (Replace with actual object variable names in your mission)
private _objectsLocker = [obj6, obj5];

{
    [
	_x,
	"<t color='#FFFF00'>Search Locker for Intel</t>",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa", //idle icon 
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa", //progress icon
	"_this distance _target < 3", //condition
	"true", //condition progress
	{
        params ["_target", "_caller", "_actionId", "_arguments"];
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
    }, //code on start
	{}, // code every tick
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
        // Remove action for all players once hold action is complete
        [_target, _actionId] remoteExec ["BIS_fnc_holdActionRemove", 0, _target];
        
        // Increase attempt count
        private _attemptCount = missionNamespace getVariable ["holdActionAttemptCount", 0];
        _attemptCount = _attemptCount + 1;
        missionNamespace setVariable ["holdActionAttemptCount", _attemptCount, true];
        [format ["Attempt Count: %1", _attemptCount]] remoteExec ["systemChat"];
        
        // Calculate chance based on multiplier
        private _chance = _attemptCount * 0.075 * 100; // Adjust the chance based on multiplier
        private _randomRoll = random 100;
        [format ["Chance: %1%%", _chance]] remoteExec ["systemChat"];

        // Check if intel was found
        if (_randomRoll < _chance) then {
            private _availableMessages = missionNamespace getVariable ["availableIntelMessages", ["found1", "found2", "found3"]];
            private _message = if (count _availableMessages > 0) then {
                private _selected = selectRandom _availableMessages;
                _availableMessages = _availableMessages - [_selected]; 
                missionNamespace setVariable ["availableIntelMessages", _availableMessages, true];
                _selected;
                } else {
                selectRandom ["found1", "found2", "found3"];
                };

        // Play function
        [_message, [_caller]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 50}];

        // Makes sure no task is selected twice
        private _tasks = ["cacheTask", "gunboatTask", "samsiteTask"] select {!(missionNamespace getVariable [_x, false])};
        if (_tasks isNotEqualTo []) then {
            private _selectedTask = selectRandom _tasks;
            missionNamespace setVariable [_selectedTask, true, true];
            _tasks = _tasks - [_selectedTask];
        };

        // Remove all holdActions if no tasks remain 
        if (_tasks isEqualTo []) then {
            private _objects = [obj3, obj4, obj5, obj6, obj7, obj8, obj9, obj10, obj11, obj12, obj13, obj14, obj15, obj16];
            { [_x, _actionId] remoteExec ["BIS_fnc_holdActionRemove", 0, _x]; } forEach _objects;
        };
        
        // Sends reinforcements to Lumphat if players were spotted. Players get one guarenteed side task before backup comes.
            if (missionNamespace getVariable ["playersSpottedLumphat", false] && !(missionNamespace getVariable ["reinforcements", false])) then {
                missionNamespace setVariable ["reinforcements", true, true];
            };

        // message if nothing found
        }  else {
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
	}, // code on finish
	{}, // code on interuption
	[], //arguements
	5, //duration
	8, //order from top
	true, //remove on finish
	false, //show if unconcious
	false //show in middle of screen
    ] call BIS_fnc_holdActionAdd;

} forEach _objectsLocker;

///////////////////////////////////////////////////////
///////////////////////////////////////////////////////
// holdAction for cabinets to search in Lumphat
///////////////////////////////////////////////////////
///////////////////////////////////////////////////////

// Define objects (Replace with actual object variable names in your mission)
private _objectsCabinet = [obj8, obj7];

{
    [
	_x,
	"<t color='#FFFF00'>Search File Cabinet for Intel</t>",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa", //idle icon 
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa", //progress icon
	"_this distance _target < 3", //condition
	"true", //condition progress
	{
        params ["_target", "_caller", "_actionId", "_arguments"];
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
    }, //code on start
	{}, // code every tick
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
        // Remove action for all players once hold action is complete
        [_target, _actionId] remoteExec ["BIS_fnc_holdActionRemove", 0, _target];
      
        // Increase attempt count
        private _attemptCount = missionNamespace getVariable ["holdActionAttemptCount", 0];
        _attemptCount = _attemptCount + 1;
        missionNamespace setVariable ["holdActionAttemptCount", _attemptCount, true];
        [format ["Attempt Count: %1", _attemptCount]] remoteExec ["systemChat"];
        
        // Calculate chance based on multiplier
        private _chance = _attemptCount * 0.15 * 100; // Adjust the chance based on multiplier
        private _randomRoll = random 100;
        [format ["Chance: %1%%", _chance]] remoteExec ["systemChat"];

        // Check if intel was found
        if (_randomRoll < _chance) then {
            private _availableMessages = missionNamespace getVariable ["availableIntelMessages", ["found1", "found2", "found3"]];
            private _message = if (count _availableMessages > 0) then {
                private _selected = selectRandom _availableMessages;
                _availableMessages = _availableMessages - [_selected]; 
                missionNamespace setVariable ["availableIntelMessages", _availableMessages, true];
                _selected;
                } else {
                selectRandom ["found1", "found2", "found3"];
                };

        // Play function
        [_message, [_caller]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 50}];

        // Makes sure no task is selected twice
        private _tasks = ["cacheTask", "gunboatTask", "samsiteTask"] select {!(missionNamespace getVariable [_x, false])};
        if (_tasks isNotEqualTo []) then {
            private _selectedTask = selectRandom _tasks;
            missionNamespace setVariable [_selectedTask, true, true];
            _tasks = _tasks - [_selectedTask];
        };

        // Remove all holdActions if no tasks remain 
        if (_tasks isEqualTo []) then {
            private _objects = [obj3, obj4, obj5, obj6, obj7, obj8, obj9, obj10, obj11, obj12, obj13, obj14, obj15, obj16];
            { [_x, _actionId] remoteExec ["BIS_fnc_holdActionRemove", 0, _x]; } forEach _objects;
        };
        
        // Sends reinforcements to Lumphat if players were spotted. Players get one guarenteed side task before backup comes.
            if (missionNamespace getVariable ["playersSpottedLumphat", false] && !(missionNamespace getVariable ["reinforcements", false])) then {
                missionNamespace setVariable ["reinforcements", true, true];
            };

        // message if nothing found
        }  else {
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
	}, // code on finish
	{}, // code on interuption
	[], //arguements
	5, //duration
	8, //order from top
	true, //remove on finish
	false, //show if unconcious
	false //show in middle of screen
    ] call BIS_fnc_holdActionAdd;

} forEach _objectsCabinet;

///////////////////////////////////////////////////////
///////////////////////////////////////////////////////
// holdAction for cars to search in Lumphat
///////////////////////////////////////////////////////
///////////////////////////////////////////////////////

// Define objects (Replace with actual object variable names in your mission)
private _objectsCar = [obj10, obj9];

{
    [
	_x,
	"<t color='#FFFF00'>Search Vehicle for Intel</t>",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa", //idle icon 
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa", //progress icon
	"_this distance _target < 3", //condition
	"true", //condition progress
	{
        params ["_target", "_caller", "_actionId", "_arguments"];
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
    }, //code on start
	{}, // code every tick
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
        // Remove action for all players once hold action is complete
        [_target, _actionId] remoteExec ["BIS_fnc_holdActionRemove", 0, _target];
        
        // Increase attempt count
        private _attemptCount = missionNamespace getVariable ["holdActionAttemptCount", 0];
        _attemptCount = _attemptCount + 1;
        missionNamespace setVariable ["holdActionAttemptCount", _attemptCount, true];
        [format ["Attempt Count: %1", _attemptCount]] remoteExec ["systemChat"];
        
        // Calculate chance based on multiplier
        private _chance = _attemptCount * 0.05 * 100; // Adjust the chance based on multiplier
        private _randomRoll = random 100;
        [format ["Chance: %1%%", _chance]] remoteExec ["systemChat"];

        // Check if intel was found
        if (_randomRoll < _chance) then {
            private _availableMessages = missionNamespace getVariable ["availableIntelMessages", ["found1", "found2", "found3"]];
            private _message = if (count _availableMessages > 0) then {
                private _selected = selectRandom _availableMessages;
                _availableMessages = _availableMessages - [_selected]; 
                missionNamespace setVariable ["availableIntelMessages", _availableMessages, true];
                _selected;
                } else {
                selectRandom ["found1", "found2", "found3"];
                };

        // Play function
        [_message, [_caller]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 50}];

        // Makes sure no task is selected twice
        private _tasks = ["cacheTask", "gunboatTask", "samsiteTask"] select {!(missionNamespace getVariable [_x, false])};
        if (_tasks isNotEqualTo []) then {
            private _selectedTask = selectRandom _tasks;
            missionNamespace setVariable [_selectedTask, true, true];
            _tasks = _tasks - [_selectedTask];
        };

        // Remove all holdActions if no tasks remain 
        if (_tasks isEqualTo []) then {
            private _objects = [obj3, obj4, obj5, obj6, obj7, obj8, obj9, obj10, obj11, obj12, obj13, obj14, obj15, obj16];
            { [_x, _actionId] remoteExec ["BIS_fnc_holdActionRemove", 0, _x]; } forEach _objects;

            _scout = missionNamespace getVariable ["scout", objNull];
            if (_caller == _scout) then {
                ["scoutLumphatSearched", [_caller]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];
            } else {
                ["LumphatSearched", [_caller]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];
            };
        };
        
        // Sends reinforcements to Lumphat if players were spotted. Players get one guarenteed side task before backup comes.
            if (missionNamespace getVariable ["playersSpottedLumphat", false] && !(missionNamespace getVariable ["reinforcements", false])) then {
                missionNamespace setVariable ["reinforcements", true, true];
            };

        // message if nothing found
        }  else {
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
	}, // code on finish
	{}, // code on interuption
	[], //arguements
	5, //duration
	8, //order from top
	true, //remove on finish
	false, //show if unconcious
	false //show in middle of screen
    ] call BIS_fnc_holdActionAdd;

} forEach _objectsCar;
*/

_scout = missionNamespace getVariable ["scout", objNull]; 

if (leader player == _scout) then { 
                    ["scoutLumphatSearched", [_scout]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _scout <= 100}]; 
                } else { 
                    ["LumphatSearched", [leader player]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance leader player <= 100}]; 
                };
//old version
private _tasks = ["cacheTask", "gunboatTask", "samsiteTask"] select {!(missionNamespace getVariable [_x, false])};
            if (_tasks isNotEqualTo []) then {
                private _selectedTask = selectRandom _tasks;
                if (_selectedTask == "gunboatTask") then {
                    if (gunboat == objNull) then {
				        missionNamespace setVariable [gunboatTaskComplete, true, true];
				    } else {
                        missionNamespace setVariable [gunboatTask, true, true];
                    };
                };
                if (_selectedTask == "samsiteTask") then {
                    if (samlauncher == objNull && samradar == objNull) then {
				        missionNamespace setVariable [samsiteTaskComplete, true, true];
				    } else {
                        missionNamespace setVariable [samsiteTask, true, true];
                    };
                };
                if (_selectedTask == "cacheTask") then {
                    if (foodcache == objNull && shelter1 == objNull) then {
				        missionNamespace setVariable [cacheTaskComplete, true, true];
				    } else {
                        missionNamespace setVariable [cacheTask, true, true];
                    };
                };
                _tasks = _tasks - [_selectedTask];
            };


// Makes sure no task is selected twice
            private _tasks = ["cacheTask", "gunboatTask", "samsiteTask"] select {!(missionNamespace getVariable [_x, false])};
            if (_tasks isNotEqualTo []) then {
                private _selectedTask = selectRandom _tasks;
                missionNamespace setVariable [_selectedTask, true, true];
                _tasks = _tasks - [_selectedTask];
                //if players complete a task before they receive the task
				if (gunboat == objNull) then {
				    missionNamespace setVariable [gunboatTaskComplete, true, true];
				};
				if (samlauncher == objNull && samradar == objNull) then {
				    missionNamespace setVariable [samsiteTaskComplete, true, true];
				};
				if (foodcache == objNull && shelter1 == objNull) then {
				    missionNamespace setVariable [cacheTaskComplete, true, true];
				};
            };

(missionNamespace getVariable ["cacheTask", false] || missionNamespace getVariable ["cacheTaskAlreadyDone", false]) && 
(missionNamespace getVariable ["gunboatTask", false] || missionNamespace getVariable ["gunboatTaskAlreadyDone", false]) && 
(missionNamespace getVariable ["samsiteTask", false] || missionNamespace getVariable ["samsiteTaskAlreadyDone", false]);


_scout = missionNamespace getVariable ["scout", objNull];
if (leader playergroup == _scout) then {
["scoutSays", [_scout]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance leader playergroup <= 100}];
} else {
["anyoneElseSays", [leader playergroup]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance leader playergroup <= 100}];
};


if (!(missionNamespace getVariable ["dontsaydeadboat", false])) then {

    _scout = missionNamespace getVariable ["scout", objNull]; // prevents an error if Nil is returned

    if (!isNull _scout && alive _scout && _scout in units playergroup && leader playergroup == _scout) then {
        // Scout is alive and in the group
        ["scoutSays", [_scout]] remoteExec [
            "FoxClub_fnc_Conversation",
            allPlayers select { _x distance _scout <= 100 }
        ];
    } else {
        // Anyone else leading will speak
        ["anyoneElseSays", [leader playergroup]] remoteExec [
            "FoxClub_fnc_Conversation",
            allPlayers select { _x distance leader playergroup <= 100 }
        ];
    };

};


_scout = missionNamespace getVariable ["scout", objNull];
_leader = leader playergroup;
__randomUnitInBoat = 

if (!isNull _scout && alive _scout && _scout in units playergroup && vehicle _scout == ptboat) then {
    ["wrongWayCoveScout", [_scout]] remoteExec [
        "FoxClub_fnc_Conversation",
        allPlayers select { _x distance _scout <= 100 }
    ];
} else {
    if (!isNull _leader && alive _leader && vehicle _leader == ptboat) then {
        ["wrongWayCove", [_leader]] remoteExec [
            "FoxClub_fnc_Conversation",
            allPlayers select { _x distance _leader <= 100 }
        ];
    } else {
        ["wrongWayCove", [_randomUnitInBoat]] remoteExec [
            "FoxClub_fnc_Conversation",
            allPlayers select { _x distance marcinko <= 100 }
        ];
    };
};

_scout = missionNamespace getVariable ["scout", objNull];
_leader = leader playergroup;
_unitsInBoat = crew ptboat - [_leader];
_randomUnitInBoat = if (count _unitsInBoat > 0) then { selectRandom _unitsInBoat } else { objNull };

if (!isNull _scout && alive _scout && _scout in units playergroup && vehicle _scout == ptboat) then {
    ["wrongWayCoveScout", [_scout]] remoteExec [
        "FoxClub_fnc_Conversation",
        allPlayers select { _x distance _scout <= 100 }
    ];
} else {
    if (!isNull _leader && alive _leader && vehicle _leader == ptboat) then {
        ["wrongWayCove", [_leader]] remoteExec [
            "FoxClub_fnc_Conversation",
            allPlayers select { _x distance _leader <= 100 }
        ];
    } else {
        if (!isNull _randomUnitInBoat && alive _randomUnitInBoat) then {
            ["wrongWayCove", [_randomUnitInBoat]] remoteExec [
                "FoxClub_fnc_Conversation",
                allPlayers select { _x distance _randomUnitInBoat <= 100 }
            ];
        };
    };
};

_scout = missionNamespace getVariable ["scout", objNull];
_leader = leader playergroup;
_unitsInBoat = crew ptboat - [_leader];
_randomUnitInBoat = if (count _unitsInBoat > 0) then { selectRandom _unitsInBoat } else { objNull };

call {
if (alive _scout && _scout in units playergroup && vehicle _scout == ptboat) exitWith { 
    ["wrongWayCoveScout", [_scout]] remoteExec [
        "FoxClub_fnc_Conversation",
        allPlayers select { _x distance _scout <= 100 }
    ]; };
if (alive _leader && vehicle _leader == ptboat) exitWith { 
    ["wrongWayCove", [_leader]] remoteExec [
        "FoxClub_fnc_Conversation",
        allPlayers select { _x distance _leader <= 100 }
    ]; };
if (alive _randomUnitInBoat) then {
    ["wrongWayCove", [_randomUnitInBoat]] remoteExec [
        "FoxClub_fnc_Conversation",
        allPlayers select { _x distance _randomUnitInBoat <= 100 }
        ];
    };
};


_scout = missionNamespace getVariable ["scout", objNull];
_randomUnitInGroup = selectRandom units playergroup;

if (alive _randomUnitInGroup && _randomUnitInGroup == scout) then { 
    ["patrolspottedScout", [_scout]] remoteExec [
        "FoxClub_fnc_Conversation",
        allPlayers select { _x distance _scout <= 100 }
    ]
} else {
    ["patrolspotted", [_randomUnitInGroup]] remoteExec [
        "FoxClub_fnc_Conversation",
        allPlayers select { _x distance _randomUnitInGroup <= 100 }
    ]
};

isNil 'skipToInfil' && (allPlayers - crew ptboat) isEqualTo []



if (pow in extractheli && !(pilot in extractheli)) then {
    [pow] join ambulanceGroup;
    pow assignAsCargo ambulance;
    [pow] orderGetIn true;
    waituntil {pow in ambulance};
    missionNamespace setvariable ["ambulanceMove", true, true];
};

if (pilot in extractheli && !(pow in extractheli)) then {
    [pilot] join ambulanceGroup;
    pilot assignAsCargo ambulance;
    [pilot] orderGetIn true;
    waituntil {pilot in ambulance};
    missionNamespace setvariable ["ambulanceMove", true, true];
};

if (pow in extractheli && pilot in extractheli) then {
    [pow] join ambulanceGroup;
    pow assignAsCargo ambulance;
    [pow] orderGetIn true;
    [pilot] join ambulanceGroup;
    pilot assignAsCargo ambulance;
    [pilot] orderGetIn true;
    waituntil {pow in ambulance && pilot in ambulance};
    missionNamespace setvariable ["ambulanceMove", true, true];
};


[] spawn { 
 
sleep 39; 
{ 
 removeHeadgear _x; 
} forEach units extractHeliGroup; 
sleep 1; 
 
extractHeliGroup leaveVehicle extractHeli; 
extractHeliGroup setBehaviourstrong "CARELESS"; 
extractHeliGroup setSpeedMode "LIMITED"; 
 
waitUntil {units extractHeliGroup findIf { _x in extractHeli } == -1}; 
sleep 1; 
 
extractHeliGroup addWaypoint [[7062.49,4292.03,0], -1, 4, "FirstRoad"]; 
[extractHeliGroup, 4] setWaypointType "MOVE"; //supposedly addwaypoint defaults to move but this is more readable.
 
extractHeliGroup addWaypoint [[7103.78,4238.36,0], -1, 5, "MiddleRoad"]; 
[extractHeliGroup, 5] setWaypointType "MOVE"; 
 
extractHeliGroup addWaypoint [[7075.68,4182.71,0], -1, 6, "LastRoad"]; 
[extractHeliGroup, 6] setWaypointType "MOVE"; 
  
};

// How to make a unit play an idle animation in a chair
// Okay, I *think* I have an actual workflow now that doesn't take forever.
// 1. Use Polpox Artwork Mod; so you don't have to do trial and error positioning from the debug console.
// 2. Copy the sit animation from the animation viewer and play the animation in the editor.
// 3. Now you can position the unit precisely over the chair as you like.
// 4. Start the game, open the debug console, and grab some coordinates:

getPos sitUnit4; // get the unit's position in the world
[situnit4, beachTable] call BIS_fnc_vectorDirAndUpRelative; // get the object rotation axis values.

// 5. Go back to the editor. In `init.sqf`, place your commands and values (place it in a server only trigger leads to more consistant placement):

sitUnit4 switchMove "HubSittingChairUA_idle2"; // play the idle sitting animation
sitUnit4 setPos [7105.6,4265.25,-0.125195]; // positions the unit over the chair
situnit4 attachTo [beachTable]; // attach to chair so that engine doesn't move it away (collision issue)
situnit4 setVectorDirAndUp [[0.895294,-0.12485,0.427622],[-0.418435,0.0936603,0.903405]]; // rotates the unit on the chosen axis values

// 6. Tested in SP and MP, and so far so good.

// Said units
[sitUnit1, "HubSittingChairUA_move1"] remoteExec ["switchMove", 0];
sitUnit1 setPos [7106.21,4263.12,-0.130786]; 
situnit1 attachTo [beachTable];
situnit1 setVectorDirAndUp [[0.921097,-0.0558925,0.385301],[-0.387132,-0.0263705,0.921647]];

sitUnit1 addEventHandler ["AnimDone", { 
	params ["_unit", "_anim"];

	if (!alive _unit) exitWith {
		_unit removeEventHandler [_thisEvent, _thisEventHandler];
	};

	[_unit, _anim] spawn { 
		params ["_unit", "_anim"]; 
		sleep 5; 
		if (alive _unit) then {
			[_unit, "HubSittingChairUA_move1"] remoteExec ["switchMove", 0];
		};   
	};
}];

[sitUnit4, "HubSittingChairUC_move1"] remoteExec ["switchMove", 0];
sitUnit4 setPos [7105.56,4265.2,-0.250104]; 
sitUnit4 attachTo [beachTable];
sitUnit4 setVectorDirAndUp [[0.934886,-0.132127,0.329441],[-0.31527,0.117314,0.941723]];

sitUnit4 addEventHandler ["AnimDone", { 
	params ["_unit", "_anim"]; 

	if (!alive _unit) exitWith {
		_unit removeEventHandler [_thisEvent, _thisEventHandler];
	};

	[_unit, _anim] spawn { 
		params ["_unit", "_anim"]; 
		sleep 5; 
		if (alive _unit) then {
			[_unit, "HubSittingChairUC_move1"] remoteExec ["switchMove", 0];
		};   
	}; 
}];

[sitUnit2, "HubSittingChairB_move1"] remoteExec ["switchMove", 0];
sitUnit2 setPos [7097.29,4270.65,-0.0696521]; 
sitUnit2 attachTo [beachTable];
sitUnit2 setVectorDirAndUp [[0.837171,-0.511276,0.194271],[-0.155992,0.117245,0.980775]];

sitUnit2 addEventHandler ["AnimDone", { 
	params ["_unit", "_anim"]; 

	if (!alive _unit) exitWith {
		_unit removeEventHandler [_thisEvent, _thisEventHandler];
	};

	[_unit, _anim] spawn { 
		params ["_unit", "_anim"]; 
		sleep 5; 
		if (alive _unit) then {
			[_unit, "HubSittingChairB_move1"] remoteExec ["switchMove", 0];
		};   
	}; 
}];

[sitUnit5, "HubSittingChairA_idle3"] remoteExec ["switchMove", 0];
sitUnit5 setPos [7117.45,4245.98,-0.17016]; 
sitUnit5 attachTo [beachTable];
sitUnit5 setVectorDirAndUp [[0.873453,-0.139163,0.466598],[-0.44218,0.174504,0.879787]];

sitUnit5 addEventHandler ["AnimDone", { 
	params ["_unit", "_anim"]; 

	if (!alive _unit) exitWith {
		_unit removeEventHandler [_thisEvent, _thisEventHandler];
	};

	[_unit, _anim] spawn { 
		params ["_unit", "_anim"]; 
		sleep 5; 
		if (alive _unit) then {
			[_unit, "HubSittingChairA_idle3"] remoteExec ["switchMove", 0];
		};   
	}; 
}];

// mechanic walk across street and starts repair on truck
mechanic1 setVectorDirAndUp [[-0.757396,-0.652955,0],[0,0,1]];
mechanic1 switchMove ["InBaseMoves_repairVehiclePne", 0, 0]; 
mechanic1 playMove "InBaseMoves_repairVehiclePne";

mechanic1 addEventHandler ["AnimDone", {
 params ["_unit", "_anim"];
 systemChat "firedMain";
 if (_anim == "Acts_hubTalk_scratchHead1") then {
  _unit switchMove ["InBaseMoves_repairVehiclePne", 0, 0];
  _unit playMove "InBaseMoves_repairVehiclePne";
  systemChat "firedProne";
 };  
 if (_anim == "InBaseMoves_repairVehiclePne") then {
  _unit switchMove ["Acts_hubTalk_scratchHead1", 0, 0];
  _unit playMove "Acts_hubTalk_scratchHead1";
  systemChat "firedScratch";
 };
}];

// mechanic 2 works on the wheel of the truck
[mechanic2, "InBaseMoves_repairVehicleKnl"] remoteExec ["switchMove", 0]; 
[mechanic2, "InBaseMoves_repairVehicleKnl"] remoteExec ["playMove", 0]; 
mechanic2 setPos [7082.31,4257.55,0.00253987]; 
mechanic2 attachTo [beachTable];  
mechanic2 setVectorDirAndUp [[-0.566752,0.823889,0],[0,0,1]];

mechanic2 addEventHandler ["AnimDone", {
    params ["_unit", "_anim"];
    systemChat "firedMain";

    if (_anim == "Acts_hubTalk_scratchHead1") then {
        systemChat "firedRepair";
        [_unit, ["InBaseMoves_repairVehicleKnl", 0, 0]] remoteExec ["switchMove", 0]; 
        [_unit, "InBaseMoves_repairVehicleKnl"] remoteExec ["playMove", 0];
    };  
    if (_anim == "InBaseMoves_repairVehicleKnl") then {
        systemChat "firedScratch";
        [_unit, ["Acts_hubTalk_scratchHead1", 0, 0]] remoteExec ["switchMove", 0]; 
        [_unit, "Acts_hubTalk_scratchHead1"] remoteExec ["playMove", 0];
    };
}];

if (local sitUnit5) then {
[sitUnit5, "HubSittingChairA_idle3"] remoteExec ["switchMove", 0]; 
sitUnit5 setPos [7117.45,4245.98,-0.17016];  
sitUnit5 attachTo [beachTable]; 
sitUnit5 setVectorDirAndUp [[0.873453,-0.139163,0.466598],[-0.44218,0.174504,0.879787]]; 
 
sitUnit5 addEventHandler ["AnimDone", {  
 params ["_unit", "_anim"];  
 
 if (!alive _unit) exitWith { 
  _unit removeEventHandler [_thisEvent, _thisEventHandler]; 
 }; 
 
 [_unit, _anim] spawn {  
  params ["_unit", "_anim"];  
  sleep 5;  
  if (alive _unit) then { 
   [_unit, "HubSittingChairA_idle3"] remoteExec ["switchMove", 0]; 
  };    
 };  
}];
};

//old sitting version
[sitUnit1, "HubSittingChairUA_move1"] remoteExec ["switchMove", 0]; 
sitUnit1 setPos [7106.21,4263.12,-0.130786];  
situnit1 attachTo [beachTable]; 
situnit1 setVectorDirAndUp [[0.921097,-0.0558925,0.385301],[-0.387132,-0.0263705,0.921647]]; 
 
sitUnit1 addEventHandler ["AnimDone", {  
 params ["_unit", "_anim"]; 
 
 if (!alive _unit) exitWith { 
  _unit removeEventHandler [_thisEvent, _thisEventHandler]; 
 }; 
 
 [_unit, _anim] spawn {  
  params ["_unit", "_anim"];  
  sleep 5;  
  if (alive _unit) then { 
   [_unit, "HubSittingChairUA_move1"] remoteExec ["switchMove", 0]; 
  };    
 }; 
}]; 

[sitUnit5, "HubSittingChairA_idle3"] remoteExec ["switchMove", 0];  
sitUnit5 setPos [7117.45,4245.98,-0.17016];   
sitUnit5 attachTo [beachTable];  
sitUnit5 setVectorDirAndUp [[0.873453,-0.139163,0.466598],[-0.44218,0.174504,0.879787]];  
  
sitUnit5 addEventHandler ["AnimDone", {   
 params ["_unit", "_anim"];   
  
 if (!alive _unit) exitWith {  
  _unit removeEventHandler [_thisEvent, _thisEventHandler];  
 };  
  
 [_unit, _anim] spawn {   
  params ["_unit", "_anim"];   
  sleep 5;   
  if (alive _unit) then {  
   [_unit, "HubSittingChairA_idle3"] remoteExec ["switchMove", 0];  
  };     
 };   
}];

[sitUnit4, "HubSittingChairUC_move1"] remoteExec ["switchMove", 0]; 
sitUnit4 setPos [7105.56,4265.2,-0.250104];  
sitUnit4 attachTo [beachTable]; 
sitUnit4 setVectorDirAndUp [[0.934886,-0.132127,0.329441],[-0.31527,0.117314,0.941723]]; 
 
sitUnit4 addEventHandler ["AnimDone", {  
 params ["_unit", "_anim"];  
 
 if (!alive _unit) exitWith { 
  _unit removeEventHandler [_thisEvent, _thisEventHandler]; 
 }; 
 
 [_unit, _anim] spawn {  
  params ["_unit", "_anim"];  
  sleep 5;  
  if (alive _unit) then { 
   [_unit, "HubSittingChairUC_move1"] remoteExec ["switchMove", 0]; 
  };    
 };  
}];

[sitUnit2, "HubSittingChairB_move1"] remoteExec ["switchMove", 0]; 
sitUnit2 setPos [7097.29,4270.65,-0.0696521];  
sitUnit2 attachTo [beachTable]; 
sitUnit2 setVectorDirAndUp [[0.837171,-0.511276,0.194271],[-0.155992,0.117245,0.980775]]; 
 
sitUnit2 addEventHandler ["AnimDone", {  
 params ["_unit", "_anim"];  
 
 if (!alive _unit) exitWith { 
  _unit removeEventHandler [_thisEvent, _thisEventHandler]; 
 }; 
 
 [_unit, _anim] spawn {  
  params ["_unit", "_anim"];  
  sleep 5;  
  if (alive _unit) then { 
   [_unit, "HubSittingChairB_move1"] remoteExec ["switchMove", 0]; 
  };    
 };  
}];

mechanic1 setVectorDirAndUp [[-0.757396,-0.652955,0],[0,0,1]];
mechanic1 switchMove ["InBaseMoves_repairVehiclePne", 0, 0]; 
mechanic1 playMove "InBaseMoves_repairVehiclePne";

mechanic1 addEventHandler ["AnimDone", {
 params ["_unit", "_anim"];
 if (_anim == "Acts_hubTalk_scratchHead1") then {
  _unit switchMove ["InBaseMoves_repairVehiclePne", 0, 0];
  _unit playMove "InBaseMoves_repairVehiclePne";
 };  
 if (_anim == "InBaseMoves_repairVehiclePne") then {
  _unit switchMove ["Acts_hubTalk_scratchHead1", 0, 0];
  _unit playMove "Acts_hubTalk_scratchHead1";
 };
}];


// staging area optimizations
// Outpost
{ 
    outpostHeli deleteVehicleCrew _x 
} forEach crew outpostHeli;

deleteVehicle outpostHeli;

{
    deleteVehicle _x;
} forEach units outpostGroup1;

{
    deleteVehicle _x;
} forEach units outpostGroup2;

// Prison
{ 
    prisonJeep deleteVehicleCrew _x 
} forEach crew prisonJeep;

deleteVehicle prisonJeep;

{
    deleteVehicle _x;
} forEach units prisonGroup2;

{
    deleteVehicle _x;
} forEach units prisonGroup3;

{
    deleteVehicle _x;
} forEach units prisonerGroup1;

{
    deleteVehicle _x;
} forEach units prisonerGroup2;

{
    deleteVehicle _x;
} forEach units prisonerGroup3;

{
    deleteVehicle _x;
} forEach units prisonerGroup4;

{
    deleteVehicle _x;
} forEach units prisonerGroup5;

//delete this at infil, no longer needed 
deleteVehicle tsk_undeteced_infilFailed;
deleteVehicle tsk_hvt_infilFailed;
deleteVehicle tsk_stab_infilFailed;
deleteVehicle tsk_exfil_infilFailed;
deleteVehicle tsk_search_infilFailed;
deleteVehicle tsk_undeteced_infilFailed_stealthed;
deleteVehicle tsk_hvt_infilFailed_stealthed;
deleteVehicle tsk_STAB_infilFailed_stealthed;
deleteVehicle tsk_exfil_infilFailed_stealthed;
deleteVehicle tsk_search_infilFailed_stealthed;

deleteVehicle trg_undeteced_infilFailed;
deleteVehicle trg_hvt_infilFailed;
deleteVehicle trg_stab_infilFailed;
deleteVehicle trg_exfil_infilFailed;
deleteVehicle trg_search_infilFailed;
deleteVehicle trg_undeteced_infilFailed_stealthed;
deleteVehicle trg_hvt_infilFailed_stealthed;
deleteVehicle trg_STAB_infilFailed_stealthed;
deleteVehicle trg_exfil_infilFailed_stealthed;
deleteVehicle trg_search_infilFailed_stealthed;





this switchMove ["HubBriefing_lookAround2", 0, 0];

marcinko switchMove ["", 0, 0];

switch (true) do { 
	case (leader playerGroup in extractheli && scout in extractheli && pow in extractheli): {
		["case1"] remoteExec ["systemChat", 0];
		_scout = missionNamespace getVariable ["scout", objNull]; 
		_pilot = missionNamespace getVariable ["pilot", objNull]; 
		_pow   = missionNamespace getVariable ["pow", objNull]; 
		_leader = leader playergroup; 
 
		private _aboard = (crew extractHeli) select { alive _x && _x in units playerGroup }; 
		private _eligible = _aboard select { !(_x in [_scout, _pilot, _pow]) };
		private "_speaker";
		if (count _eligible > 0) then { 
			_speaker = selectRandom _eligible; 
		} else { 
			_speaker = objNull;   
		}; 
 
		if (alive _leader && _leader != _scout && vehicle _leader == extractheli) then {   
			["seePrisonPOW", [ranger, _leader, _pow, _scout]] remoteExec [ 
				"FoxClub_fnc_Conversation", 
				allPlayers select { _x distance ranger <= 100 } 
			]; 
		} else { 
			if (alive _scout && _leader == _scout && vehicle _scout == extractheli) then {   
				["seePrisonScoutPOW", [ranger, _speaker, _pow, _scout]] remoteExec [  
					"FoxClub_fnc_Conversation",  
					allPlayers select { _x distance ranger <= 100 }  
				];   
			}  
		}; 
	}; 
	case (leader playerGroup in extractheli && scout in extractheli): {
		["case2"] remoteExec ["systemChat", 0];
		_scout = missionNamespace getVariable ["scout", objNull]; 
		_pilot = missionNamespace getVariable ["pilot", objNull]; 
		_pow   = missionNamespace getVariable ["pow", objNull]; 
		_leader = leader playergroup; 
 
		private _aboard = (crew extractHeli) select { alive _x && _x in units playerGroup }; 
		private _eligible = _aboard select { !(_x in [_scout, _pilot, _pow]) }; 
		private "_speaker";
		if (count _eligible > 0) then { 
			_speaker = selectRandom _eligible; 
		} else { 
			_speaker = objNull;   
		};  
 
		if (alive _leader && _leader != _scout && vehicle _leader == extractheli) then {   
			["seePrison", [ranger, _leader, _scout]] remoteExec [ 
				"FoxClub_fnc_Conversation", 
				allPlayers select { _x distance ranger <= 100 } 
			]; 
		} else { 
			if (alive _scout && _leader == _scout && vehicle _scout == extractheli) then {   
				["seePrisonScout", [ranger, _scout, _speaker]] remoteExec [  
					"FoxClub_fnc_Conversation",  
					allPlayers select { _x distance ranger <= 100 }  
				];   
			}  
		}; 
	}; 
	default {
		["defaultCase"] remoteExec ["systemChat", 0];
		_scout   = missionNamespace getVariable ["scout", objNull];	
		_leader  = leader playerGroup; 
 
		private _aboard = units playerGroup select { alive _x && _x in extractheli }; 
		private _speaker = objNull; 
 
		if (_leader in _aboard && _leader != _scout) then { 
			_speaker = _leader; 
		} else { 
			private _players = _aboard select { isPlayer _x };
			if (count _players > 0) then {
				_speaker = selectRandom _players;
			} else {
				private _ais = _aboard select { !isPlayer _x };
				_speaker = selectRandom _ais;
			}; 
		}; 
 
		private _convo = ["seePrisonDefault", "seePrisonDefaultScout"] select (_speaker == _scout); 
		[_convo, [ranger, _speaker]] remoteExec [ 
			"FoxClub_fnc_Conversation", 
			allPlayers select { _x distance ranger <= 100 } 
		]; 
	}; 
};

[] spawn {
[ptunit1, "AmovPercMstpSnonWnonDnon_exercisePushup"] remoteExec ["foxClub_fnc_loopAnimation2", 0];
Sleep 3;
[ptunit2, "AmovPercMstpSnonWnonDnon_exercisePushup"] remoteExec ["foxClub_fnc_loopAnimation2", 0];
Sleep 1;
[ptunit3, "AmovPercMstpSnonWnonDnon_exercisePushup"] remoteExec ["foxClub_fnc_loopAnimation2", 0];
};


[] spawn {
[ptunit1, "AmovPercMstpSnonWnonDnon_exercisePushup"] call foxClub_fnc_loopAnimation2;
Sleep 3;
[ptunit2, "AmovPercMstpSnonWnonDnon_exercisePushup"] call foxClub_fnc_loopAnimation2;
Sleep 1;
[ptunit3, "AmovPercMstpSnonWnonDnon_exercisePushup"] call foxClub_fnc_loopAnimation2;
};

_scout = missionNamespace getVariable ["scout", objNull];
private _allPrimary = missionnamespace getVariable ["AllPriTasksComplete",false];
private _allSecondary = missionnamespace getVariable ["AllSecTasksComplete",false];
private _someSecondary = missionNamespace getVariable ["SomeSecTasksComplete",false];
private _hvtDead = missionNamespace getVariable ["hvtDead",false];
private _stabFailed = missionNamespace getVariable ["stabFailed",false];
private _hvtFled = missionNamespace getVariable ["hvtFled",false];
private _stabPassed = missionNamespace getVariable ["stabPassed",false];
private _powDied = missionNamespace getVariable ["powDied",false];
private _pilotDied = missionNamespace getVariable ["pilotDied",false];
private _menLeftBehind = missionNamespace getVariable ["extractTaskFailed",false];

if (_allPrimary) then {
    // intial greet convo
    if (_hvtPass) then {
        // hvt pass convos
        if (_powFound || _pilotFound) then {
            if (_powRescued) then {
                //pow saved convos
                if (_allSecondary) then {
                };
                if (_someSecondary) then {
                };
                if (_noSecondary) then {
                }; 
            } else { 
                // pow dead convos
                if (_allSecondary) then {
                };
                if (_someSecondary) then {
                };
                if (_noSecondary) then {
                };
            };
            if (_pilotRescued) then {
                //pilot saved convos
                if (_allSecondary) then {
                };
                if (_someSecondary) then {
                };
                if (_noSecondary) then {
                };
            } else {
                //pilot dead convos
                if (_allSecondary) then {
                };
                if (_someSecondary) then {
                };
                if (_noSecondary) then {
                };
            };
        } else {
            // standard convos if pow and pilot were not found
            if (_allSecondary) then {
                // all primary/secondary convo
            };
            if (_someSecondary) then {
                // all primary and some secondary convo
            };
            if (_noSecondary) then {
                // all primary and no secondary convo
            };
        };
    } else {
        // hvt failed convos
        if (_powFound || _pilotFound) then {
            if (_powRescued) then {
                //pow saved convos
                if (_allSecondary) then {
                };
                if (_someSecondary) then {
                };
                if (_noSecondary) then {
                }; 
            } else { 
                // pow dead convos
                if (_allSecondary) then {
                };
                if (_someSecondary) then {
                };
                if (_noSecondary) then {
                };
            };
            if (_pilotRescued) then {
                //pilot saved convos
                if (_allSecondary) then {
                };
                if (_someSecondary) then {
                };
                if (_noSecondary) then {
                };
            } else {
                //pilot dead convos
                if (_allSecondary) then {
                };
                if (_someSecondary) then {
                };
                if (_noSecondary) then {
                };
            };
        } else {
            // standard convos if pow and pilot were not found
            if (_allSecondary) then {
                // all primary/secondary convo
            };
            if (_someSecondary) then {
                // all primary and some secondary convo
            };
            if (_noSecondary) then {
                // all primary and no secondary convo
            };
        };
    };
};


if (!_allPrimary) then {
    // intial greet convo
    if (_powFound || _pilotFound) then {
        if (_powRescued) then {
            //pow saved convos
            if (_allSecondary) then {
            };
            if (_someSecondary) then {
            };
            if (_noSecondary) then {
            }; 
        } else { 
            // pow dead convos
            if (_allSecondary) then {
            };
            if (_someSecondary) then {
            };
            if (_noSecondary) then {
            };
        };
        if (_pilotRescued) then {
            //pilot saved convos
            if (_allSecondary) then {
            };
            if (_someSecondary) then {
            };
            if (_noSecondary) then {
            };
        } else {
            //pilot dead convos
            if (_allSecondary) then {
            };
            if (_someSecondary) then {
            };
            if (_noSecondary) then {
            };
        };
    } else {
        // standard convos if pow and pilot were not found
        if (_allSecondary) then {
        };
        if (_someSecondary) then {
        };
        if (_noSecondary) then {
        };
    };
};



if (!_allPrimary) exitWith {};

private _sentences = ["greetings"];
if (_powFound || _pilotRescued) then
{
    _sentences pushBack (["powLost", "powSaved"] select _powFound);
    _sentences pushBack (["pilotDead", "pilotSaved"] select _pilotRescued);
}
else
{
    _sentences pushBack "nobodySaved";
};

switch { true } do
{
    case _allSecondary: { _sentences pushBack "allSecondary"; };
    case _someSecondary: { _sentences pushBack "someSecondary"; };
    case _noSecondary: { _sentences pushBack "noSecondary"; };
};

{
    [_x, [_caller, ranger], true] remoteExec [
        "FoxClub_fnc_Conversation",
        allPlayers select { _x distance _caller <= 100 }
    ];
} forEach _sentences;



private _allPrimary = missionnamespace getVariable ["AllPriTasksComplete",false];
private _allSecondary = missionnamespace getVariable ["AllSecTasksComplete",false];
private _someSecondary = missionNamespace getVariable ["SomeSecTasksComplete",false];
private _noSecondary = missionNamespace getVariable ["noSecTasksComplete",false];
private _powFound = missionNamespace getVariable ["powFound",false];
private _pilotRescued = missionNamespace getVariable ["pilotRescued",false];

if (!_allPrimary) exitWith {};

private _sentences = ["debrief"];
if (_powFound || _pilotRescued) then
{
	_sentences pushBack (["allPallSfoundDead", "allPallSfoundAlive"] select _powFound);
	_sentences pushBack (["allPallSfoundDead", "allPallSfoundAlive"] select _pilotRescued);
}
else
{
	_sentences pushBack "allPallS";
};

switch { true } do
{
	case _allSecondary: { _sentences pushBack "allSec"; };
	case _someSecondary: { _sentences pushBack "someSec"; };
	case _noSecondary: { _sentences pushBack "noSec"; };
};

{
	[_x, [command, testUnit], true] remoteExec [
		"FoxClub_fnc_Conversation",
		allPlayers select { _x distance command <= 100 }
	];
} forEach _sentences;


private _allPrimary = missionnamespace getVariable ["AllPriTasksComplete",false];
private _allSecondary = missionnamespace getVariable ["AllSecTasksComplete",false];
private _someSecondary = missionNamespace getVariable ["SomeSecTasksComplete",false];
private _noSecondary = missionNamespace getVariable ["noSecTasksComplete",false];
private _powFound = missionNamespace getVariable ["powFound",false];
private _pilotRescued = missionNamespace getVariable ["pilotRescued",false];

if (!_allPrimary) exitWith {};

private _sentences = ["debrief"];
if (_powFound || _pilotRescued) then
{
	_sentences pushBack (["allPallSfoundDead", "allPallSfoundAlive"] select _powFound);
	_sentences pushBack (["allPallSfoundDead", "allPallSfoundAlive"] select _pilotRescued);
}
else
{
	_sentences pushBack "allPallS";
};

switch { true } do
{
	case _allSecondary: { _sentences pushBack "allSec"; };
	case _someSecondary: { _sentences pushBack "someSec"; };
	case _noSecondary: { _sentences pushBack "noSec"; };
};

{
	waitUntil {(missionnamespace getVariable ["functionOn", false])};
	[_x, [command, testUnit], true] remoteExec [
		"FoxClub_fnc_Conversation",
		allPlayers select { _x distance command <= 100 }
	];
} forEach _sentences;

missionnamespace setVariable ["AllPriTasksComplete", true, true];
//missionnamespace setVariable ["AllSecTasksComplete", true, true];
//missionNamespace setVariable ["SomeSecTasksComplete", true, true];
//missionNamespace setVariable ["noSecTasksComplete", true, true];
//missionNamespace setVariable ["powFound", true, true];
//missionNamespace setVariable ["pilotRescued", true, true];

// newest version
private _hvtPass = missionNamespace getVariable ["hvtPass",false];
private _hvtMid = missionNamespace getVariable ["hvtMid",false];
private _hvtFailed = missionNamespace getVariable ["hvtFailed",false];

private _stabPassed = missionNamespace getVariable ["stabPassed",false];

private _allSecondary = missionnamespace getVariable ["AllSecTasksComplete",false];
private _someSecondary = missionNamespace getVariable ["SomeSecTasksComplete",false];
private _noSecondary = missionNamespace getVariable ["noSecTasksComplete",false];

private _powFound = missionNamespace getVariable ["powFound",false];
private _pilotFound = missionNamespace getVariable ["pilotFound",false];
private _powRescued = missionNamespace getVariable ["powRescued",false];
private _pilotRescued = missionNamespace getVariable ["pilotRescued",false];

private _extractPassed = missionNamespace getVariable ["extractPassed",false];

if (!isServer) exitWith {};

//if (!_allPrimary) exitWith {};

//systemChat "fired";

private _sentences = [];

_sentences append ["debrief", 8];

// hvt convos
switch (true) do
{
	case ( _hvtPass ):
	{
		_sentences append ["hvtPass", 10];
		//systemChat "allSec";
	};
	case ( _hvtMid && _hvtFailed ):
	{
		_sentences append ["hvtMid", 10];
		//systemChat "someSec";
	};
	case ( _hvtFailed ):
	{
		_sentences append ["hvtFailed", 10];
		//systemChat "noSec";
	};
};

// stab convos
_sentences append ([["stabFailed", 10], ["stabPassed", 10]] select _stabPassed );

// secondary tasks convos
switch (true) do
{
	case ( _allSecondary ):
	{
		_sentences append ["allSec", 8];
	};

	case ( _someSecondary ):
	{
		_sentences append ["someSec", 8];
	};
	default
	{
		_sentences append ["noSec", 8];
	};
};

// rescued convos
switch (true) do
{
	case ( _pilotFound && _powFound ):
		{
			_sentences append ([["pilotAndPowDied", 8], ["pilotAndPowRescued", 8]] select (_pilotRescued && _powRescued) );
		};
	case ( _powFound ):
		{
			_sentences append ([["powDied", 8], ["powRescued", 8]] select _powRescued);
		};
	case ( _pilotFound ):
		{
			_sentences append ([["pilotDied", 8], ["pilotRescued", 8]] select _pilotRescued);
		};
};

// extract convos
_sentences append ([["extractFailed", 8], ["extractPassed", 8]] select _extractPassed );

// wrapup convo and mission exit screen
switch (true) do
{
	case ( missionNamespace getVariable ["hvtPass",false] &&
			missionNamespace getVariable ["stabPassed",false] &&
			missionNamespace getVariable ["extractPassed",false] &&
			missionnamespace getVariable ["AllSecTasksComplete",false] ):
		{
			_sentences append ["summaryBest", 8];
		};
	case ( missionNamespace getVariable ["hvtPass",false] &&
			missionNamespace getVariable ["stabPassed",false] &&
			missionNamespace getVariable ["extractPassed",false] ):
		{
			_sentences append ["summaryGood", 8];
		};
	case ( !(missionNamespace getVariable ["hvtPass",false]) &&
			!(missionNamespace getVariable ["stabPassed",false]) &&
			!(missionNamespace getVariable ["extractPassed",false]) ):
		{
			_sentences append ["summaryPoor", 8];
		};
	default
		{
			_sentences append ["summaryDefault", 8];
		};
};

// play all gathered strings now
for "_i" from 0 to (count _sentences - 1) step 2 do
{
	[_sentences select _i, [command, testUnit], true] remoteExec [
		"FoxClub_fnc_Conversation",	
		allPlayers select { _x distance testUnit <= 100 }	
	];
	sleep (_sentences select (_i + 1));
};

private _hvtPass	= missionNamespace getVariable ["hvtPass", false];
private _hvtMid	 = missionNamespace getVariable ["hvtMid", false];
private _hvtFailed  = missionNamespace getVariable ["hvtFailed", false];

private _stabPassed = missionNamespace getVariable ["stabPassed", false];

private _allSecondary  = missionNamespace getVariable ["AllSecTasksComplete", false];
private _someSecondary = missionNamespace getVariable ["SomeSecTasksComplete", false];

private _powFound	  = missionNamespace getVariable ["powFound", false];
private _pilotFound	= missionNamespace getVariable ["pilotFound", false];
private _powRescued	= missionNamespace getVariable ["powRescued", false];
private _pilotRescued  = missionNamespace getVariable ["pilotRescued", false];
private _powDied	   = missionNamespace getVariable ["powDied", false];
private _pilotDied	 = missionNamespace getVariable ["pilotDied", false];

private _extractPassed = missionNamespace getVariable ["extractPassed", false];

private _scout  = missionNamespace getVariable ["scout", objNull];
private _caller = missionNamespace getVariable ["command", objNull];


//if (!isServer) exitWith {};

private _sentences = [];


_sentences pushBack
(
	"debrief"
	+ (if (_caller == _scout) then {"Scout"} else {""})
);


// hvt convos
switch (true) do
{
	case (_hvtPass):
	{
		_sentences pushBack
		(
			"hvtPass"
			+ (if (_caller == _scout) then {"Scout"} else {""})
		);
	};

	case (_hvtMid && _hvtFailed):
	{
		_sentences pushBack
		(
			"hvtMid"
			+ (if (_caller == _scout) then {"Scout"} else {""})
		);
	};

	case (_hvtFailed):
	{
		_sentences pushBack
		(
			"hvtFailed"
			+ (if (_caller == _scout) then {"Scout"} else {""})
		);
	};
};


// stab convos
_sentences pushBack
(
	(["stabFailed", "stabPassed"] select _stabPassed)
	+ (if (_caller == _scout) then {"Scout"} else {""})
);


// secondary tasks convos
switch (true) do
{
	case (_allSecondary):
	{
		_sentences pushBack
		(
			"allSec"
			+ (if (_caller == _scout) then {"Scout"} else {""})
		);
	};

	case (_someSecondary):
	{
		_sentences pushBack
		(
			"someSec"
			+ (if (_caller == _scout) then {"Scout"} else {""})
		);
	};

	default
	{
		_sentences pushBack
		(
			"noSec"
			+ (if (_caller == _scout) then {"Scout"} else {""})
		);
	};
};


// rescued convos
switch (true) do
{
	case (_pilotFound && _powFound): // pow and pilot are found
	{
		_sentences pushBack // pow and pilot are rescued
		(
			(["pilotAndPowDied", "pilotAndPowRescued"] select (_pilotRescued && _powRescued))
			+ (if (_caller == _scout) then {"Scout"} else {""})
		);
	};

	case (_powFound): // pow is found
	{
		_sentences pushBack // pow is rescued if true, else pow died or was left behind
		(
			(["powDied", "powRescued"] select _powRescued)
			+ (if (_caller == _scout) then {"Scout"} else {""})
		);
	};

	case (_pilotFound): // pilot is found
	{
		_sentences pushBack // pilot is rescued if true, else pow died or was left behind
		(
			(["pilotDied", "pilotRescued"] select _pilotRescued)
			+ (if (_caller == _scout) then {"Scout"} else {""})
		);
	};
};


// extract convos
_sentences pushBack
(
	(["extractFailed", "extractPassed"] select _extractPassed)
	+ (if (_caller == _scout) then {"Scout"} else {""})
);


// wrapup convo and mission exit screen
switch (true) do
{
	case // players complete all major tasks and all side tasks plus at least one rescue
	(
		_hvtPass	 &&
		_stabPassed  &&
		_extractPassed &&
		_allSecondary &&
		(
			(
				_pilotRescued ||
				_powRescued
			)
			&&
			(
				!_pilotDied ||
				!_powDied
			)
		)
	):
	{
		_sentences pushBack
		(
			"summaryBest"
			+ (if (_caller == _scout) then {"Scout"} else {""})
		);
	};

	case // players complete all major tasks and all side tasks
	(
		_hvtPass	&&
		_stabPassed &&
		_extractPassed &&
		_allSecondary
	):
	{
		_sentences pushBack
		(
			"summaryBetter"
			+ (if (_caller == _scout) then {"Scout"} else {""})
		);
	};

	case // players complete all major tasks, any number of side tasks including none
	(
		_hvtPass &&
		_stabPassed &&
		_extractPassed
	):
	{
		_sentences pushBack
		(
			"summaryGood"
			+ (if (_caller == _scout) then {"Scout"} else {""})
		);
	};
	
	case // players fail all major tasks
	(
		!_hvtPass	&&
		!_stabPassed &&
		!_extractPassed
	):
	{
		_sentences pushBack
		(
			"summaryPoor"
			+ (if (_caller == _scout) then {"Scout"} else {""})
		);
	};

	case // players fail both these major tasks
	(
		!_hvtPass &&
		!_stabPassed	
	):
	{
		_sentences pushBack
		(
			"summaryLessPoor"
			+ (if (_caller == _scout) then {"Scout"} else {""})
		);
	};
	
	default // players fail at one major tasks
	{
		_sentences pushBack
		(
			"summaryDefault"
			+ (if (_caller == _scout) then {"Scout"} else {""})
		);
	};
};


// send all strings to the function for unpacking
systemChat str _sentences;

[_sentences, [command, testUnit], true] remoteExec
[
	"FoxClub_fnc_Conversation",
	allPlayers select { _x distance command <= 100 }
];

// go through these and implement into the mission 

// hvt possibilities. for mid to work: mid and failed will have to be true. at least one of these is always true.

missionNamespace setVariable ["hvtPass", true, true]; // in holdAction for searching general
missionNamespace setVariable ["hvtMid", true, true]; // in EH of generals car. triggers with car blows up with him inside.
missionNamespace setVariable ["hvtFailed", true, true]; // in trigger once hvt reaches trigger area across the river

//stab possibilities. just need this one since its boolean check
missionNamespace setVariable ["stabPassed", true, true]; // in fail trigger for task "destroy the stab"

//extract possibilities
missionNamespace setVariable ["extractPassed", true, true]; // in complete trigger for task "extract from LZ"

//side task possibilities. no need for noSec since its default case
missionnamespace setVariable ["AllSecTasksComplete", true, true]; // in trigger trg_all_sec_pass
missionNamespace setVariable ["SomeSecTasksComplete", true, true]; // in trigger SomeSecTasksCompleteTrigger

//rescue possibilities
missionNamespace setVariable ["powFound", true, true]; // in trigger: trg_seesPow_convo
missionNamespace setVariable ["pilotFound", true, true]; // in trigger: save_pilot
missionNamespace setVariable ["powRescued", true, true]; // in ambulance EH
missionNamespace setVariable ["pilotRescued", true, true]; // in ambulance EH
missionNamespace setVariable ["powDied", true, true]; // in trigger: POWFail
missionNamespace setVariable ["pilotDied", true, true]; // in trigger: PilotFail

// for testing the ambulance EH
missionNamespace getVariable ["pilotEjected", false];
missionNamespace getVariable ["testPOW", false];


// wait until none of the _speakers have foxclub_var_isTalking == true
//private _waitTimeout = 30; // seconds to wait max (adjust)
//private _endTime = time + _waitTimeout;

waitUntil {
    // count how many speakers are currently marked talking
    private _busyCount = 0;
    {
        if (_x getVariable ["foxclub_var_isTalking", false]) then { _busyCount = _busyCount + 1 };
    } forEach _speakers;
    (_busyCount == 0) //|| (time > _endTime) // stop waiting when clear or timeout
};


&& 
triggerActivated trg_heliRTB;





this addEventHandler ["Killed", {
    params ["_unit", "_killer", "_instigator"];

    [_unit] spawn {
        params ["_unit"];

        //systemChat format ["%1 died!", _unit];

        private _scout = missionNamespace getVariable ["scout", objNull];
        private _convo = ["cachepass", "cachepassScout"] select (_unit == _scout);

        // Mark cache destroyed globally
        missionNamespace setVariable ["weaponsCacheDestroyed", true, true];

        // Explosion effect
        "M_Mo_82mm_AT_LG" createVehicle (getPos testCache);

        sleep 1;

        // Cleanup destroyed objects
        deleteVehicle testCache;
        deleteVehicle ammo_crate2;
        deleteVehicle ammo_crate3;
        deleteVehicle shelter1;

        sleep 1;

        // If both caches destroyed, trigger conversation
        if (
            missionNamespace getVariable ["weaponsCacheDestroyed", false] &&
            missionNamespace getVariable ["foodCacheDestroyed", false]
        ) then {

            [_convo, [_unit]] remoteExec [
                "FoxClub_fnc_Conversation",
                allPlayers select { _x distance _unit <= 100 }
            ];
        };
    };
}];



this addEventHandler ["Killed", {
    params ["_unit", "_killer", "_instigator"];

    [_unit] spawn {
        params ["_unit"];

        //systemChat format ["%1 died!", _unit];

        private _scout = missionNamespace getVariable ["scout", objNull];
        private _convo = ["cachepass", "cachepassScout"] select (_unit == _scout);

        // Mark cache destroyed globally
        missionNamespace setVariable ["foodCacheDestroyed", true, true];

        // Explosion effect
        "M_Mo_82mm_AT_LG" createVehicle (getPos foodcache);

        sleep 1;

        // Cleanup destroyed objects
        deletevehicle foodcache;
        deletevehicle food1;
        deletevehicle food4;
        deletevehicle food5;
        deletevehicle food6;
        deletevehicle food7;
        deletevehicle food8;
        deletevehicle food9;
        deletevehicle food10;
        sleep 1;

        // If both caches destroyed, trigger conversation
        if (
            missionNamespace getVariable ["weaponsCacheDestroyed", false] &&
            missionNamespace getVariable ["foodCacheDestroyed", false]
        ) then {
            
            [_convo, [_unit]] remoteExec [
                "FoxClub_fnc_Conversation",
                allPlayers select { _x distance _unit <= 100 }
            ];
        };
    };
}];



			
params ["_user", "_action"];

systemChat format [
    "Revive Convo Debug: user=%1 | revive_target=%2",
    _user,
    (_user getVariable ['vn_revive_target', objNull])
];

if (!alive _user) exitWith {};

private _radius = 6;
private _near = _user nearEntities ["CAManBase", _radius];
private _downed = _near select {
    _x != _user && lifeState _x == "INCAPACITATED"
};

private _responder = objNull;
private _minDist = _radius + 1;

{
    private _dist = _x distance _user;
    if (_dist < _minDist) then {
        _minDist = _dist;
        _responder = _x;
    };
} forEach _downed;

// _responder is now the closest downed unit (or objNull)

private _convo = switch (_action) do {

    case "help": {
        systemChat "help case fired.";
        "revive_help";
    };

    case "heal": {
        if (!isNull _responder) then {
            // per-target variable to track heals
            private _alreadyHealed = _responder getVariable ["reviveConvoPlayed", false];

            if (!_alreadyHealed) then {
                // first time healing this unit — play convo
                _responder setVariable ["reviveConvoPlayed", true, true]; // mark as done
                systemChat "heal case fired.";

                if (_user == scout) then {
                    ["revive_healer_scout", [_user, _responder]] remoteExec ["foxclub_fnc_conversation", 0];
                } else {
                    ["revive_healer", [_user, _responder]] remoteExec ["foxclub_fnc_conversation", 0];
                };
            } else {
                // second attempt on same unit
                systemChat "heal fired twice!";
            };
        };
    };

    case "revive": { if (_user == scout) then {
                    ["revived_scout_blu", [_user, _responder]] remoteExec ["foxclub_fnc_conversation", 0];
                } else {
                    ["revived_blu_scout", [_user, _responder]] remoteExec ["foxclub_fnc_conversation", 0];
                }; };
    case "drag_player": { systemChat "drag_player case fired."; };
    case "undrag_player": { systemChat "undrag_player case fired."; };
    case "pickup_player": { systemChat "pickup_player case fired."; };
    case "drop_player": { systemChat "drop_player case fired."; };
    case "carried": { systemChat "carried case fired."; };
    case "dragged": { systemChat "dragged case fired."; };
    case "general": { systemChat "general case fired."; };

    default { "" };
};


// _addaction_revive.inc
// a3\functions_f_mp_mark\revive\_addaction_revive.inc

private _title = localize "STR_A3_Revive";
private _iconIdle = bis_fnc_reviveGetActionIcon;
private _iconProgress = ICON_USERACTION_REVIVE;
private _condShow = "[_target] call bis_fnc_reviveIsValid";
private _condProgress = _condShow;
private _codeStart =
{
	SET_BEING_REVIVED(_a0,true);
    
	//start revive animation
	player playAction "medicStart";
};
private _codeProgress = {};
private _codeCompleted =
{
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