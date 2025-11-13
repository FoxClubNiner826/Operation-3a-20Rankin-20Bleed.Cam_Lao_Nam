/*
    File: initServer.sqf
    Author: FoxClubNiner
    Description:
        Runs at mission start.
*/

////////////////////////////////////////////////////
//                                                //
//            STARTING VARIABLE VALUES            //
//                                                //
////////////////////////////////////////////////////

missionNamespace setVariable ["ActionTalkToMarcinko1", true, true];
missionNamespace setVariable ["ActionTalkToMarcinko2", true, true];
missionNamespace setVariable ["ActionTalkToMarcinko3", true, true];
missionNamespace setVariable ["ActionTalkToMarcinko4", true, true];
missionNamespace setVariable ["ActionTalkToMarcinko5", true, true];
missionNamespace setVariable ["ActionTalkToMarcinko6", true, true];
missionNamespace setVariable ["ActionTalkToMarcinko7", true, true];
missionNamespace setVariable ["ActionTalkToMarcinko9", true, true]; // Scout can ask one question to Captain.
missionNamespace setVariable ["ActionTalkToCarson", false, true];
missionNamespace setVariable ["ActionCallPOW", false, true];
missionNamespace setVariable ["speakersloop", true, true];
missionNamespace setVariable ["ActionTalkToPilot2", true, true];
missionNamespace setVariable ["ActionTalkToPilot3", true, true];
missionNamespace setVariable ["ActionTalkToPilot4", true, true];
missionNamespace setVariable ["ActionTalkToPilot", false, true];
missionNamespace setVariable ["ActionTalkToPOW1", true, true];
missionNamespace setVariable ["ActionTalkToPOW2", true, true];
missionNamespace setVariable ["ActionTalkToPOW3", true, true];
missionNamespace setVariable ["ActionTalkToPOW4", true, true];
missionNamespace setVariable ["ActionTalkToPOW5", true, true];
missionNamespace setVariable ["ActionDebrief", false, true]; // Allows mission debrief
missionNamespace setVariable ["holdActionAttemptCount", 0]; // Counter for attempts for searchable items in Lumphat.
missionNamespace setVariable ["actionReturnToBase", true, true]; // Allows RTB holdAction at mission start.
missionNamespace setVariable ["actionBriefing", true, true]; // turns on captain intro questions

ActionEndMission = false; //might not be needed anymore


////////////////////////////////////////////////////
//                                                //
//            DOWNED PILOT MAP MARKERS            //
//                                                //
////////////////////////////////////////////////////
//Updates rescue pilot markers on the map. runs on server for performance.

[] spawn {
    private _offset = [(sin(random 360) * random 100), (cos(random 360) * random 100), 0];
    while {true} do {
        "PilotArea" setMarkerPos (getPosATL pilot vectorAdd _offset);
        "RescuePilotText" setMarkerPos (markerPos "PilotArea");
        sleep 1;
    };
};


//////////////////////////////////////////////////
//                                              //
//               MISSION SETTINGS               //
//                                              //
//////////////////////////////////////////////////

//random clouds on mission start
//_RandomClouds = (random 1); //too dark probably for players to nav
_RandomClouds = (random [0.2, .35, 0.43]);
0 setOvercast _RandomClouds;
forceWeatherChange;


////////////////////////////////////////////////////
//                                                //
//       CUSTOM RADIO CHANNEL FOR SUBTITLES       //
//               Author: Hypoxic                  //
////////////////////////////////////////////////////

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
        missionNamespace getVariable ["ranger", objNull],
        missionNamespace getVariable ["demo", objNull],
        missionNamespace getVariable ["gren2", objNull],
        missionNamespace getVariable ["mg1", objNull],
        missionNamespace getVariable ["mg2", objNull],
        missionNamespace getVariable ["medic", objNull],
        missionNamespace getVariable ["rto", objNull],
        missionNamespace getVariable ["testUnit", objNull]
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


////////////////////////////////////////////////////
//                                                //
// PATROLS THAT SHOOT FLARES WHEN PLAYER SPOTTED  //
//                                                //
////////////////////////////////////////////////////

