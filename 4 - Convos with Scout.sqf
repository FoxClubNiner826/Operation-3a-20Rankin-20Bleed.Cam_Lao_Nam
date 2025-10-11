// After players leave the docks. The leader sets the tone. Then the scout agrees. Vice versa if the leader is the scout.
// In a perfect world I wold have chosen a random unit for response. But that means I would have to add another voice actor plus it would add 
// feature creap and who knows whatever other issues. Keep it simple for now. In the future maybe you make a 4 player one where there are 4 distinct characters.
_scout = missionNamespace getVariable ["scout", objNull];
_leader = leader playergroup;

if (alive _leader && _leader != _scout && _leader in units playergroup && vehicle _leader == ptboat) exitWith {  
    [selectRandom ["looksharp1", "looksharp2", "looksharp3"], [_leader, _scout]] remoteExec [
        "FoxClub_fnc_Conversation",
    allPlayers select { _x distance _leader <= 100 }
    ];
}; 
if (alive _scout && _leader == _scout && _scout in units playergroup && vehicle _scout == ptboat) exitWith {  
    ["looksharpScout", [_scout, _leader]] remoteExec [ 
        "FoxClub_fnc_Conversation", 
        allPlayers select { _x distance _scout <= 100 } 
    ]; 
}; 

// If the players go the wrong way on the way to the cove. I want the scout to be the navigation expert to simulate his familiarity with the area.
// If the scout isn't available then the leader of the group will comment.
_scout = missionNamespace getVariable ["scout", objNull];
_leader = leader playergroup;

if (alive _scout && _scout in units playergroup && vehicle _scout == ptboat) exitWith {  
    ["wrongWayCoveScout", [_scout]] remoteExec [ 
        "FoxClub_fnc_Conversation", 
        allPlayers select { _x distance _scout <= 100 } 
    ]; 
}; 
if (alive _leader && vehicle _leader == ptboat) exitWith {  
    ["wrongWayCove", [_leader]] remoteExec [ 
        "FoxClub_fnc_Conversation", 
        allPlayers select { _x distance _leader <= 100 } 
    ]; 
};

//After players get to the cove the next task will pop up. I want the leader of the group to comment. Vice versa if the leader is the scout.
// As players enter the cove. Nicely done boys. Grab some lights outta the STAB and set up a recon position. I know spot. We watch there.
_scout = missionNamespace getVariable ["scout", objNull]; 
_leader = leader playergroup; 
 
if (alive _leader && _leader != _scout && _leader in units playergroup) exitWith {   
    ["arrivedAtCove", [_leader, _scout]] remoteExec [  
        "FoxClub_fnc_Conversation",  
        allPlayers select { _x distance _leader <= 100 }  
    ]; 
};  
if (alive _scout && _leader == _scout && _scout in units playergroup) exitWith {   
    ["arrivedAtCoveScout", [_scout, _leader]] remoteExec [  
        "FoxClub_fnc_Conversation",  
        allPlayers select { _x distance _scout <= 100 }  
    ];  
};

// Redid the call HQ hold action to include scout 

// After the radio call the leader says to keep quiet. Vice versa for scout.
_scout = missionNamespace getVariable ["scout", objNull];  
_leader = leader playergroup;  
  
if (alive _leader && _leader != _scout && _leader in units playergroup) exitWith {    
    ["patrolbegins", [_leader, _scout]] remoteExec [   
        "FoxClub_fnc_Conversation",   
        allPlayers select { _x distance _leader <= 100 }   
    ];  
};   
if (alive _scout && _leader == _scout && _scout in units playergroup) exitWith {    
    ["patrolbeginsScout", [_scout, _leader]] remoteExec [   
        "FoxClub_fnc_Conversation",   
        allPlayers select { _x distance _scout <= 100 }   
    ];   
};

// When the patrol boat leaves the ao. I want the leader of the group to comment. Vice versa if the leader is the scout.
_scout = missionNamespace getVariable ["scout", objNull];   
_leader = leader playergroup;   
   
if (alive _leader && _leader != _scout && _leader in units playergroup) exitWith {     
    ["patrolleaves", [_leader, _scout]] remoteExec [    
        "FoxClub_fnc_Conversation",    
        allPlayers select { _x distance _leader <= 100 }    
    ];   
};    
if (alive _scout && _leader == _scout && _scout in units playergroup) exitWith {     
    ["patrolleavesScout", [_scout, _leader]] remoteExec [    
        "FoxClub_fnc_Conversation",    
        allPlayers select { _x distance _scout <= 100 }    
    ];    
};

// if the playes are spotted. I want the leader of the group to comment. Vice versa if the leader is the scout.
_scout = missionNamespace getVariable ["scout", objNull];   
_leader = leader playergroup;   
   
if (alive _leader && _leader != _scout && _leader in units playergroup) exitWith {     
    ["patrolspotted", [_leader, _scout]] remoteExec [    
        "FoxClub_fnc_Conversation",    
        allPlayers select { _x distance _leader <= 100 }    
    ];   
};    
if (alive _scout && _leader == _scout && _scout in units playergroup) exitWith {     
    ["patrolspottedScout", [_scout, _leader]] remoteExec [    
        "FoxClub_fnc_Conversation",    
        allPlayers select { _x distance _scout <= 100 }    
    ];    
};

