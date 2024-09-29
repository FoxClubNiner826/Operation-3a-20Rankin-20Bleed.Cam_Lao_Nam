//JIPtestVAR = player addAction ["Radio Headquarters", {["RadioHQ.sqf"] remoteExec ["execVM", 0];}, [], 8, false, true, "", "isNil 'showGlobalAction'"];

call{playsound "wait1"};
player sideChat "Rankin, Hawk. We're in position and waiting for the patrol. Over.";
sleep 7;
call{playsound "wait2"};
sleep 1;
HQRadio sideChat "Hawk, Rankin. Good copy. Don't let the bugs get you. Over and out.";
sleep 6;

titleText ["", "BLACK OUT", 3];
3 fadesound 0;
sleep 5;

NavalPatrolvariableActivated = true;

skipTime -24;
86400 setOvercast .5;
skipTime 24;
0 setRain .40;
0 setFog [1, .20, 5];
setDate [1967, 3, 31, 5, 57];

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

600 setOvercast .25;