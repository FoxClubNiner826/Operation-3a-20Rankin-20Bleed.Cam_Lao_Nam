//radioChannelCreate [[1, 1, 1, 1], "Q-dance Radio", "%UNIT_NAME", command, false];

missionNamespace setVariable ["AllowActionTalk", true, true];
missionNamespace setVariable ["ActionTalkToMarcinko1", true, true];
missionNamespace setVariable ["ActionTalkToMarcinko2", true, true];
missionNamespace setVariable ["ActionTalkToMarcinko3", true, true];
missionNamespace setVariable ["ActionTalkToMarcinko4", true, true];
missionNamespace setVariable ["ActionTalkToMarcinko5", true, true];
missionNamespace setVariable ["ActionTalkToMarcinko6", true, true];
missionNamespace setVariable ["ActionTalkToMarcinko7", true, true];
missionNamespace setVariable ["ActionTalkToCarson", false, true];
missionNamespace setVariable ["ActionCallPOW", false, true];
ExtractAction = false;
RTBAction = false;
ChopperLZ = false;
ChopperRTB = false;
ActionEndMission = false;
missionNamespace setVariable ["ActionDebrief", false, true];

//Below is an unworking attempt to make the bombs available only from OUTSIDE the boat.
//ActionSTABTimeBombs = units west findIf { isPlayer _x && _x in ptboat } == -1;
//missionNamespace setVariable ["ActionSTABTimeBombs", false, true];

//Updates rescue pilot markers on the map. runs on server for performance.
[] spawn {
    private _offset = [(sin(random 360) * random 100), (cos(random 360) * random 100), 0];
    while {true} do {
        "PilotArea" setMarkerPos (getPosATL pilot vectorAdd _offset);
        "RescuePilotText" setMarkerPos (markerPos "PilotArea");
        sleep 1;
    };
};

//random clouds on mission start
//_RandomClouds = (random 1); //too dark probably for players to nav
_RandomClouds = (random [0.2, .35, 0.43]);
0 setOvercast _RandomClouds;
forceWeatherChange;

/*
// attempt to end mission if FF was detected
_isFriendly = {
    params ["_unit", "_shooter"];
    // Log the unit and shooter for debugging
    diag_log format ["Checking if shooter %1 is friendly to unit %2", _shooter, _unit];
    
    // Check if the shooter is a friendly unit
    if (side _shooter == side _unit) then {
        true
    } else {
        false
    };
};

//not tested. was an attempt to end the mission if FF was detected
[] spawn {
    sleep 2; // Adjust sleep time if needed

    {
        _unit = _x;
        diag_log format ["Applying event handler to unit %1", _unit]; // Log unit processing
        
        if (isMultiplayer and isServer) then {
            _unit addEventHandler ["Hit", {
                params ["_unit", "_damage", "_source", "_projectile", "_hitPart"];
                
                // Log hit details
                diag_log format ["Unit %1 hit by %2, damage %3", _unit, _source, _damage];
                
                // Check if the shooter is friendly
                if ([_unit, _source] call _isFriendly) then {
                    // End the mission if friendly fire is detected
                    diag_log "Friendly fire detected, ending mission"; // Log mission end
                    ["Friendly fire detected! Mission failed."] call BIS_fnc_endMission;
                };
            }];
        };
    } forEach allUnits select {side _x == west}; // Change `west` to the side of your friendly AI units
};
*/
/*
player addEventHandler ["HandleRating", {
	params ["_unit", "_rating"];
	if (_rating < 0) then {
	[Marcinko, "STOP!"] remoteExec ["sidechat"];

	} 
}];

//Friendly Kills EH Working in SP only right now
addMissionEventHandler ["EntityKilled", {
	// Get the passed parameters of interest
	params ["_killed", "_killer", "_instigator"];

	// Check if instigator is player and the killed unit was on the same side with the instigator/player
	if ((_instigator isEqualTo player) && (playerSide isEqualTo (side group _killed)) && _killer inArea "NoFireZone") then {
		// Get the amount of friendly kills of the player
		private _Kills = player getVariable ["FriendlyFire", 0];

		_Kills = _Kills + 1; // Increment (friendly) kills

		// Check amount of kills
		if (_Kills >= 3) then {
            [] spawn {
            [Marcinko, "Cease Fire! Cease Fire!"] remoteExec ["sidechat"];
            sleep 3;
            ["DefeatFriendlyFire", false, true, true, true] remoteExecCall ["VN_fnc_endMission"];
            }    
        } else {
        [Marcinko, "Check your Fire! Friendly Fire!"] remoteExec ["sidechat"];    
        };

		// Set the variable with the new number of kills (this is in case you didn't finish the game of course)
		player setVariable ["FriendlyFire", _Kills];
	};
}];

/*
 [Marcinko, "Rogue Sailor! Put him down!"] remoteExec ["sidechat"];
                        [Marcinko, "Rogue Sailor! Put him down!"] remoteExec ["sidechat"];
            [Marcinko, "Holy shit! Cease Fire! Cease Fire! What happened?"] remoteExec ["sidechat"];
*/

// Creates custom radio channel to be used as subtitles.
[] spawn {
    if !(isServer) exitWith {};

    Fox_UpdatePlayerChannels = true;

    private _NPCtoAdd = [
        missionNamespace getVariable ["marcinko", objNull],
        missionNamespace getVariable ["scout", objNull]
    ];

    private _radioChannel = radioChannelCreate [[1, 1, 1, 1], "Dialogue", "%UNIT_NAME", _NPCtoAdd, false];
    if (_radioChannel == -1) exitWith {
        diag_log format["Something went wrong creating radio channel..."];
    };

    missionNamespace setVariable ["FOX_DialogueChannel", _radioChannel];

    private _managerTime = 0;
    while {sleep 1; _managerTime = _managerTime + 1; Fox_UpdatePlayerChannels} do {

        private _channelInfo = radioChannelInfo _radioChannel;
        _channelInfo params ["_color", "_label", "_callsign", "_units", "_sentenceType"];

        // Remove dead units from channel info array
        _units apply {
            if !(alive _x) then {
                _radioChannel radioChannelRemove [_x];
            };
        };

        // Add players if not in channel (if not added back in after death, messages won't work)
        private _players = allUnits select {isPlayer _x};
        _players apply {
            private _player = _x;
            if !(_player in _units) then {
                diag_log format["Player [%1] not found in chat channel [%2]... adding.", _player, _label];

                _radioChannel radioChannelAdd [_player];
            };
        };

                // Update log every 5 seconds
        if (_managerTime % 5 == 0) then {

            private _channelInfo = radioChannelInfo _radioChannel;
            _channelInfo params ["_color", "_label", "_callsign", "_units", "_sentenceType"];

            diag_log format["-----Channel Update-----"];
            diag_log format["Units in chat channel: [%1]", _label];
            diag_log format["Count: %1", count _units];
            diag_log format["Units: %1", _units apply {name _x}];
            diag_log format["------------------------"];
        };
    };
};