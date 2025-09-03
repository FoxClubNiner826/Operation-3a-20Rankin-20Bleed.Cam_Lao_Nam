titleText ["", "BLACK OUT", 3];
3 fadesound 0;
sleep 5;

missionNamespace setVariable ["NavalPatrolvariableActivated", true, true];

[
    {
        skipTime -24;
        86400 setOvercast 0.5;
        skipTime 24;
        0 setRain 0.40;
        0 setFog [1, 0.20, 5];
        setDate [1967, 3, 31, 5, 57];
    }
] remoteExec ["call", 0, true];

3 fadesound 1;
sleep 2;

titleText ["", "BLACK IN", 3];
sleep 3;
[] Spawn {
[ 
 [ 
  ["Recon Position", "<t align = 'center' shadow = '1' size = '1.5' font='tt2020style_e_vn_bold'>%1</t><br/>"],  
  ["0557h", "<t align = 'center' shadow = '1' size = '1.0'>%1</t><br/>"]
 ] 
] spawn vn_ms_fnc_sfx_typeText;};

sleep 8;

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

[600, 0.25] remoteExec ["setOvercast", 0, true];

sleep 7;
