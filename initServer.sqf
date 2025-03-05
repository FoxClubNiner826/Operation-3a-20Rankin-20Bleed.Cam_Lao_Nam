
missionNamespace setVariable ["ActionTalkToMarcinko1", true, true];
missionNamespace setVariable ["ActionTalkToMarcinko2", true, true];
missionNamespace setVariable ["ActionTalkToMarcinko3", true, true];
missionNamespace setVariable ["ActionTalkToMarcinko4", true, true];
missionNamespace setVariable ["ActionTalkToMarcinko5", true, true];
missionNamespace setVariable ["ActionTalkToMarcinko6", true, true];
missionNamespace setVariable ["ActionTalkToMarcinko7", true, true];
missionNamespace setVariable ["ActionTalkToCarson", false, true];
missionNamespace setVariable ["ActionCallPOW", false, true];
missionNamespace setVariable ["speakersloop", true, true];
missionNamespace setVariable ["ActionTalkToPilot1", true, true];
missionNamespace setVariable ["ActionTalkToPilot2", true, true];
missionNamespace setVariable ["ActionTalkToPilot3", true, true];
missionNamespace setVariable ["ActionTalkToPilot4", true, true];
missionNamespace setVariable ["ActionTalkToPilot", false, true];
missionNamespace setVariable ["ActionTalkToPOW1", true, true];
missionNamespace setVariable ["ActionTalkToPOW2", true, true];
missionNamespace setVariable ["ActionTalkToPOW3", true, true];
missionNamespace setVariable ["ActionTalkToPOW4", true, true];
missionNamespace setVariable ["ActionTalkToPOW5", true, true];

ExtractAction = false;
RTBAction = false;

ActionEndMission = false; //might not be needed anymore
missionNamespace setVariable ["ActionDebrief", false, true];

// Counter for attempts and successful hints
missionNamespace setVariable ["holdActionAttemptCount", 0];

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
        missionNamespace getVariable ["MP1", objNull],
        missionNamespace getVariable ["MP2", objNull],
        missionNamespace getVariable ["MP3", objNull],
        missionNamespace getVariable ["marcinko", objNull],
        missionNamespace getVariable ["command", objNull],
        missionNamespace getVariable ["scout", objNull],
        missionNamespace getVariable ["HanoiHannah", objNull],
        missionNamespace getVariable ["pilot", objNull],
        missionNamespace getVariable ["pow", objNull],
        missionNamespace getVariable ["ranger", objNull]
    ];

    private _radioChannel = radioChannelCreate [[1, 1, 1, 1], "Dialogue", "%UNIT_NAME", _NPCtoAdd, false];
    if (_radioChannel == -1) exitWith {
        diag_log format["Something went wrong creating radio channel..."];
    };

    missionNamespace setVariable ["FOX_DialogueChannel", _radioChannel, true];

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

// 3 groups players must sneak past
_patrolGroup = [patrol1, patrol2, patrol3];

{
	_x addEventHandler ["KnowsAboutChanged", {
		params ["_group", "_targetUnit", "_newKnowsAbout"];

		        // Check if the AI patrols know about a player
		if ((_targetUnit in (units playergroup)) && {
			_newKnowsAbout > 1.5
		}) then {
			// Removes EH from the specifc group
			_group removeEventHandler [_thisEvent, _thisEventHandler];

			// Give players a few seconds to kill patrol or else
			[_group]spawn {
				params["_group"];
				sleep 15 + (random 5);
				if ({
					alive _x
				} count units _group > 0) then {
                    //create flare and sound
                    [(leader _group), ["flarelaunch", 400]] remoteExec ["say3D"];
					private _pos = getPosATL leader _group;
					_pos = _pos vectorAdd [0, 0, 150];
                    private _flare = createVehicle ["F_40mm_Red", _pos, [], 0, "FLY"];
					_flare setVelocity [random 2, random 2, 0];
                    sleep 3;
                    [_flare, ["flarepop", 400]] remoteExec ["say3D"];
                    sleep 1;
                    [_flare, ["flarewhistle", 400]] remoteExec ["say3D"];
                    sleep 5;

                    if (!(missionNamespace getVariable ["aopassedVar", false])) then {
                        [selectRandom ["playersspotted1", "playersspotted2", "playersspotted3"], [leader player]] remoteExec ["FoxClub_fnc_Conversation"];
                    };
                    
                    missionNamespace setVariable ["PlayersSpotted", true, true];
                    //missionNamespace setVariable ["fox_var_radioLoop", true, true]; //turns on speakers
                    //missionNamespace setVariable ["fox_var_radioLoop", false, true]; //turns off speakers
				};
			};
		};
	}];
} forEach _patrolGroup;

//speakers loop
[]spawn {
while {true} do {
            waitUntil {
            sleep 60;
            missionNamespace getVariable ["fox_var_radioLoop",false];
        };
            while {missionNamespace getVariable ["fox_var_radioLoop",false]} do {
                if (alive speakers) then {
                    [selectRandom ["speakers1", "speakers2", "speakers3"], [HanoiHannah]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance speakers <= 200}];
                    sleep 60;
                };
        };
    };
};

// POW loop
[]spawn {
while {true} do {
            waitUntil {
            sleep 60;
            missionNamespace getVariable ["fox_var_powloop",false];
        };
            while {missionNamespace getVariable ["fox_var_powloop",false]} do {
                if (alive POW) then {
                    ["pow1", [POW]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance POW <= 100}];
                    sleep 90;
                    ["pow2", [POW]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance POW <= 100}];
                    sleep 90;
                    ["pow3", [POW]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance POW <= 100}];
                    missionNamespace setVariable ["fox_var_powloop", false, true]; 
                };
        };
    };
};

/* Array of possible messages
private _messages = [
	"Our cover's blown. move to the target AO, now!",
	"Shit! Haul ass to the target AO!",
	"Keep moving! Don't stop till we get to the target AO!"
];

// select a random message
private _randomMessage = selectRandom _messages;

// select a random unit from playable or switchable units
//private _unit = selectRandom (playableUnits + switchableUnits);

// Broadcast the message via remoteExec
[leader player, _randomMessage] remoteExec ["sideChat", 0];

"answer" remoteExec ["playSound", 0];

[selectRandom ["speakers1", "speakers2", "speakers3"], [leader player]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance speakers <= 100}];

[]spawn {
while {speakersloop} do { 

[selectRandom ["speakers1", "speakers2", "speakers3"], [HanoiHannah]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance speakers <= 100}];

sleep 5;

    };
};

