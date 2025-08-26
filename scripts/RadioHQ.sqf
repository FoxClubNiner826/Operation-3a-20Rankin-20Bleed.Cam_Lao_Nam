//JIPtestVAR = player addAction ["Radio Headquarters", {["RadioHQ.sqf"] remoteExec ["execVM", 0];}, [], 8, false, true, "", "isNil 'showGlobalAction'"];

//call{playsound "wait1"};
/*
params ["_caller"];

_caller say3D ["wait1", 100];
player sideChat "Rankin, Hawk. We’re set and ready for the show. Over.";
sleep 7;
call{playsound "wait2"};
sleep 1;
HQRadio sideChat "Hawk, Rankin. Roger that. Heads up, weather should be moving in shortly. Out.";
sleep 6;
*/

titleText ["", "BLACK OUT", 3];
3 fadesound 0;
sleep 5;

missionNamespace setVariable ["NavalPatrolvariableActivated", true, true];

/*
skipTime -24;
86400 setOvercast .5;
skipTime 24;
0 setRain .40;
0 setFog [1, .20, 5];
setDate [1967, 3, 31, 5, 57];
*/

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

[ "patrolbegins", [ leader player ] ] call FoxClub_fnc_Conversation;

//600 setOvercast .25;
[600, 0.25] remoteExec ["setOvercast", 0, true];

sleep 7;

/*
if (!isMultiplayer) then {
    command say3D ["waitforboat", 100];
    //["PlayerQuestions", "StagingArea", ["Question1", "Question1"]] spawn BIS_fnc_kbTell;
    hint "This is a single-player mission.";
};