// // if the patrol boat is destrpyed. I want the leader of the group to comment. Vice versa if the leader is the scout.
_scout = missionNamespace getVariable ["scout", objNull];   
_leader = leader playergroup;   
   
if (alive _leader && _leader != _scout && _leader in units playergroup) exitWith {     
    ["patroldead", [_leader, _scout]] remoteExec [    
        "FoxClub_fnc_Conversation",    
        allPlayers select { _x distance _leader <= 100 }    
    ];   
};    
if (alive _scout && _leader == _scout && _scout in units playergroup) exitWith {     
    ["patroldeadScout", [_scout, _leader]] remoteExec [    
        "FoxClub_fnc_Conversation",    
        allPlayers select { _x distance _scout <= 100 }    
    ];    
};

// when players complete upriver task. I want the leader of the group to comment. Vice versa if the leader is the scout.
_scout = missionNamespace getVariable ["scout", objNull];   
_leader = leader playergroup;   
   
if (alive _leader && _leader != _scout && _leader in units playergroup) exitWith {     
    ["upriver", [_leader, _scout]] remoteExec [    
        "FoxClub_fnc_Conversation",    
        allPlayers select { _x distance _leader <= 100 }    
    ];   
};    
if (alive _scout && _leader == _scout && _scout in units playergroup) exitWith {     
    ["upriverScout", [_scout, _leader]] remoteExec [    
        "FoxClub_fnc_Conversation",    
        allPlayers select { _x distance _scout <= 100 }    
    ];    
};

// when players dawn and remove scuba
// done

// at infil spot. doesn't matter if the scout in the leader this time because the subtitles are just squelches
_leader = leader playergroup;
["infill", [_leader, HQRadio]] remoteExec [    
    "FoxClub_fnc_Conversation",    
    allPlayers select { _x distance _leader <= 100 }    
];

//placing c4 charge based on the caller of the action. On start: convo. beep boop. On finish: clunk. Move out.
private _conditionC4 = {
    (missionNamespace getVariable ['ActionSTABTimeBombs', false]) && (vehicle _this != _target)
};

[
	ptboat,
	"<t color='#FFFF00'>Place C-4 Plastic Explosive: 15 Minutes</t>",
	"a3\ui_f_oldman\data\igui\cfg\holdactions\destroy_ca.paa", //idle icon 
	"a3\ui_f_oldman\data\igui\cfg\holdactions\destroy_ca.paa", //progress icon
	toString _conditionC4,
	"true", //condition progress
	{
        params ["_target", "_caller", "_actionID", "_args"];
        if (_caller == missionNamespace getVariable ["scout", objNull]) then {
			["bomb15Scout", [_caller]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];
		} else {
			["bomb15", [_caller]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];
		};
    }, //code on start
	{}, // code every tick
	{
        params ["_target", "_caller", "_actionID", "_args"];
        if (_caller == missionNamespace getVariable ["scout", objNull]) then {
			["bombplantedScout", [_caller]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];
		} else {
			["bombplanted", [_caller]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];
		};
		missionNamespace setVariable ["ActionSTABTimeBombs", false, true];
        playSound3D [getMissionPath "sound\PlaceBomb.ogg", getPosASL ptboat, false, ptboat, 3];
        ["scripts\bomb.sqf"] remoteExec ["execVM", 2];
	}, // code on finish
	{}, // code on interuption
	[], //arguements
	3, //duration
	8, //order from top
	false, //remove on finish
	false, //show if unconcious
	true //show in middle of screen
] call BIS_fnc_holdActionAdd;


/* if players are spotted  by patrol 1-3. This one is tricky because player could be split up at this point. I need a convo for subs when they are together
and when they are split. because when they are split I need to do a radio or groupChat message. I need to decide if I want to use groupChat or sideChat.
groupChat will be most like vanilla arma. sideChat would make more sense for the time period. Ultimatley teams tried to stay off the radio, so I have 
changed this to not do radio and will do a check for distance.
*/

