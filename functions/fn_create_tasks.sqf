remoteExec ["FoxClub_fnc_create_task_triggers", 2];

hint "create tasks fired";
//////////////////////////////////////////////////
//                                              //
//         TASKS FOR PRIMARY OBJECTIVES         //
//                                              //
//////////////////////////////////////////////////

// updated the 3d icon for this already in the turn on and off from map board. also updated the fail condition in the editor
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

// updated 3d icons. created fail trigger
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
//        TASKS FOR SECONDARY OBJECTIVES        //
//                                              //
//////////////////////////////////////////////////