// 4 groups players must sneak past
_patrolGroup = [patrol1, patrol2, patrol3, patrol4, patrol5, patrol6];

{
	_x addEventHandler ["EnemyDetected", {
		params ["_group", "_newTarget"];

		// Check if the AI patrols know about a player
		if (_newTarget in (units playergroup)) then {
            
            // print who was detect by the patrol
            [format ["An enemy patrol has detected: %1", name _newTarget]] remoteExec ["systemChat", 0];

            //since all groups popped the message at once we will now remove all EH once one group sees the players.
            {
                _x removeEventHandler [_thisEvent, _thisEventHandler];
            } forEach [patrol1, patrol2, patrol3, patrol4, patrol5, patrol6];

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
                    sleep 3;

                    // if its the first time players are spotted by a patrol outside of lumphat and no other players have reached lumphat and the general hasnt fled then play this otherwise do nothing
                    if (!(missionNamespace getVariable ["PlayersSpotted", false]) && 
                        !(missionNamespace getVariable ["aopassedVar", false]) && 
                        !(missionNamespace getVariable ["hvtFled", false])) then {
                            // if players are spotted  by patrol 1-3
                            _scout = missionNamespace getVariable ["scout", objNull];   
                            _leader = leader playergroup;   
                            // convo if the leader isn't the scout
                            if (alive _leader && _leader != _scout && _leader in units playergroup) exitWith {     
                                ["playersspotted", [_leader]] remoteExec [    
                                    "FoxClub_fnc_Conversation",    
                                    allPlayers select { _x distance _leader <= 100 }    
                                ];
                                sleep 3;
                                if (_leader distance _scout <= 100) then {
                                ["playersspottedScout2", [_scout]] remoteExec [    
                                    "FoxClub_fnc_Conversation",    
                                    allPlayers select { _x distance _scout <= 100 }    
                                ];    
                                };  
                            };
                            // convo if the leader is the scout   
                            if (alive _scout && _leader == _scout && _scout in units playergroup) exitWith {     
                                ["playersspottedScout", [_scout]] remoteExec [    
                                    "FoxClub_fnc_Conversation",    
                                    allPlayers select { _x distance _scout <= 100 }    
                                ];
                                sleep 3;
                                if (_leader distance _scout <= 100) then {
                                ["playersspotted2", [_leader]] remoteExec [    
                                    "FoxClub_fnc_Conversation",    
                                    allPlayers select { _x distance _leader <= 100 }    
                                ];    
                                };   
                            };
                    };
                    // if players got to lumphat in stealth then get spotted by a patrol and the general hasn't fled then play this
                    if (missionNamespace getVariable ["aopassedVar", false] && 
                       !(missionNamespace getVariable ["hvtFled", false]) && 
                       (_group == patrol4)) then {
                            _leader = leader playergroup;
                            _scout = missionNamespace getVariable ["scout", objNull];   
                            if (alive _leader && _leader != _scout && _leader in units playergroup) exitWith {     
                                if (alive officer) then {
                                    ["generalAlive", [_leader]] remoteExec [    
                                        "FoxClub_fnc_Conversation",    
                                        allPlayers select { _x distance _scout <= 100 }    
                                    ];
                                } else {
                                    ["generalDead", [_leader]] remoteExec [    
                                        "FoxClub_fnc_Conversation",    
                                        allPlayers select { _x distance _scout <= 100 }    
                                    ];
                                };   
                            };    
                            if (alive _scout && _leader == _scout && _scout in units playergroup) exitWith {     
                                if (alive officer) then {
                                    ["generalAliveScout", [_scout]] remoteExec [    
                                        "FoxClub_fnc_Conversation",    
                                        allPlayers select { _x distance _scout <= 100 }    
                                    ];
                                } else {
                                    ["generalDeadScout", [_scout]] remoteExec [    
                                        "FoxClub_fnc_Conversation",    
                                        allPlayers select { _x distance _scout <= 100 }    
                                    ];
                                };   
                            };
                        };
                    
                    // sends troop transport to road if group 1-4 spotted player and their comms arent disabled. Also turns on speakers.
                    if (!(missionNamespace getVariable ["comsdestroyed", false])) then {
                        missionNamespace setVariable ["PlayersSpotted", true, true]; //sends troop transport to road and general flees
                        sleep 15; //wait to turn on speaker
                        missionNamespace setVariable ["fox_var_radioLoop", true, true]; //turns on speakers
                        //missionNamespace setVariable ["fox_var_radioLoop", false, true]; //turns off speakers
                    };
				};
			};
		};
	}];
} forEach _patrolGroup;


