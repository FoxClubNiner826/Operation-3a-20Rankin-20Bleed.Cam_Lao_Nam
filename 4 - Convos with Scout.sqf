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


// when players enter the rat hole. leader then scout then random player. responders opposite speaker unless random then no responder.
_scout   = missionNamespace getVariable ["scout", objNull];   
_leader  = leader playergroup;
private _units = units playergroup inAreaArray pilot_joins_group;

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
