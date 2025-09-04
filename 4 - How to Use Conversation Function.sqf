// The first index is the name of the subtitle text in init.sqf. This contains the actual text of the subtitle. 
// The second index is who will be saying the subtitle. This determines things like who gets lip movement, the name tag of the subtitle, etc. 
// RemoteExec then broadcasts the function (subtitle) to all players on the server. The proximity determines which clients the function is 
// executed on (subtitles, say3d, etc).

//Examples
//1. To send the subtitle to all the players regardless of proximity:
["name1", [leader playergroup]] remoteExec ["FoxClub_fnc_Conversation"];

//2. To send the subtitle to all players withiin 100 meters of the leader of the group:
["name1", [leader playergroup]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance leader playergroup <= 100}];
//Cannot use `leader player` because it wouldnt work on a dedicated server since `player` doesn't exist. 
//This option also wouldn't filter out if the scout is the leader of the group.

//3. To send a randomly chosen subtitle to all players regardless of proximity.
[selectRandom ["name1", "name2", "name3"], [leader playergroup]] remoteExec ["FoxClub_fnc_Conversation"];


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