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
    missionNamespace getVariable ["AllSecTasksCompleteCheevo", false] && // in trigger OPT_all_pass_tgr
    missionNamespace getVariable ["foxClub_var_showAchievements", false] // located in init.sqf > debrief convo
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
    missionNamespace getVariable ["foxClub_var_completeAchievementWorst", false] // located in init.sqf > debrief convo
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

// if players feel this achievement is inconsistent or unfair because of trigger attached to the tracker module (blufor detected by opfor)
// then I will need to create a trigger like my players spotted by patrol that applies to all units that goes by knowsAbout command
private _conditionGhost = {
    !(missionNamespace getVariable ["foxClub_var_failAchievementGhost", false]) && // located in initServer.sqf > players spotted by patrol
    missionNamespace getVariable ["hvtPass", false] &&
    !(missionNamespace getVariable ["playersSpottedLumphat", false]) && // located in editor trigger: tracker spawn
    missionNamespace getVariable ["foxClub_var_showAchievements", false] // located in init.sqf > debrief convo  
};

private _activationGhost = {
    ["cheevo_phantomTeam","SUCCEEDED"] call BIS_fnc_taskSetState;
};

trgCompleteTaskGhost setTriggerStatements [
    toString _conditionGhost,
    toString _activationGhost,
    ""
];


//////////////////////////////////////////////////
//                                              //
//                RESCUE MISSION                //
//                                              //
//////////////////////////////////////////////////

trgCompleteTaskRescue = createTrigger [
    "EmptyDetector", // type
    objNull, // position
    false // makes global
];

private _conditionRescue = {
    missionNamespace getVariable ["foxClub_var_completeAchievementRescue", false] && // located in editor trigger: trg_heliRTB
    missionNamespace getVariable ["foxClub_var_showAchievements", false] // located in init.sqf > debrief convo  
};

private _activationRescue = {
    ["cheevo_rescueEffort","SUCCEEDED"] call BIS_fnc_taskSetState;
};

trgCompleteTaskRescue setTriggerStatements [
    toString _conditionRescue,
    toString _activationRescue,
    ""
];


//////////////////////////////////////////////////
//                                              //
//             DISABLE RADIO TOWER              //
//                                              //
//////////////////////////////////////////////////

trgCompleteTaskRadioTower = createTrigger [
    "EmptyDetector", // type
    objNull, // position
    false // makes global
];

private _conditionRadioTower = {
    missionNamespace getVariable ["comsdestroyed", false] && // located in initPlayerLocal.sqf > hold action for disabling comms
    missionNamespace getVariable ["foxClub_var_showAchievements", false] // located in init.sqf > debrief convo  
};

private _activationRadioTower = {
    ["cheevo_radioTower","SUCCEEDED"] call BIS_fnc_taskSetState;
};

trgCompleteTaskRadioTower setTriggerStatements [
    toString _conditionRadioTower,
    toString _activationRadioTower,
    ""
];


//////////////////////////////////////////////////
//                                              //
//               RADIO BACKPACK                 //
//                                              //
//////////////////////////////////////////////////

trgCompleteTaskRadioPack = createTrigger [
    "EmptyDetector", // type
    objNull, // position
    false // makes global
];

private _conditionRadioPack = {
    false;  
};

private _activationRadioPack = {
    ["cheevo_radioBackpack","SUCCEEDED"] call BIS_fnc_taskSetState;
};

trgCompleteTaskRadioPack setTriggerStatements [
    toString _conditionRadioPack,
    toString _activationRadioPack,
    ""
];


//////////////////////////////////////////////////
//                                              //
//           PREVENT PILOT DOWNING              //
//                                              //
//////////////////////////////////////////////////

trgCompleteTaskPreventDown = createTrigger [
    "EmptyDetector", // type
    objNull, // position
    false // makes global
];

private _conditionPreventDown = {
    missionNamespace getVariable ["foxClub_var_completeAchievementPreventDown", false] && // located in editor trigger: trg_pilot_not_shotdown
    missionNamespace getVariable ["foxClub_var_showAchievements", false] // located in init.sqf > debrief convo
};

private _activationPreventDown = {
    ["cheevo_preventDown","SUCCEEDED"] call BIS_fnc_taskSetState;
};

trgCompleteTaskPreventDown setTriggerStatements [
    toString _conditionPreventDown,
    toString _activationPreventDown,
    ""
];



