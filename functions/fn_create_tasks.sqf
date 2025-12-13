
// if achievements where selected then we delete the parent task so they all disappear, thus allowing secondary tasks to be positioned under primary tasks
if (missionNamespace getVariable ["foxClub_var_createCheevos", false]) then {
    ["tsk_parent_cheevos", west, false] call BIS_fnc_deleteTask;
    ["cheevo_perfectScore", west, false] call BIS_fnc_deleteTask;
    ["cheevo_worstScore", west, false] call BIS_fnc_deleteTask;
    ["cheevo_phantomTeam", west, false] call BIS_fnc_deleteTask;
    ["cheevo_rescueEffort", west, false] call BIS_fnc_deleteTask;
    ["cheevo_radioTower", west, false] call BIS_fnc_deleteTask;
    ["cheevo_radioBackpack", west, false] call BIS_fnc_deleteTask;
    ["cheevo_preventDown", west, false] call BIS_fnc_deleteTask;
};


// creates server-only triggers for the tasks
remoteExec ["FoxClub_fnc_create_task_triggers", 2];


//////////////////////////////////////////////////
//                                              //
//                   HVT TASK                   //
//                                              //
//////////////////////////////////////////////////

[
    west, // owner
    ["tsk_hvt", "PRI"], // task ID' ["subTask", "parentTask"]
    [
        "Eleminate General Tan. You must provide proof of his death. Search his body for identification papers.<br/><br/>

Tip: Use the Action Menu to search his body.<br/><br/>

<img image='pics\hvt.jpg' />", // description
        "Eleminate the HVT", // title
        "" //marker
    ],
    objNull, // destination; object(or objNull) or array
    "CREATED", // state (created, assigned,etc)
    -1, // priority (-1 for not auto assign)
    false, // show notificaiton
    "kill", // task icon
    false // makes task always visible in 3D
] call BIS_fnc_taskCreate;


//////////////////////////////////////////////////
//                                              //
//                  STAB TASK                   //
//                                              //
//////////////////////////////////////////////////

[
    west, // owner
    ["tsk_stab", "PRI"], // task ID' ["subTask", "parentTask"]
    [
        "Because we are operating illegally in Cambodia, we need to destroy any evidence of our presence. Make a descision:<br/><br/>

Option 1: Destroy the STAB now.<br/>
Option 2: Come back to destory the STAB after you have killed the HVT.<br/>
Option 3: Use a timed explosive to destroy the STAB. <br/><br/>

Tip: Use the Action Menu while looking at the STAB to place a timed explosive. The STAB must be destroyed prior to extraction or you will fail this task.<br/><br/>

<img image='pics\stab.jpg' />", // description
        "Destroy the STAB", // title
        "" //marker
    ],
    objNull, // destination; object(or objNull) or array
    "CREATED", // state (created, assigned,etc)
    -1, // priority (-1 for not auto assign)
    false, // show notificaiton
    "destroy", // task icon
    false // makes task always visible in 3D
] call BIS_fnc_taskCreate;


//////////////////////////////////////////////////
//                                              //
//               GET TO LZ TASK                 //
//                                              //
//////////////////////////////////////////////////

[
    west, // owner
    ["tsk_lz", "PRI"], // task ID' ["subTask", "parentTask"]
    [
        "The <marker name='marker_1_LZ'>exfiltration point</marker> is located on Hill 156.<br/><br/>

Tip: Be sure to bring a smoke grenade to mark the LZ for exfil.<br/><br/>

<img image='pics\get2lz.jpg'/>", // description
        "Proceed to the Exfil Point", // title
        "" //marker
    ],
    objNull, // destination; object(or objNull) or array
    "CREATED", // state (created, assigned,etc)
    -1, // priority (-1 for not auto assign)
    false, // show notificaiton
    "run", // task icon
    false // makes task always visible in 3D
] call BIS_fnc_taskCreate;


