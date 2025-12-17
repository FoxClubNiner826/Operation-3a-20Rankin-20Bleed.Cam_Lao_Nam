/*
    File: fn_create_tasks.sqf
    Author: FoxClubNiner
    Description:
        Creates 5 tasks at the infil spot and places the achievement categlory at the bottom of the list.
*/

// if achievements where selected then we delete their tasks so they all disappear, thus allowing secondary tasks to be positioned under the other parent tasks
if (missionNamespace getVariable ["foxClub_var_createCheevos", false]) then {
    // deletes place holder tasks, since for some reason I can't recreate a task that was deleted
    ["tsk_parent_cheevos_placeholder", west, false] call BIS_fnc_deleteTask;
    ["cheevo_perfectScore_placeholder", west, false] call BIS_fnc_deleteTask;
    ["cheevo_worstScore_placeholder", west, false] call BIS_fnc_deleteTask;
    ["cheevo_phantomTeam_placeholder", west, false] call BIS_fnc_deleteTask;
    ["cheevo_rescueEffort_placeholder", west, false] call BIS_fnc_deleteTask;
    ["cheevo_radioTower_placeholder", west, false] call BIS_fnc_deleteTask;
    ["cheevo_radioBackpack_placeholder", west, false] call BIS_fnc_deleteTask;
    ["cheevo_preventDown_placeholder", west, false] call BIS_fnc_deleteTask;
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


// if achievements were selected, since we deleted their placeholders at the top of this script, we now create them, thus allowing them to be displayed under secondary tasks
if (missionNamespace getVariable ["foxClub_var_createCheevos", false]) then {
    // create the triggers for the achievements on the server
    remoteExec ["FoxClub_fnc_createAchievementTriggers", 2];

    //////////////////////////////////////////////////
    //                                              //
    //         PARENT TASK FOR ACHIEVEMENTS         //
    //                                              //
    //////////////////////////////////////////////////

    [
        west, // owner
        "tsk_parent_cheevos", // task ID
        [
            "Complete these optional achievements at your discretion.", // description
            "Achievements", // title
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
    //               PERFECT MISSION                //
    //                                              //
    //////////////////////////////////////////////////

    [
        west, // owner
        ["cheevo_perfectScore", "tsk_parent_cheevos"], // task ID' ["subTask", "parentTask"]
        [
            "Achieve a perfect outcome by completing all primary and secondary tasks that are possible in the mission.", // description
            "Medal of Honor", // title
            "" //marker
        ],
        objNull, // destination; object(or objNull) or array
        "CREATED", // state (created, assigned,etc)
        -1, // priority (-1 for not auto assign)
        false, // show notificaiton
        "meet", // task icon
        false // makes task always visible in 3D
    ] call BIS_fnc_taskCreate;


    //////////////////////////////////////////////////
    //                                              //
    //                WORST MISSION                 //
    //                                              //
    //////////////////////////////////////////////////

    [
        west, // owner
        ["cheevo_worstScore", "tsk_parent_cheevos"], // task ID' ["subTask", "parentTask"]
        [
            "Fail all of the most important tasks in the mission: <br/><br/>
            1. Kill the HVT<br/>
            2. Destroy the STAB<br/>
            3. Extract from the LZ with all personnel.<br/>
            ", // description
            "Dishonorable Discharge", // title
            "" //marker
        ],
        objNull, // destination; object(or objNull) or array
        "CREATED", // state (created, assigned,etc)
        -1, // priority (-1 for not auto assign)
        false, // show notificaiton
        "danger", // task icon
        false // makes task always visible in 3D
    ] call BIS_fnc_taskCreate;


    //////////////////////////////////////////////////
    //                                              //
    //                GHOST MISSION                 //
    //                                              //
    //////////////////////////////////////////////////

    [
        west, // owner
        ["cheevo_phantomTeam", "tsk_parent_cheevos"], // task ID' ["subTask", "parentTask"]
        [
            "Secure the HVT’s credentials and exfiltrate undetected.", // description
            "Phantom Team", // title
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
    //                RESCUE MISSION                //
    //                                              //
    //////////////////////////////////////////////////

    [
        west, // owner
        ["cheevo_rescueEffort", "tsk_parent_cheevos"], // task ID' ["subTask", "parentTask"]
        [
            "Find and Rescue both the Downed Pilot and the POW.", // description
            "All Assets Secured", // title
            "" //marker
        ],
        objNull, // destination; object(or objNull) or array
        "CREATED", // state (created, assigned,etc)
        -1, // priority (-1 for not auto assign)
        false, // show notificaiton
        "help", // task icon
        false // makes task always visible in 3D
    ] call BIS_fnc_taskCreate;


    //////////////////////////////////////////////////
    //                                              //
    //             DISABLE RADIO TOWER              //
    //                                              //
    //////////////////////////////////////////////////

    [
        west, // owner
        ["cheevo_radioTower", "tsk_parent_cheevos"], // task ID' ["subTask", "parentTask"]
        [
            "Find a way to disrupt enemy comms.", // description
            "Cut the Line", // title
            "" //marker
        ],
        objNull, // destination; object(or objNull) or array
        "CREATED", // state (created, assigned,etc)
        -1, // priority (-1 for not auto assign)
        false, // show notificaiton
        "use", // task icon
        false // makes task always visible in 3D
    ] call BIS_fnc_taskCreate;


    //////////////////////////////////////////////////
    //                                              //
    //                RADIO BACKPACK                //
    //                                              //
    //////////////////////////////////////////////////

    [
        west, // owner
        ["cheevo_radioBackpack", "tsk_parent_cheevos"], // task ID' ["subTask", "parentTask"]
        [
            "Warning: Not currently implemented! <br/><br/>
            Equip the Kit Carson with an enemy radio backpack and use it to your advantage.", // description
            "Ghost on the Wire", // title
            "" //marker
        ],
        objNull, // destination; object(or objNull) or array
        "CREATED", // state (created, assigned,etc)
        -1, // priority (-1 for not auto assign)
        false, // show notificaiton
        "radio", // task icon
        false // makes task always visible in 3D
    ] call BIS_fnc_taskCreate;  


    //////////////////////////////////////////////////
    //                                              //
    //           PREVENT PILOT DOWNING              //
    //                                              //
    //////////////////////////////////////////////////

    [
        west, // owner
        ["cheevo_preventDown", "tsk_parent_cheevos"], // task ID' ["subTask", "parentTask"]
        [
            "Prevent the American pilot from being shot down.", // description
            "Overwatch", // title
            "" //marker
        ],
        objNull, // destination; object(or objNull) or array
        "CREATED", // state (created, assigned,etc)
        -1, // priority (-1 for not auto assign)
        false, // show notificaiton
        "airdrop", // task icon
        false // makes task always visible in 3D
    ] call BIS_fnc_taskCreate;
    
};
