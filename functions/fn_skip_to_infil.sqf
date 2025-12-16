/*
    File: SkiptoIngress.sqf
    Author: FoxClubNiner
    Description:
        Fades player screen. Completes a task. Moves units into boat. Changes weather. Displays text.
*/

cutText ["", "BLACK OUT", 3]; // use cutText instead of titleText because my convo function (playSound) will disable the blackout.
3 fadesound 0;
0 fadespeech 0;
missionNamespace setVariable ["skiptoinfil", true, true]; //needed to gate convo
//["gettorecon", west, true] call BIS_fnc_deleteTask; // before the sleep so that the task doesn't get created when the trigger is deleted

sleep 3; //make sure the screen is black before teleport

// deletes unneeded triggers and props in staging area
deleteVehicle arsenal;
deleteVehicle getinstab; 
deleteVehicle heli_1;  
deleteVehicle jeep;  
deleteVehicle mp2;  
deleteVehicle mp1;  
deletevehicle trg_convo_cove; 
deletevehicle intro2_trg; 
deletevehicle trg_wrongway_1;
deletevehicle trg_remove_naval_patrol; 

// deleltes uneeded naval patrol at cove
{ 
    deleteVehicle _x; 
} forEach units patrolboatgroup; 
deleteVehicle patrolboat; 

// deletes unneeded triggers at cove
deleteVehicle waitforpatroltask; // task
deleteVehicle trg_completeTask_radioHQ; // trigger for task
deleteVehicle wait_task; // task
deleteVehicle uprivertask; // trigger for task
deleteVehicle createclearminestask;
deleteVehicle upriver;

deleteVehicle trg_wrongway_3; 
deleteVehicle trg_wrongway_2; 
deleteVehicle wait_pass; 
deleteVehicle wait_fail; 
deleteVehicle trg_patrolboat_dead; 
deleteVehicle task0; 
deleteVehicle scubatime; 

// deletes unnedded units at cove
{ 
    deleteVehicle _x; 
} forEach units ambushpatrol; 
 
deleteVehicle trg_ambush; 

// deletes unneeded naval units in upriver area
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


// complete the skipped tasks as if the player had done them
//deleteVehicle trg_createTask_proceedToCove;
trg_createTask_proceedToCove enableSimulation false;

[
    west, // owner
    ["tsk_cove_skipped", "PRI"], // task ID' ["subTask", "parentTask"]
    [
        "Motor north under cover of darkness. There are red-filter torches in the boat to aid you in the darkness. Hide the boat in the <marker name='cove'>cove</marker> and take up a reconnasance position. <br/><br/><img image='pics\reconpos3.jpg' />", // description
        "Proceed to the Cove: Skip Function.", // title
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

cutText ["", "BLACK IN", 3];
sleep 3;

[] Spawn {
[ 
 [ 
  ["Infiltration Point", "<t align = 'center' shadow = '1' size = '1.5' font='tt2020style_e_vn_bold'>%1</t><br/>"],  
  ["0615h", "<t align = 'center' shadow = '1' size = '1.0'>%1</t><br/>"]
 ] 
] spawn vn_ms_fnc_sfx_typeText;};

600 setOvercast .25;