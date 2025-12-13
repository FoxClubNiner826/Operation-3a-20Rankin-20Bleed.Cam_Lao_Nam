//////////////////////////////////////////////////
//                                              //
//          COMPLETE HVT TASK TRIGGER           //
//                                              //
//////////////////////////////////////////////////
// tested and working

_trg_complete_task_hvt = createTrigger [
    "EmptyDetector", // type
    objNull, // position
    false // makes global
];

private _condition_task_hvt = {
    missionNamespace getVariable ["hvtdead", false]
};

private _activation_task_hvt = {
    ["tsk_hvt","SUCCEEDED"] call BIS_fnc_taskSetState;
};

_trg_complete_task_hvt setTriggerStatements [
    toString _condition_task_hvt, // trigger condition
    toString _activation_task_hvt, // code ran on activation
    "" // code ran on deactivation
];

//////////////////////////////////////////////////
//                                              //
//           FAIL HVT TASK TRIGGER              //
//                                              //
//////////////////////////////////////////////////
// tested and working

_trg_fail_task_hvt = createTrigger [
    "EmptyDetector", // type
    [7113.45,9267.75], // position
    false // makes global
];

_trg_fail_task_hvt setTriggerArea [
    34.648,   // a-axis
    32.257,   // b-axis
    0,        // angle
    false,    // rectangular (false = ellipse)
    10        // activation height
];

_trg_fail_task_hvt setTriggerActivation [
    "ANY",   // who activates the trigger
    "PRESENT",// how trigger is it activated
    false      // Repeating
];

private _condition_fail_task_hvt = { 
   officer in thislist || 
   missionNamespace getVariable ["hvtExploded", false] 
};

private _activation_fail_task_hvt = {
    if (!(missionNamespace getVariable ["hvtExploded", false])) then {
        ["generalfled", [HQRadio, leader playergroup], true] remoteExec ["FoxClub_fnc_Conversation"];

        missionNamespace setVariable ["hvtFled", true, true];
        missionNamespace setVariable ["hvtFailed", true, true]; // for debrief convo
    };

    ["tsk_hvt","FAILED"] call BIS_fnc_taskSetState;
};

_trg_fail_task_hvt setTriggerStatements [
    toString _condition_fail_task_hvt, // trigger condition
    toString _activation_fail_task_hvt, // code ran on activation
    "" // code ran on deactivation
];


//////////////////////////////////////////////////
//                                              //
//          COMPLETE STAB TASK TRIGGER          //
//                                              //
//////////////////////////////////////////////////
// tested and working

// creates trigger
_trg_complete_task_stab = createTrigger [
    "EmptyDetector", // type
    objNull, // position
    false // makes global
];

// trigger condition
private _condition_task_stab = {
    !alive ptboat &&
    !(missionNamespace getVariable ["extractTaskSucceeded", false]) // makes sure that the stab is destroyed before extract is completed
};

// code ran on activation
private _activation_task_stab = {
    guard1 setBehaviour "AWARE";
    patrol2 setBehaviour "AWARE";
    patrol3 setBehaviour "AWARE";
    missionNamespace setVariable ["stabPassed", true, true]; // for debrief convo
    ["tsk_stab","SUCCEEDED"] call BIS_fnc_taskSetState;
};

_trg_complete_task_stab setTriggerStatements [
    toString _condition_task_stab, // trigger condition
    toString _activation_task_stab, // code ran on activation
    "" // code ran on deactivation
];

//////////////////////////////////////////////////
//                                              //
//           FAIL STAB TASK TRIGGER             //
//                                              //
//////////////////////////////////////////////////
// tested and working

_trg_fail_task_stab = createTrigger [
    "EmptyDetector", // type
    objNull, // position
    false // makes global
];

private _condition_fail_task_stab = { 
    alive ptboat && 
    (missionNamespace getVariable ["extractTaskSucceeded", false] || 
    missionNamespace getVariable ["extractTaskFailed", false]) 
};

private _activation_fail_task_stab = {
    ["tsk_stab","FAILED"] call BIS_fnc_taskSetState;
};

_trg_fail_task_stab setTriggerStatements [
    toString _condition_fail_task_stab, // trigger condition
    toString _activation_fail_task_stab, // code ran on activation
    "" // code ran on deactivation
];


//////////////////////////////////////////////////
//                                              //
//          COMPLETE LZ TASK TRIGGER            //
//                                              //
//////////////////////////////////////////////////
// tested and working on client

// creates trigger
foxClub_trg_complete_task_lz = createTrigger [
    "EmptyDetector", // type
    [8588.83,8193.74], // position
    false // makes global
];

