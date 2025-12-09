/*
    File: SkiptoIngress.sqf
    Author: FoxClubNiner
    Description:
        Fades player screen. Completes a task. Moves units into boat. Changes weather. Displays text.
*/

titleText ["", "BLACK OUT", 3];
4 fadesound 0;
0 fadespeech 0;
missionNamespace setVariable ["skiptoinfil", true, true]; //needed to gate convo

sleep 3; //make sure the screen is black before teleport

// complete the skipped tasks as if the player had done them
["gettorecon", west, true] call BIS_fnc_deleteTask;

[
    west, // owner
    ["tsk_cove_skipped", "PRI"], // task ID' ["subTask", "parentTask"]
    [
        "Motor north under cover of darkness. There are red-filter torches in the boat to aid you in the darkness. Hide the boat in the <marker name='cove'>cove</marker> and take up a reconnasance position. <br/><br/><img image='pics\reconpos3.jpg' />", // description
        "Proceed to the Cove", // title
        "" //marker
    ],
    objNull, // destination; object(or objNull) or array
    "SUCCEEDED", // state (created, assigned,etc)
    -1, // priority (-1 for not auto assign)
    false, // show notificaiton
    "navigate", // task icon
    false // makes task always visible in 3D
] call BIS_fnc_taskCreate;

[
    west, // owner
    ["tsk_wait_skipped", "PRI"], // task ID' ["subTask", "parentTask"]
    [
        "When you are in position, radio Headquaters. <br/><br/>Tip: Use the Action Menu to radio HQ.<br/><br/><img image='pics\wait.jpg' />", // description
        "Radio HQ", // title
        "" //marker
    ],
    objNull, // destination; object(or objNull) or array
    "SUCCEEDED", // state (created, assigned,etc)
    -1, // priority (-1 for not auto assign)
    false, // show notificaiton
    "radio", // task icon
    false // makes task always visible in 3D
] call BIS_fnc_taskCreate;

[
    west, // owner
    ["tsk_upriver_skipped", "PRI"], // task ID' ["subTask", "parentTask"]
    [
        "Once the naval patrol leaves the area, suit up with your diving gear and deactivate the <marker name='mines'>naval mines</marker> blocking your path upriver.<br/><br/>Tip: Use the Action Menu while inside the STAB to equip SCUBA gear. You can re-equip your loadout by the same method. Use the Action Menu to defuse mines.<br/><br/><img image='pics\mines.jpg' />", // description
        "Proceed Upriver", // title
        "" //marker
    ],
    objNull, // destination; object(or objNull) or array
    "SUCCEEDED", // state (created, assigned,etc)
    -1, // priority (-1 for not auto assign)
    false, // show notificaiton
    "danger", // task icon
    false // makes task always visible in 3D
] call BIS_fnc_taskCreate;




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

sleep 1; // makes sure everyone is loaded into before the teleport. might have to increase the time
vehicle player setPos (getPos skipintro); //teleports vehicle with players
sleep 3;
4 fadesound 1;
0 fadespeech 1;

titleText ["", "BLACK IN", 3];
sleep 3;

// this might be being duplicated because this fnc is remoteexec on the server and clients.
[] Spawn {
[ 
 [ 
  ["Infiltration Point", "<t align = 'center' shadow = '1' size = '1.5' font='tt2020style_e_vn_bold'>%1</t><br/>"],  
  ["0615h", "<t align = 'center' shadow = '1' size = '1.0'>%1</t><br/>"]
 ] 
] spawn vn_ms_fnc_sfx_typeText;};

600 setOvercast .25;