_scout = missionNamespace getVariable ["scout", objNull];   
_leader = leader playergroup;   
// convo if the leader isn't the scout
if (alive _leader && _leader != _scout && _leader in units playergroup) exitWith {     
    ["playersspotted", [_leader, _scout]] remoteExec [    
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

// if the general flees 
["generalfled", [HQRadio, leader playergroup]] remoteExec ["FoxClub_fnc_Conversation"];

// hold action for disabling comms. Completed in IPL.sqf


/* Convo after pilot gets shot down. Priority speaker is the leader then scout then other human players in the group then AI in the group.
Responder must be within 50m and priority is opposite the speaker, either scout or leader. If not then AI. The reason I am not doing a 
array in the trigger area is because there is a chance that only one person would be in the array. If that happened then there wouldnt 
be a responder. This chooses a responder as long as the unit is less than 50m away. 
*/

// Makes the defaut speaker be not the leader or scout.
_scout   = missionNamespace getVariable ["scout", objNull];
private _leader  = leader playergroup;
private _anchor  = samsiteConvo;  // distance checker for first speaker
private _units   = units playergroup select { alive _x && _x distance _anchor <= 100 };
private _speaker = selectRandom _units;
private _responder = objNull;
private _convo;

// Makes the speaker be leader or scout if they are in the area.
if (_leader in _units) then {
	_speaker = _leader;
} else {
	if (_scout in _units) then {
		_speaker = _scout;
	};
};

// Chooses the convo based on who is the speaker. American or not.
_convo = ["pilotdown", "pilotdownScout"] select (_speaker == _scout);

// Chooses a responder.
private _eligible = (units playergroup) select { _x != _speaker && alive _x && _x distance _speaker <= 50 };

if (_speaker == _scout) then {
	if (_leader distance _scout <= 50) then {
		_responder = _leader;
	} else {
		private _humans = _eligible select { isPlayer _x };
		private _ai	 = _eligible select { !isPlayer _x };
		
		if (count _humans > 0) then { _responder = selectRandom _humans; }
		else { if (count _ai > 0) then { _responder = selectRandom _ai; }; };
	};
} else {
	if (_scout distance _speaker <= 50) then { _responder = _scout; };
};

// Plays function.
[_convo, [_speaker, _responder]] remoteExec [
	"FoxClub_fnc_Conversation",
	allPlayers select { _x distance _speaker <= 100 }
];


// original version of the above
_scout = missionNamespace getVariable ["scout", objNull];   
_leader = leader playergroup;
private _units = units playergroup inAreaArray pilot_joins_group;
private _speaker = selectRandom _units;
if (_leader in _units) then {
    _speaker = _leader;
} else {
  if (_scout in _units) then {
    _speaker = _scout;
  };
};
private _convo = ["americanLines", "vietnameseLines"] select (_speaker == _scout);
[_convo, [_speaker]] remoteExec [    
    "FoxClub_fnc_Conversation",    
    allPlayers select { _x distance _speaker <= 100 }    
];


/* the interaction with the downed pilot. I want priority of speaker to go to leader then scout then random human. No need for AI to 
say the line cause the trigger is activted by players being present. The reason it is ok to use an array in the trigger area 
is because the trigger area is so small so there is no need to check a distance to make sure the convo looks natural. Also, 
the other unit talking will always be the pilot so I dont need to do any distance checks for different responders like the previous.
*/

thisList spawn { 
 
_firstUnit = _this#0; 
pilot lookAt _firstUnit; 
sleep 1; 
pilot playmove "Acts_PercMstpSlowWrflDnon_handup2";  
deletemarker "PilotArea"; 
deletemarker "RescuePilotText"; 
 
_scout   = missionNamespace getVariable ["scout", objNull];    
_leader  = leader playergroup; 
private _units = units playergroup inAreaArray pilot_joins_group; 
  
private _speaker = objNull; 
 

if (_leader in _units) then { 
    _speaker = _leader; 
} else { 
    if (_scout in _units) then { 
        _speaker = _scout; 
    } else {  
        private _players = _units select { isPlayer _x }; 
        if (count _players > 0) then { 
            _speaker = selectRandom _players; 
        }; 
    }; 
}; 
 
private _convo = ["meet", "meetScout"] select (_speaker == _scout); 
 
[_convo, [pilot, _speaker]] remoteExec [ 
    "FoxClub_fnc_Conversation",     
    allPlayers select { _x distance _speaker <= 100 }     
]; 
 
 
sleep 15; 
[pilot] join _firstUnit; 
[pilot, true] remoteExec ["allowdamage", 0, true]; 
[pilot, "PATH"] remoteExec ["enableai", 0, true]; 
 
};


// when the player or scout asks the pilot questions
private _convo = ["askpilot1", "askpilot1Scout"] select (_caller == _scout); 
_scout = missionNamespace getVariable ["scout", objNull]; 
[_convo, [_caller, pilot]] remoteExec [ 
    "FoxClub_fnc_Conversation",     
    allPlayers select { _x distance _caller <= 100 }     
];


/* when the pilot is back at base. I want the leader to speak to the pilot, if the leader is not in the heli (died at extraction or was left behind)
then the scout will speak. Otherwise a random human then random AI.
*/

_scout   = missionNamespace getVariable ["scout", objNull];   
_leader  = leader playergroup;
private _units = (units playergroup) select { alive _x && vehicle _x == extractHeli && _x != pilot };
private _speaker = objNull;

if (_leader in _units) then {
    _speaker = _leader;
} else {
    if (_scout in _units) then {
        _speaker = _scout;
    } else {
        private _humans = _units select { isPlayer _x };
        if (count _humans > 0) then {
            _speaker = selectRandom _humans;
        } else {
            _speaker = selectRandom _units;
        };
    };
};

private _convo = ["pilotpasstask", "pilotpasstaskScout"] select (_speaker == _scout);

[_convo, [pilot, _speaker]] remoteExec [
    "FoxClub_fnc_Conversation",
    allPlayers select { _x distance _speaker <= 100 }
];


/* when the gunboat is destroyed. I want the killer to say something whether its the scout or not. Im not sure i need the radio broadcast 
because irl they wouldnt do it. the only reason I did it in the first place was so if the group was separated in MP other players would know 
that it happened. but players can just do that themselves. SP is the priority 
*/

this addEventHandler ["Killed", {
 params ["_unit", "_killer", "_instigator", "_useEffects"];
_scout   = missionNamespace getVariable ["scout", objNull];
private _convo = ["gunboatpass", "gunboatpassScout"] select (_killer == _scout);

[_convo, [_killer]] remoteExec [
    "FoxClub_fnc_Conversation", 
    allPlayers select {_x distance _killer <= 100}];

missionNamespace setvariable ["gunboatDestroyed", true, true];

}];


// when the players enter the trigger area of the cache. I want the first unit in the area to speak. whether its the scout or not. no responders needed.
thisList spawn {

_firstUnit = _this#0; 
_scout   = missionNamespace getVariable ["scout", objNull]; 
private _convo = ["seesWeaponCache", "seesWeaponCacheScout"] select (_firstUnit == _scout); 
 
[_convo, [_firstUnit]] remoteExec [ 
    "FoxClub_fnc_Conversation",  
    allPlayers select {_x distance _firstUnit <= 100}];

};


/* As it sits right now, the player cannot bring AI with them into the tunnel. This means having a responder in SP is pointless. In MP there is a small 
chance that two or three players could enter at once though. Therefor, when players enter the rat hole, leader then scout then random player. 
Responders opposite speaker unless random then no responder.
*/

_scout   = missionNamespace getVariable ["scout", objNull];   
_leader  = leader playergroup;
private _units = units playergroup inAreaArray enterTunnel;

private _speaker = objNull;
private _responder = objNull;

// --- Pick Speaker ---
if (_leader in _units) then {
    _speaker = _leader;
} else {
    if (_scout in _units) then {
        _speaker = _scout;
    } else {
        _speaker = selectRandom _units;
    };
};

// --- Pick Responder ---
if (_speaker == _leader && {_scout in _units}) then {
    _responder = _scout;
} else {
    if (_speaker == _scout && {_leader in _units}) then {
        _responder = _leader;
    };
    // No responder if neither Leader nor Scout
};

// --- Convo selection ---
private _convo = ["entertunnel", "scoutentertunnel"] select (_speaker == _scout);

// --- Execute Conversation ---
[_convo, [_speaker, _responder]] remoteExec [
    "FoxClub_fnc_Conversation",    
    allPlayers select { _x distance _speaker <= 100 }    
];

/* as the extraction helicopter is about to take off. I want the leader of the group to say it whether or not it is the scout. no need for a random
because all players must be inside, therefore there must be a leader present. Caller
*/
 
 private _convo = ["goGoGo", "goGoGoScout"] select (_caller == _scout);

[_convo, [_caller]] remoteExec [
    "FoxClub_fnc_Conversation",    
    allPlayers select { _x distance _caller <= 100 }    
];


//////////////////////////////////////////////////
//                                              //
//             EXTRACTION PASSED                //
//                                              //
//////////////////////////////////////////////////

//////////////////////////////////////////////////
//                 CONDITION                    //
//////////////////////////////////////////////////

// All players are alive and not downed and in the helicopter.


this && 
extractHeli in thisList &&
units playerGroup findIf { alive _x && !(_x in extractHeli) } == -1;

//////////////////////////////////////////////////
//                 ACTIVATION                   //
//////////////////////////////////////////////////

/* 
Convo priority: All units in the heli: Leader, scout, random player. The unit will speak to the pilot. Then the pilot will radio HQ.
*/

missionNamespace setVariable ["extractTaskSucceeded", true, true];

_scout   = missionNamespace getVariable ["scout", objNull];   
_leader  = leader playerGroup;

// --- Pick speaker from units aboard ---
private _aboard = units playerGroup select { alive _x && _x in extractheli };
private _speaker = objNull;

if (_leader in _aboard) then {
    _speaker = _leader;
} else {
    if (_scout in _aboard) then {
        _speaker = _scout;
    } else {
        private _players = _aboard select { isPlayer _x };
        _speaker = selectRandom _players;   // guaranteed to exist
    };
};

// --- Start conversation ---
private _convo = ["extractpass", "extractpassScout"] select (_speaker == _scout);
[_convo, [_speaker, ranger, HQRadio]] remoteExec [
    "FoxClub_fnc_Conversation",
    allPlayers select { _x distance _speaker <= 100 }
];  



//////////////////////////////////////////////////
//                                              //
//             EXTRACTION FAILED                //
//                                              //
//////////////////////////////////////////////////

//////////////////////////////////////////////////
//                 CONDITION                    //
//////////////////////////////////////////////////

/*
The trigger is active with any player present,
The extraction helicopter is inside the trigger,
AND there is at least one alive required unit (player, POW, or pilot) outside the helicopter.

So basically: "The heli has left the extraction zone, but not everyone who’s supposed to get on board has actually boarded."
This includes downed players. If a player is downed and outside the heli the trigger fires and the tasks fails because the 
players didn't bring everyone with them.
*/

this &&
extractheli in thislist &&
(units playerGroup) findIf { alive _x && !(_x in extractheli) } != -1

//////////////////////////////////////////////////
//                 ACTIVATION                   //
//////////////////////////////////////////////////

/* Convo priority: All units in the heli: Leader, scout, random player. Then a systemChat to tell who is outside the heli. The unit will speak to himself
then tell the pilot to radio HQ and tell them the bad news since the pilot radio works better.
*/

_scout   = missionNamespace getVariable ["scout", objNull];   
_leader  = leader playerGroup;

// --- Pick speaker from units aboard ---
private _aboard = units playerGroup select { alive _x && _x in extractheli };
private _speaker = objNull;

if (_leader in _aboard) then {
    _speaker = _leader;
} else {
    if (_scout in _aboard) then {
        _speaker = _scout;
    } else {
        private _players = _aboard select { isPlayer _x };
        _speaker = selectRandom _players;   // guaranteed to exist
    };
};

// --- Start conversation ---
private _convo = ["menLeftBehind", "menLeftBehindScout"] select (_speaker == _scout);
[_convo, [_speaker, ranger, HQRadio]] remoteExec [
    "FoxClub_fnc_Conversation",
    allPlayers select { _x distance _speaker <= 100 }
];

// --- Notify players who is left behind ---
private _leftBehind = units playerGroup select { alive _x && !(_x in extractheli) };
if (!(_leftBehind isEqualTo [])) then {
    private _names = _leftBehind apply { name _x };
    private _msg = format ["Men were left behind in the AO: %1", _names joinString ", "];
    [_msg] remoteExec ["systemChat", 0]; 
};


//////////////////////////////////////////////////
//                                              //
//             POW IN HELI CONVO                //
//                                              //
//////////////////////////////////////////////////

//////////////////////////////////////////////////
//                 CONDITION                    //
//////////////////////////////////////////////////

this && 
extractheli in thislist &&
pow in extractheli

//////////////////////////////////////////////////
//                 ACTIVATION                   //
//////////////////////////////////////////////////

_scout   = missionNamespace getVariable ["scout", objNull];   
_leader  = leader playerGroup;

// --- Pick speaker from units aboard ---
private _aboard = units playerGroup select { alive _x && _x in extractheli };
private _speaker = objNull;

if (_leader in _aboard) then {
    _speaker = _leader;
} else {
    if (_scout in _aboard) then {
        _speaker = _scout;
    } else {
        private _players = _aboard select { isPlayer _x };
        _speaker = selectRandom _players;   // guaranteed to exist
    };
};

// --- Start conversation ---
private _convo = ["powpassconvo", "powpassconvoScout"] select (_speaker == _scout);
[_convo, [_speaker, ranger, HQRadio, pow]] remoteExec [
    "FoxClub_fnc_Conversation",
    allPlayers select { _x distance _speaker <= 100 }
];


//////////////////////////////////////////////////
//                                              //
//             PILOT IN HELI CONVO              //
//                                              //
//////////////////////////////////////////////////

//////////////////////////////////////////////////
//                 CONDITION                    //
//////////////////////////////////////////////////

this && 
extractheli in thislist &&
pilot in extractheli

//////////////////////////////////////////////////
//                 ACTIVATION                   //
//////////////////////////////////////////////////

_scout   = missionNamespace getVariable ["scout", objNull];   
_leader  = leader playerGroup;

// --- Pick speaker from units aboard ---
private _aboard = units playerGroup select { alive _x && _x in extractheli };
private _speaker = objNull;

if (_leader in _aboard) then {
    _speaker = _leader;
} else {
    if (_scout in _aboard) then {
        _speaker = _scout;
    } else {
        private _players = _aboard select { isPlayer _x };
        _speaker = selectRandom _players;   // guaranteed to exist
    };
};

// --- Start conversation ---
private _convo = ["pilotpassconvo", "pilotpassconvoScout"] select (_speaker == _scout);
[_convo, [_speaker, ranger, HQRadio, pilot]] remoteExec [
    "FoxClub_fnc_Conversation",
    allPlayers select { _x distance _speaker <= 100 }
];


//////////////////////////////////////////////////
//                                              //
//         PILOT OR POW IN HELI CONVO           //
//                                              //
//////////////////////////////////////////////////

//////////////////////////////////////////////////
//                 CONDITION                    //
//////////////////////////////////////////////////

this && 
extractheli in thislist &&
(pilot in extractheli || pow in extractheli)

//////////////////////////////////////////////////
//                 ACTIVATION                   //
//////////////////////////////////////////////////

// handle outcomes
switch (true) do {
    case (pow in extractheli && pilot in extractheli): {
        // Both in heli
        _scout   = missionNamespace getVariable ["scout", objNull];   
        _leader  = leader playerGroup;

        // --- Pick speaker from units aboard ---
        private _aboard = units playerGroup select { alive _x && _x in extractheli };
        private _speaker = objNull;

        if (_leader in _aboard) then {
            _speaker = _leader;
        } else {
            if (_scout in _aboard) then {
                _speaker = _scout;
            } else {
                private _players = _aboard select { isPlayer _x };
                _speaker = selectRandom _players;   // guaranteed to exist
            };
        };

        // --- Start conversation ---
        private _convo = ["powAndPilot", "powAndPilotScout"] select (_speaker == _scout);
        [_convo, [_speaker, ranger, HQRadio, pow, pilot]] remoteExec [
            "FoxClub_fnc_Conversation",
            allPlayers select { _x distance _speaker <= 100 }
        ];
    };
    case (pow in extractheli && !(pilot in extractheli)): {
        // Only POW in heli
        _scout   = missionNamespace getVariable ["scout", objNull];   
        _leader  = leader playerGroup;

        // --- Pick speaker from units aboard ---
        private _aboard = units playerGroup select { alive _x && _x in extractheli };
        private _speaker = objNull;

        if (_leader in _aboard) then {
            _speaker = _leader;
        } else {
            if (_scout in _aboard) then {
                _speaker = _scout;
            } else {
                private _players = _aboard select { isPlayer _x };
                _speaker = selectRandom _players;   // guaranteed to exist
            };
        };

        // --- Start conversation ---
        private _convo = ["powpassconvo", "powpassconvoScout"] select (_speaker == _scout);
        [_convo, [_speaker, ranger, HQRadio, pow]] remoteExec [
            "FoxClub_fnc_Conversation",
            allPlayers select { _x distance _speaker <= 100 }
        ];
    };
    case (!(pow in extractheli) && pilot in extractheli): {
        // Only Pilot in heli
        _scout   = missionNamespace getVariable ["scout", objNull];   
        _leader  = leader playerGroup;

        // --- Pick speaker from units aboard ---
        private _aboard = units playerGroup select { alive _x && _x in extractheli };
        private _speaker = objNull;

        if (_leader in _aboard) then {
            _speaker = _leader;
        } else {
            if (_scout in _aboard) then {
                _speaker = _scout;
            } else {
                private _players = _aboard select { isPlayer _x };
                _speaker = selectRandom _players;   // guaranteed to exist
            };
        };

        // --- Start conversation ---
        private _convo = ["pilotpassconvo", "pilotpassconvoScout"] select (_speaker == _scout);
        [_convo, [_speaker, ranger, HQRadio, pilot]] remoteExec [
            "FoxClub_fnc_Conversation",
            allPlayers select { _x distance _speaker <= 100 }
        ];
    };
};

//////////////////////////////////////////////////
//                                              //
//             PLAYERS SEE PRISON               //
//                                              //
//////////////////////////////////////////////////

/* There will be different convos based on different circumstances, which relate to who is in the extraction helicopter. 
*/

//////////////////////////////////////////////////
//                 CONDITION                    //
//////////////////////////////////////////////////

this && 
extractheli in thislist

//////////////////////////////////////////////////
//                 ACTIVATION                   //
//////////////////////////////////////////////////

switch (true) do {
    case (leader playerGroup in extractheli && scout in extractheli && pow in extractheli): {
        // A convo with the pilot and player. The speaker priority will be american leader, scout, random player.
        _scout = missionNamespace getVariable ["scout", objNull];
        _pilot = missionNamespace getVariable ["pilot", objNull];
        _pow   = missionNamespace getVariable ["pow", objNull];
        _leader = leader playergroup;

        // All alive playerGroup units in the heli
        private _aboard = (crew extractHeli) select { alive _x && _x in units playerGroup };

        // Remove scout, pilot, and pow
        private _eligible = _aboard select { !(_x in [_scout, _pilot, _pow]) };

        // Pick a random unit
        if (count _eligible > 0) then {
            private _speaker = selectRandom _eligible;
        } else {
            private _speaker = objNull; // fallback if no eligible unit
        };

        if (alive _leader && _leader != _scout && vehicle _leader == extractheli) then {  
            ["seePrisonPOW", [ranger, _leader, _pow, _scout]] remoteExec [
                "FoxClub_fnc_Conversation",
                allPlayers select { _x distance _leader <= 100 }
            ];
        } else {
            if (alive _scout && _leader == _scout && vehicle _scout == extractheli) then {  
                ["seePrisonScoutPOW", [ranger, _speaker, _pow, _scout]] remoteExec [ 
                    "FoxClub_fnc_Conversation", 
                    allPlayers select { _x distance _speaker <= 100 } 
                ];  
            } 
        };
    };
    case (leader playerGroup in extractheli && scout in extractheli): {
        // A convo with the pilot and player. The speaker priority will be american leader, scout, random player.
        _scout = missionNamespace getVariable ["scout", objNull];
        _pilot = missionNamespace getVariable ["pilot", objNull];
        _pow   = missionNamespace getVariable ["pow", objNull];
        _leader = leader playergroup;

        // All alive playerGroup units in the heli
        private _aboard = (crew extractHeli) select { alive _x && _x in units playerGroup };

        // Remove scout, pilot, and pow
        private _eligible = _aboard select { !(_x in [_scout, _pilot, _pow]) };

        // Pick a random unit
        if (count _eligible > 0) then {
            private _speaker = selectRandom _eligible;
        } else {
            private _speaker = objNull; // fallback if no eligible unit
        };

        if (alive _leader && _leader != _scout && vehicle _leader == extractheli) then {  
            ["seePrison", [ranger, _leader, _scout]] remoteExec [
                "FoxClub_fnc_Conversation",
                allPlayers select { _x distance _leader <= 100 }
            ];
        } else {
            if (alive _scout && _leader == _scout && vehicle _scout == extractheli) then {  
                ["seePrisonScout", [ranger, _scout, _speaker]] remoteExec [ 
                    "FoxClub_fnc_Conversation", 
                    allPlayers select { _x distance _speaker <= 100 } 
                ];  
            } 
        };
    };
    default {
        // A convo with the pilot and player. The speaker priority will be american leader, scout, random player.
        _scout   = missionNamespace getVariable ["scout", objNull];   
        _leader  = leader playerGroup;

        // --- Pick speaker from units aboard ---
        private _aboard = units playerGroup select { alive _x && _x in extractheli };
        private _speaker = objNull;

        if (_leader in _aboard && _leader != _scout) then {
            _speaker = _leader;
        } else {
            if (_scout in _aboard) then {
                _speaker = _scout;
            } else {
                private _players = _aboard select { isPlayer _x };
                _speaker = selectRandom _players; 
            };
        };

        // --- Start conversation ---
        private _convo = ["seePrisonDefault", "seePrisonDefaultScout"] select (_speaker == _scout);
        [_convo, [ranger, _speaker]] remoteExec [
            "FoxClub_fnc_Conversation",
            allPlayers select { _x distance _speaker <= 100 }
        ];
    };
};


			


// as extraction heli lands:

_scout   = missionNamespace getVariable ["scout", objNull];   
_leader  = leader playerGroup;

private _aboard = units playerGroup select { alive _x && _x in extractheli };
private _speaker = objNull;

if (_leader in _aboard && _leader != _scout) then {
    _speaker = _leader;
} else {
    if (_scout in _aboard) then {
        _speaker = _scout;
    } else {
        private _players = _aboard select { isPlayer _x };
        _speaker = selectRandom _players; 
    };
};

private _convo = ["heliAtBase", "heliAtBaseScout"] select (_speaker == _scout);
[_convo, [_speaker]] remoteExec [
    "FoxClub_fnc_Conversation",
    allPlayers select { _x distance _speaker <= 100 }
];


//////////////////////////////////////////////////
//                                              //
//                  POW DEATH                   //
//                                              //
//////////////////////////////////////////////////

/*
    Triggered when POW dies.
    Selects a speaker from nearby units within 100m of POW.
    Speaker priority:
        1. Group leader
        2. Scout
        3. Random player
        4. Random AI
*/

// POW death event handler
pow addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];

	// Run the rest in a scheduled environment (allows sleep)
	[_unit, _killer, _instigator] spawn {
		params ["_unit", "_killer", "_instigator"];

		private _pilot  = missionNamespace getVariable ["pilot", objNull];
		private _scout  = missionNamespace getVariable ["scout", objNull];
		private _leader = leader playerGroup;

		private _speaker = objNull;
		private _nearbyUnits = units playerGroup select {(_x distance _unit) <= 100};
		_nearbyUnits = _nearbyUnits - [_unit];
		
		if (!isNull _pilot) then {
			_nearbyUnits = _nearbyUnits - [_pilot];
		};
		
		if ((!isNull _leader) && {_leader in _nearbyUnits}) then {
			_speaker = _leader;
		} else {
			if ((!isNull _scout) && {_scout in _nearbyUnits}) then {
				_speaker = _scout;
			} else {
				private _playerUnits = _nearbyUnits select {alive _x && isPlayer _x};
				if (count _playerUnits > 0) then {
					_speaker = selectRandom _playerUnits;
				} else {
					private _aiUnits = _nearbyUnits select {alive _x && !isPlayer _x};
					if (count _aiUnits > 0) then {
						_speaker = selectRandom _aiUnits;
					};
				};
			};
		};

		private _convo = ["powDead", "powDeadScout"] select (_speaker == _scout);
		[_convo, [_speaker]] remoteExec [
			"FoxClub_fnc_Conversation",
			allPlayers select { _x distance _speaker <= 100 }
		];

		sleep 1; // wait for convo before showing killer info

		private _killerName = "Unknown";
		private _killerSideName = "";

		if (!isNull _instigator) then {
			private _killerSide = side _instigator;

			// --- If killer is on WEST side, show actual unit name ---
			if (_killerSide == west) then {
				_killerName = name _instigator; // shows player name or AI's setIdentity name
			} else {
				// --- For other sides, show readable class name ---
				_killerName = getText (configFile >> "CfgVehicles" >> typeOf _instigator >> "displayName");
			};

			// --- Determine side label ---
			switch (_killerSide) do {
				case west: { _killerSideName = "(Rankin)"; };
				case east: { _killerSideName = "(PAVN)"; };
				case independent: { _killerSideName = "(ARVN)"; };
				case civilian: { _killerSideName = "(Civilian)"; };
				default { _killerSideName = ""; };
			};
		};

		systemChat format ["The POW was killed by: %1 %2", _killerName, _killerSideName];
	};
}];


