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


// if players are spotted  by patrol 1-3. This one is tricky because player could be split up at this point. I need a convo for subs when they are together
// and when they are split. because when they are split I need to do a radio or groupChat message. I need to decide if I want to use groupChat or sideChat.
// groupChat will be most like vanilla arma. sideChat would make more sense for the time period. Ultimatley teams tried to stay off the radio, so I have 
// changed this to not do radio and will do a check for distance.

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

// hold action for disabling comms 

// after pilot gets shot down. I want the leader to say something to the scout but only if they are within distance to each other because 
// players might be split up at this point. I need to consider that the leader might not even be present so no convo would happen.

_scout = missionNamespace getVariable ["scout", objNull];   
_leader = leader playergroup;   
// convo if the leader isn't the scout
if (alive _leader && 
    _leader != _scout && 
    _leader in units playergroup &&
    _leader inArea pilot_trigger) then {  

        ["pilotdown", [_leader, _scout]] remoteExec [    
            "FoxClub_fnc_Conversation",    
            allPlayers select { _x distance _leader <= 100 }    
        ];

        sleep 3;

        if (_leader distance _scout <= 100) then {
        ["pilotdownScout", [_scout]] remoteExec [    
            "FoxClub_fnc_Conversation",    
            allPlayers select { _x distance _scout <= 100 }    
        ];    
        };  
} else {
    _unitsInArea = (switchableUnits + playableUnits) select {  
    (_x inArea pilot_trigger) && (alive _x)  
    }; 

    private ["_selectedUnit"];
    if (count _unitsInArea > 0) then { 
        _selectedUnit = selectRandom _unitsInArea;
    };

    ["pilotdown", [_selectedUnit]] remoteExec [
        "FoxClub_fnc_Conversation", 
        allPlayers select {_x distance _selectedUnit <= 100}];
};

// convo if the leader is the scout   
if (alive _scout && 
    _leader == _scout && 
    _scout in units playergroup &&
    _leader inArea pilot_trigger) then { 

        ["pilotdownScout", [_scout]] remoteExec [    
            "FoxClub_fnc_Conversation",    
            allPlayers select { _x distance _scout <= 100 }    
        ];

        sleep 3;

        if (_leader distance _scout <= 100) then {
        ["pilotdown", [_leader]] remoteExec [    
            "FoxClub_fnc_Conversation",    
            allPlayers select { _x distance _leader <= 100 }    
        ];    
        };   
} else {
    _unitsInArea = (switchableUnits + playableUnits) select {  
    (_x inArea pilot_trigger) && (alive _x)  
    }; 

    private ["_selectedUnit"];
    if (count _unitsInArea > 0) then { 
        _selectedUnit = selectRandom _unitsInArea;
    };

    ["pilotdown", [_selectedUnit]] remoteExec [
        "FoxClub_fnc_Conversation", 
        allPlayers select {_x distance _selectedUnit <= 100}];
};

if (leader !scout) then {
    // leader speaks (not scout)
} else {
    // pick random unit to speak
  if (leader scout) then {
    // scout speaks
  } else {
    // pick random unit to speak
};
};