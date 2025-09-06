/*
    File: SkiptoIngress.sqf
    Author: FoxClubNiner
    Description:
        Fades player screen. Completes a task. Moves units into boat. Changes weather. Displays text.
*/

titleText ["", "BLACK OUT", 3];
4 fadesound 0;
0 fadespeech 0;
missionNamespace setVariable ["skiptoinfil", true, true];

sleep 3; //make sure the screen is black before teleport
["gettorecon","SUCCEEDED"] call BIS_fnc_taskSetState;

//moves everyone into the vehicle
{
    if (vehicle _x == _x) then {
        _x moveInAny ptboat;
    };
} foreach units playerGroup;

skipTime -24; //sets overcast because of time limitations
86400 setOvercast .5; //sets overcast because of time limitations
skipTime 24; //sets overcast because of time limitations
0 setRain .40; //set rain
0 setFog [1, .20, 5]; //set fog
setDate [1967, 3, 31, 6, 15];  //set date
vehicle player setPos (getPos skipintro); //teleports vehicle with players
sleep 4;
4 fadesound 1;
0 fadespeech 1;

titleText ["", "BLACK IN", 3];
sleep 3;

[] Spawn {
[ 
 [ 
  ["Infiltration Point", "<t align = 'center' shadow = '1' size = '1.5' font='tt2020style_e_vn_bold'>%1</t><br/>"],  
  ["0615h", "<t align = 'center' shadow = '1' size = '1.0'>%1</t><br/>"]
 ] 
] spawn vn_ms_fnc_sfx_typeText;};

600 setOvercast .25;