//////////////////////////////////////////////////
//                                              //
//                PILOT DEATH                   //
//                                              //
//////////////////////////////////////////////////

pilot addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];

	[_unit, _killer, _instigator] spawn {
		params ["_unit", "_killer", "_instigator"];

		private _pow  = missionNamespace getVariable ["pow", objNull];
		private _scout  = missionNamespace getVariable ["scout", objNull];
		private _leader = leader playerGroup;

		private _speaker = objNull;
		private _nearbyUnits = units playerGroup select {(_x distance _unit) <= 100};
		_nearbyUnits = _nearbyUnits - [_unit];
		
		if (!isNull _pow) then {
			_nearbyUnits = _nearbyUnits - [_pow];
		};
		
		if ((!isNull _leader) && {_leader in _nearbyUnits}) then {
			_speaker = _leader;
		} else {
			if ((!isNull _scout) && {_scout in _nearbyUnits}) then {
				_speaker = _scout;
			} else {
				private _playerUnits = _nearbyUnits select {alive _x && isPlayer _x};
				if (count _playerUnits > 0) then {
					_speaker = selectRandom _playerUnits;
				} else {
					private _aiUnits = _nearbyUnits select {alive _x && !isPlayer _x};
					if (count _aiUnits > 0) then {
						_speaker = selectRandom _aiUnits;
					};
				};
			};
		};

		private _convo = ["pilotDead", "pilotDeadScout"] select (_speaker == _scout);
		[_convo, [_speaker]] remoteExec [
			"FoxClub_fnc_Conversation",
			allPlayers select { _x distance _speaker <= 100 }
		];

		sleep 1; 

		private _killerName = "Unknown";
		private _killerSideName = "";

		if (!isNull _instigator) then {
			private _killerSide = side _instigator;

			if (_killerSide == west) then {
				_killerName = name _instigator; 
			} else {
				_killerName = getText (configFile >> "CfgVehicles" >> typeOf _instigator >> "displayName");
			};

			switch (_killerSide) do {
				case west: { _killerSideName = "(Rankin)"; };
				case east: { _killerSideName = "(PAVN)"; };
				case independent: { _killerSideName = "(ARVN)"; };
				case civilian: { _killerSideName = "(Civilian)"; };
				default { _killerSideName = ""; };
			};
		};

		systemChat format ["The pilot was killed by: %1 %2", _killerName, _killerSideName];
	};
}];


