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