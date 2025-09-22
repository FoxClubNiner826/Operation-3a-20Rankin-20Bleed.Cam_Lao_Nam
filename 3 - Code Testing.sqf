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

if (get variable) then {
    sleep 5;
    // code
} else {
    // same code minus the sleep
};