// list of objects to be deleted at the ingress point:
deleteVehicle getinstab;
deleteVehicle heli_1; // prop at base
deleteVehicle jeep; // prop at base
deleteVehicle mp2; // ai at base
deleteVehicle mp1; // ai at base
deletevehicle trg_convo_cove; // trigger near base
deletevehicle intro2_trg; // trigger near base
deletevehicle trg_wrongway_1; // trigger near base
missionNamespace setVariable ["actionBriefing", false, true]; // turns off captain intro questions
deletevehicle trg_remove_naval_patrol; // trigger near cove

{
    deleteVehicle _x;
} forEach units patrolboatgroup;
deleteVehicle patrolboat;

deleteVehicle trg_wrongway_3;
deleteVehicle trg_wrongway_2;
deleteVehicle wait_pass;
deleteVehicle wait_fail;
deleteVehicle trg_patrolboat_dead;
deleteVehicle task0;
deleteVehicle scubatime;

{
    deleteVehicle _x;
} forEach units ambushpatrol;

deleteVehicle trg_ambush;

{
    deleteVehicle _x;
} forEach units sampanPatrol1;
deleteVehicle sampanPatrolBoat1;
deleteVehicle sampanPatrolBoat2;

{
    deleteVehicle _x;
} forEach units sampanPatrol2;
deleteVehicle sampanPatrolBoat3;
deleteVehicle sampanPatrolBoat4;
deleteVehicle sampanPatrolBoat5;


{
    deleteVehicle _x;
} forEach units sampanPatrol3;
deleteVehicle sampanPatrolBoat6;

//new EH, needs to filter out players and ai. and vics.
addMissionEventHandler ["BuildingChanged", {
	params ["_from", "_to", "_isRuin"];

	if (_isRuin) then {

		// Classes to exclude from deletion
		private _excludeClasses = ["Land_vn_hut_01_ruin", "Land_vn_hut_02_ruin", "Land_vn_hut_03_ruin", "Land_vn_hut_04_ruin", "#destructioneffects", "#explosion"];

		private _nearObjs = _from nearObjects 10;

		private _toDelete = [];
		private _skipped  = [];

		{
			if (!(_excludeClasses find typeOf _x > -1)) then {
				_toDelete pushBack _x;
			} else {
				_skipped pushBack _x;
			};
		} forEach _nearObjs;

		// Log all at once
		diag_log format ["Deleting objects: %1", _toDelete];
		diag_log format ["Skipped objects (excluded class): %1", _skipped];

		// Actually delete
		{ deleteVehicle _x; } forEach _toDelete;

	};
}];








