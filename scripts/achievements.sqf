/*
    File: achievements.sqf
    Author: FoxClubNiner
    Description:
        Creates a task parent category and several tasks under it.
*/

/* example task
[
    west, // owner
    "task1", // task ID
    [
        "Do this and you get a cookie", // description
        "Earn Cookie", // title
        "cookiemarker" //marker
    ],
    [0, 0, 0], // destination; object(or objNull) or array
    "ASSIGNED", // state (created, assigned,etc)
    -1, // priority (-1 for not auto assign)
    true, // show notificaiton
    "", // task icon
    false // makes task always visible in 3D
] call BIS_fnc_taskCreate;
*/

// Parent task for achievements
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
    true, // show notificaiton
    "whiteboard", // task icon
    false // makes task always visible in 3D
] call BIS_fnc_taskCreate;

// Perfect mission
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

// Worst mission
[
    west, // owner
    ["cheevo_worstScore", "tsk_parent_cheevos"], // task ID' ["subTask", "parentTask"]
    [
        "Fail all the most important tasks in the mission: <br/><br/>
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

// Ghost mission
[
    west, // owner
    ["cheevo_phantomTeam", "tsk_parent_cheevos"], // task ID' ["subTask", "parentTask"]
    [
        "Extract with the HVT’s credentials without raising the alarm.", // description
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

// Rescue
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

// radio tower
[
    west, // owner
    ["cheevo_radioTower", "tsk_parent_cheevos"], // task ID' ["subTask", "parentTask"]
    [
        "Find a way to disable the radio tower in Lumphat.", // description
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

// radio backpack
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

// prevent pilot downing
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