////////////////////////////////////////////////////
//                                                //
//            LOUDSPEAKERS SPEECH LOOP            //
//                                                //
////////////////////////////////////////////////////

[]spawn {
while {true} do {
            waitUntil {
            sleep 60;
            missionNamespace getVariable ["fox_var_radioLoop",false];
        };
            while {missionNamespace getVariable ["fox_var_radioLoop",false]} do {
                if (alive speakers) then {
                    [selectRandom ["speakers1", "speakers2", "speakers3"], [HanoiHannah], true] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance speakers <= 200}];
                    sleep 60;
                };
        };
    };
};


////////////////////////////////////////////////////
//                                                //
//                POW SPEACH LOOP                 //
//                                                //
////////////////////////////////////////////////////

[]spawn {
while {true} do {
            waitUntil {
            sleep 60;
            missionNamespace getVariable ["fox_var_powloop",false];
        };
            while {missionNamespace getVariable ["fox_var_powloop",false]} do {
                if (alive POW) then {
                    ["pow1", [POW], true] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance POW <= 100}];
                    sleep 90;
                    ["pow2", [POW], true] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance POW <= 100}];
                    sleep 90;
                    ["pow3", [POW], true] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance POW <= 100}];
                    missionNamespace setVariable ["fox_var_powloop", false, true]; 
                };
        };
    };
};


if (isMultiplayer) then {
////////////////////////////////////////////////////
//                                                //
//  MAKES HUMAN LEADER IF LEADER IS CHAGED TO AI  //
//                                                //
////////////////////////////////////////////////////

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
                    diag_log format ["[LeaderChange] %1 (%2) was given command of %3. Leadership has been reassigned to %4 (%5) (index %6).",
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


////////////////////////////////////////////////////
//                                                //
//  MAKES HUMAN LEADER IF LEADER DISCONNECTS      //
//                                                //
////////////////////////////////////////////////////

addMissionEventHandler ["PlayerDisconnected", {
	params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];

[] spawn {
    sleep 1;
    if (!isPlayer (leader playerGroup)) then {
private _group = playergroup;
        private _aiName = name leader playerGroup;
        private _aiRole = getText (configFile >> "CfgVehicles" >> typeOf leader playerGroup >> "displayName");

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
                [format["%1 (%2) was the leader and has disconnected. Leadership has been reassigned to %4 (%5) (index %6).",
                    _aiName,
                    _aiRole,
                    groupId _group,
                    _humanName,
                    _humanRole,
                    _orderedUnits find _firstHuman
                ]] remoteExec ["systemChat", 0];

                // Log to RPT
                diag_log format ["[LeaderChange] %1 (%2) was the leader and has disconnected. Leadership has been reassigned to %4 (%5) (index %6).",
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
};
}];


////////////////////////////////////////////////////
//                                                //
//  MAKES HUMAN LEADER IF AI IS LEADER AT START   //
//                                                //
////////////////////////////////////////////////////

[] spawn {
    sleep 1;
    if (!isPlayer (leader playerGroup)) then {
private _group = playergroup;
        private _aiName = name leader playerGroup;
        private _aiRole = getText (configFile >> "CfgVehicles" >> typeOf leader playerGroup >> "displayName");

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
                [format["%1 (%2) (AI) was the leader. Leadership has been reassigned to %4 (%5) (index %6).",
                    _aiName,
                    _aiRole,
                    groupId _group,
                    _humanName,
                    _humanRole,
                    _orderedUnits find _firstHuman
                ]] remoteExec ["systemChat", 0];

                // Log to RPT
                diag_log format ["[LeaderChange] %1 (%2) (AI) was the leader. Leadership has been reassigned to %4 (%5) (index %6).",
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
};
};



