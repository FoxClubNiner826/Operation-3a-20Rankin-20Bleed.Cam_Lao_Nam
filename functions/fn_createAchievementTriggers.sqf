/*
    File: achievements.sqf
    Author: FoxClubNiner
    Description:
        Creates a task parent category and several tasks under it.
*/

/* hvt possibilities. for mid to work: mid and failed will have to be true. at least one of these is always true.

missionNamespace setVariable ["hvtPass", true, true]; // in holdAction for searching general
missionNamespace setVariable ["hvtMid", true, true]; // in EH of generals car. triggers with car blows up with him inside.
missionNamespace setVariable ["hvtFailed", true, true]; // in trigger once hvt reaches trigger area across the river

//stab possibilities. just need this one since its boolean check
missionNamespace setVariable ["stabPassed", true, true]; // in fail trigger for task "destroy the stab"

//extract possibilities
missionNamespace setVariable ["extractPassed", true, true]; // in complete trigger for task "extract from LZ"

//side task possibilities. no need for noSec since its default case
missionnamespace setVariable ["AllSecTasksComplete", true, true]; // in trigger trg_all_sec_pass
missionNamespace setVariable ["SomeSecTasksComplete", true, true]; // in trigger SomeSecTasksCompleteTrigger

//rescue possibilities
missionNamespace setVariable ["powFound", true, true]; // in trigger: trg_seesPow_convo
missionNamespace setVariable ["pilotFound", true, true]; // in trigger: save_pilot
missionNamespace setVariable ["powRescued", true, true]; // in ambulance EH
missionNamespace setVariable ["pilotRescued", true, true]; // in ambulance EH
missionNamespace setVariable ["powDied", true, true]; // in trigger: POWFail
missionNamespace setVariable ["pilotDied", true, true]; // in trigger: PilotFail

// for testing the ambulance EH
missionNamespace getVariable ["pilotEjected", false];
missionNamespace getVariable ["testPOW", false];
*/


//////////////////////////////////////////////////
//                                              //
//         PARENT TASK FOR ACHIEVEMENTS         //
//                                              //
//////////////////////////////////////////////////

trgCompleteParentTaskCheevo = createTrigger [
    "EmptyDetector", // type
    objNull, // position
    false // makes global
];

// add the getVars from all cheevo conditions here
private _conditionParentTask = {
    missionNamespace getVariable ["AllPriTasksComplete", false] && // in trigger PRI_all_pass_tgr
    missionNamespace getVariable ["AllSecTasksCompleteCheevo", false] // in trigger OPT_all_pass_tgr
};

private _activationParentTask = {
    ["tsk_parent_cheevos","SUCCEEDED"] call BIS_fnc_taskSetState;
};

trgCompleteParentTaskCheevo setTriggerStatements [
    toString _conditionParentTask,
    toString _activationParentTask,
    ""
];


//////////////////////////////////////////////////
//                                              //
//               PERFECT MISSION                //
//                                              //
//////////////////////////////////////////////////

trgCompleteTaskPerfect = createTrigger [
    "EmptyDetector", // type
    objNull, // position
    false // makes global
];

private _conditionPerfectMission = {
    missionNamespace getVariable ["AllPriTasksComplete", false] && // in trigger PRI_all_pass_tgr
    missionNamespace getVariable ["AllSecTasksCompleteCheevo", false] // in trigger OPT_all_pass_tgr
};

private _activationPerfectMission = {
    ["cheevo_perfectScore","SUCCEEDED"] call BIS_fnc_taskSetState;
};

trgCompleteTaskPerfect setTriggerStatements [
    toString _conditionPerfectMission,
    toString _activationPerfectMission,
    ""
];


//////////////////////////////////////////////////
//                                              //
//                WORST MISSION                 //
//                                              //
//////////////////////////////////////////////////

trgCompleteTaskWorst = createTrigger [
    "EmptyDetector", // type
    objNull, // position
    false // makes global
];

private _conditionWorst = {
    !(missionNamespace getVariable ["hvtPass", false]) &&
    !(missionNamespace getVariable ["stabPassed", false]) &&
    !(missionNamespace getVariable ["extractPassed", false]) &&
    missionNamespace getVariable ["foxClub_var_completeAchievementWorst", false] // located in
};

private _activationWorst = {
    ["cheevo_worstScore","SUCCEEDED"] call BIS_fnc_taskSetState;
};

trgCompleteTaskWorst setTriggerStatements [
    toString _conditionWorst,
    toString _activationWorst,
    ""
];


//////////////////////////////////////////////////
//                                              //
//                GHOST MISSION                 //
//                                              //
//////////////////////////////////////////////////

trgCompleteTaskGhost = createTrigger [
    "EmptyDetector", // type
    objNull, // position
    false // makes global
];

private _conditionGhost = {
    !(missionNamespace getVariable ["hvtPass", false]) &&
    !(missionNamespace getVariable ["stabPassed", false]) &&
    !(missionNamespace getVariable ["extractPassed", false]) &&
    missionNamespace getVariable ["ActionDebrief", false]
};

private _activationGhost = {
    ["cheevo_worstScore","SUCCEEDED"] call BIS_fnc_taskSetState;
};

trgCompleteTaskGhost setTriggerStatements [
    toString _conditionGhost,
    toString _activationGhost,
    ""
];

