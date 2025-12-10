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










/*
//////////////////////////////////////////////////
//                                              //
//          test          //
//                                              //
//////////////////////////////////////////////////
// tested and working

// creates trigger
_trg_complete_task_test = createTrigger [
    "EmptyDetector", // type
    [3012.53,3979.81], // position
    false // makes global
];

_trg_complete_task_test setTriggerArea [
    8.7,   // a-axis
    8.7,   // b-axis
    0,        // angle
    false,    // rectangular (false = ellipse)
    10        // activation height
];
_trg_complete_task_test setTriggerActivation ["WEST", "PRESENT", true];

_trg_complete_task_test setTriggerStatements ["this", "hint 'trigger on'", "hint 'trigger off'"];

/*
// trigger condition
private _condition_task_test = {
    commnad in thisList 
};

// code ran on activation
private _activation_task_test = {
    hint "fired";
};

_trg_complete_task_test setTriggerStatements [
    toString _condition_task_test, // trigger condition
    toString _activation_task_test, // code ran on activation
    "" // code ran on deactivation
];