//////////////////////////////////////////////////
//                                              //
//     PARENT TASK FOR SECONDARY OBJECTIVES     //
//                                              //
//////////////////////////////////////////////////

[
    west, // owner
    "tsk_parent_secondary", // task ID
    [
        "Complete these optional objectives at your discretion.", // description
        "Secondary Objectives", // title
        "" //marker
    ],
    objNull, // destination; object(or objNull) or array
    "CREATED", // state (created, assigned,etc)
    -1, // priority (-1 for not auto assign)
    false, // show notificaiton
    "whiteboard", // task icon
    false // makes task always visible in 3D
] call BIS_fnc_taskCreate;


//////////////////////////////////////////////////
//                                              //
//               UNDETECTED TASK                //
//                                              //
//////////////////////////////////////////////////

// if players skip the infil spot and get to lumphat undetected then this task will complete and the others will be ran
private _undetected_notification = [false, true] select (!(missionNamespace getVariable ["infilTaskSucceeded", false]));

private "_undetected_state";
switch (true) do {
    case (missionNamespace getVariable ["foxClub_var_players_skipped_infil_undetected", false]): { _undetected_state = "SUCCEEDED"; };
    case (missionNamespace getVariable ["foxClub_var_failAchievementGhost", false]): { _undetected_state = "FAILED"; };
    default { _undetected_state = "ASSIGNED"; };
};


[
    west, // owner
    ["tsk_undetected", "tsk_parent_secondary"], // task ID' ["subTask", "parentTask"]
    [
        "Remain undetected before reaching <marker name='lumphat'>Lumphat</marker>. The HVT is likely to flee the area if your presence in known. <br/><br/>

Tip: If you get spotted, eleminate all members of the patrol before they can raise the alarm.<br/><br/>

<img image='pics\stealth.jpg' />", // description
        "Remain Undetected", // title
        "" //marker
    ],
    objNull, // destination; object(or objNull) or array
    _undetected_state, // state (created, assigned,etc)
    -1, // priority (-1 for not auto assign)
    _undetected_notification, // show notificaiton
    "listen", // task icon
    false // makes task always visible in 3D
] call BIS_fnc_taskCreate;


//////////////////////////////////////////////////
//                                              //
//               SEARCH TASK                    //
//                                              //
//////////////////////////////////////////////////

[
    west, // owner
    ["tsk_search", "tsk_parent_secondary"], // task ID' ["subTask", "parentTask"]
    [
        "At your discretion, search <marker name='lumphat'>Lumphat</marker> for anything of value.<br/><br/>
<img image='pics\search.jpg' />", // description
        "Search Lumphat for Intel", // title
        "" //marker
    ],
    objNull, // destination; object(or objNull) or array
    "CREATED", // state (created, assigned,etc)
    -1, // priority (-1 for not auto assign)
    false, // show notificaiton
    "search", // task icon
    false // makes task always visible in 3D
] call BIS_fnc_taskCreate;


// if players selected 3d icons then apply them to the new created tasks
if (missionNamespace getVariable ["visAid", false]) then {
    ["tsk_hvt", officer] call BIS_fnc_taskSetDestination; // Kill the hvt, updated
    ["tsk_stab", ptboat] call BIS_fnc_taskSetDestination; // Destroy the stab, updated
    ["tsk_undetected", [7813.57,9099.84,7.153]] call BIS_fnc_taskSetDestination; // remain undetected, updated
    ["tsk_lz", [8585.34,8187.91,2.41499]] call BIS_fnc_taskSetDestination; // get to the exfil, updated and tested
    ["tsk_search", [7784.76,9091.68,6.89072]] call BIS_fnc_taskSetDestination; // search lumphat, updated
};


// if achievements were selected, since we deleted them at the top of this script, when now add them again, thus allowing them to be displayed under secondary tasks
if (missionNamespace getVariable ["foxClub_var_createCheevos", false]) then {
    call FoxClub_fnc_achievements;
};