// defines the size of the trigger
foxClub_trg_complete_task_lz setTriggerArea [
    41.409,   // a-axis
    59.285,   // b-axis
    46.138,        // angle
    false,    // rectangular (false = ellipse)
    10        // activation height
];

// defines how it is activated
foxClub_trg_complete_task_lz setTriggerActivation [
    "ANYPLAYER",   // who activates the trigger
    "PRESENT",// how trigger is it activated
    false      // Repeating
];

// trigger condition
private _condition_task_lz = {
    this
};

// code ran on activation
private _activation_task_lz = {
    // prevents extraction pilot from being shot down. will not delete it on off chance of player seeing it.
    {
        _x disableAI "ALL";
    } forEach crew samlauncher;

    ["tsk_lz","SUCCEEDED"] call BIS_fnc_taskSetState;
};

foxClub_trg_complete_task_lz setTriggerStatements [
    toString _condition_task_lz, // trigger condition
    toString _activation_task_lz, // code ran on activation
    "" // code ran on deactivation
];


//////////////////////////////////////////////////
//                                              //
//          COMPLETE UNDETECTED TRIGGER         //
//                                              //
//////////////////////////////////////////////////
// tested and working

// creates trigger
_trg_complete_task_undetected = createTrigger [
    "EmptyDetector", // type
    [7803.95,9096.57], // position
    false // makes global
];

// defines the size of the trigger
_trg_complete_task_undetected setTriggerArea [
    134.445,   // a-axis
    112.007,   // b-axis
    357.78,        // angle
    false,    // rectangular (false = ellipse)
    10        // activation height
];

// defines how it is activated
_trg_complete_task_undetected setTriggerActivation [
    "ANYPLAYER",   // who activates the trigger
    "PRESENT",// how trigger is it activated
    false      // Repeating
];

// trigger condition
private _condition_task_undetected = {
    this && !(missionNamespace getVariable ["playersSpotted", false])
};

// code ran on activation
private _activation_task_undetected = {
    missionNamespace setVariable ["aopassedVar", true, true];
    missionNamespace setVariable ["playersAtLumphat", true, true];

    ["tsk_undetected","SUCCEEDED"] call BIS_fnc_taskSetState;
};

_trg_complete_task_undetected setTriggerStatements [
    toString _condition_task_undetected, // trigger condition
    toString _activation_task_undetected, // code ran on activation
    "" // code ran on deactivation
];

//////////////////////////////////////////////////
//                                              //
//           FAIL UNDETECTED TRIGGER            //
//                                              //
//////////////////////////////////////////////////
// 

// creates trigger
_trg_fail_task_undetected = createTrigger [
    "EmptyDetector", // type
    objNull, // position
    false // makes global
];

// trigger condition
private _condition_fail_task_undetected = {
    missionNamespace getVariable ["PlayersSpotted", false] &&
    !(missionNamespace getVariable ["aopassedVar", false])
};

// code ran on activation
private _activation_fail_task_undetected = {
    officer setSpeedMode "FULL";
    missionNamespace setVariable ["fox_var_radioLoop", true, true];

    ["tsk_undetected","FAILED"] call BIS_fnc_taskSetState;
};

_trg_fail_task_undetected setTriggerStatements [
    toString _condition_fail_task_undetected, // trigger condition
    toString _activation_fail_task_undetected, // code ran on activation
    "" // code ran on deactivation
];


//////////////////////////////////////////////////
//                                              //
//       COMPLETE SEARCH LUMPHAT TRIGGER        //
//                                              //
//////////////////////////////////////////////////
// 

_trg_complete_task_search = createTrigger [
    "EmptyDetector", // type
    objNull, // position
    false // makes global
];

private _condition_task_search = {
    (missionNamespace getVariable ["cacheTask", false] || missionNamespace getVariable ["cacheTaskAlreadyDone", false]) &&  
    (missionNamespace getVariable ["gunboatTask", false] || missionNamespace getVariable ["gunboatTaskAlreadyDone", false]) &&  
    (missionNamespace getVariable ["samsiteTask", false] || missionNamespace getVariable ["samsiteTaskAlreadyDone", false])
};

private _activation_task_search = {
    deleteVehicle TOO_lumphat_canceled;
    [] spawn {

    _scout = missionNamespace getVariable ["scout", objNull]; 

    if (leader playerGroup == _scout) then {  
        ["scoutLumphatSearched", [_scout]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _scout <= 100}];  
    } else {  
        ["LumphatSearched", [leader playerGroup]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance leader playerGroup <= 100}];  
    };

    sleep 3;

    ["tsk_search","SUCCEEDED"] call BIS_fnc_taskSetState;
    };
};

_trg_complete_task_search setTriggerStatements [
    toString _condition_task_search, // trigger condition
    toString _activation_task_search, // code ran on activation
    "" // code ran on deactivation
];









