/*
    File: initPlayerLocal.sqf
    Author: FoxClubNiner
    Description:
        Runs at mission start.
*/

//////////////////////////////////////////////////
//                                              //
//              CREATES BRIEFING                //
//                                              //
//////////////////////////////////////////////////

if ((!isServer) && (player != player)) then
{
  waitUntil {player == player};
};
_null = [] execVM "diary.sqf";


//////////////////////////////////////////////////
//                                              //
//         OVERRIDES MULTIPLAYER FACES          //
//                                              //
//////////////////////////////////////////////////

if (!isNil "scout" && {player isEqualTo scout}) then { //these replace profile faces with mission faces
    [player , "vn_o_vietnamese_01_01_face_04"] remoteExec ["setFace", 0, player];
};
if (!isNil "command" && {player isEqualTo command}) then {
    [player , "vn_b_LivonianHead_8_06"] remoteExec ["setFace", 0, player];
};
if (!isNil "gren2" && {player isEqualTo gren2}) then {
    [player , "vn_b_GreekHead_A3_06_01"] remoteExec ["setFace", 0, player];
};
if (!isNil "mg1" && {player isEqualTo mg1}) then {
    [player , "vn_b_WhiteHead_19_10"] remoteExec ["setFace", 0, player];
};
if (!isNil "demo" && {player isEqualTo demo}) then {
    [player , "vn_b_WhiteHead_28_11"] remoteExec ["setFace", 0, player];
};
if (!isNil "medic" && {player isEqualTo medic}) then {
    [player , "vn_b_GreekHead_A3_06_05"] remoteExec ["setFace", 0, player];
};
if (!isNil "rto" && {player isEqualTo rto}) then {
    [player , "vn_b_WhiteHead_20_03"] remoteExec ["setFace", 0, player];
};
if (!isNil "mg2" && {player isEqualTo mg2}) then {
    [player , "vn_b_TanoanHead_A3_05_06"] remoteExec ["setFace", 0, player];
};


//////////////////////////////////////////////////
//                                              //
//         REMOVE HOLDACTIONS ON DEATH          //
//                                              //
//////////////////////////////////////////////////

// removes addaction from dead bodies. this makes sure there are no duplicate addactions on players too
player addEventHandler ["Killed", {
    removeAllActions (_this select 0); //not removing detonate addaction. maybe cause its nested in hold action? intermittant.
	//missionNamespace getvariable ["weaponCacheActionID", false]
    [weaponcache, missionNamespace getvariable ["weaponCacheActionID", false]] call BIS_fnc_holdActionRemove;
    [foodcache, missionNamespace getvariable ["foodCacheActionID", false]] call BIS_fnc_holdActionRemove;
    //[weaponcache, _weaponCacheActionID] call BIS_fnc_holdActionRemove;
	//[foodcache, _foodCacheActionID] call BIS_fnc_holdActionRemove;
	//removeAllActions weaponcache; //now its not removing holdaction. also intermittant
	//removeAllActions foodcache; //now its not removing holdaction. also intermittant
}];


//////////////////////////////////////////////////
//                                              //
//             SEAL BOSS QUESTIONS              //
//                                              //
//////////////////////////////////////////////////

// Question 1
Marcinko addAction [
    "<t color='#FFFF00'>""Could this be a trap?""</t>", //what addaction is displayed as
    {
    missionNamespace setVariable ["ActionTalkToMarcinko1", false, true]; //removes the used addAction 
	
	params ["_target", "_caller", "_actionID", "_args"]; //needed for finding player that made the action    
	["question1", [_caller, _target]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _target <= 100}]; 
	}, 
    nil, 
    8, 
    false, 
    true, 
    "", 
    "!(_this in [scout]) && ActionTalkToMarcinko1 && !(_originalTarget getVariable ['foxclub_var_isTalking',false])", //makes action available: ActionTalkToMarcinko1 && AllowActionTalk
	4 //radius of addadction
];


// Question 2
Marcinko addAction [
    "<t color='#FFFF00'>""Can we really trust the Carson?""</t>", 
    {
    missionNamespace setVariable ["ActionTalkToMarcinko2", false, true]; 
    
	params ["_target", "_caller", "_actionID", "_args"];    
	["question2", [_caller, _target]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _target <= 100}];

	0 spawn {
  			sleep 10;
  			missionNamespace setVariable ["ActionTalkToCarson",true,true];
		}; 
	}, 
    nil, 
    8, 
    false, 
    true, 
    "", 
    "!(_this in [scout]) && ActionTalkToMarcinko2 && !(_originalTarget getVariable ['foxclub_var_isTalking',false])", 
	4 
];

// Question 3
Marcinko addAction [
    "<t color='#FFFF00'>""Why not use an Archlight instead?""</t>", 
    { 
    missionNamespace setVariable ["ActionTalkToMarcinko3", false, true]; 
    
	params ["_target", "_caller", "_actionID", "_args"]; 
	["question3", [_caller, _target]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _target <= 100}]; 
	}, 
    nil, 
    8, 
    false, 
    true, 
    "", 
    "!(_this in [scout]) && ActionTalkToMarcinko3 && !(_originalTarget getVariable ['foxclub_var_isTalking',false])",
	4
];

// Question 4
Marcinko addAction [
    "<t color='#FFFF00'>""Why use the STAB?""</t>", 
    { 
    missionNamespace setVariable ["ActionTalkToMarcinko4", false, true]; 
    
	params ["_target", "_caller", "_actionID", "_args"]; 
	["question4", [_caller, _target]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _target <= 100}];
	}, 
    nil, 
    8, 
    false, 
    true, 
    "", 
    "!(_this in [scout]) && ActionTalkToMarcinko4 && !(_originalTarget getVariable ['foxclub_var_isTalking',false])",
	4
];

// Question 5
Marcinko addAction [
    "<t color='#FFFF00'>""Who is General Tan?""</t>", 
    { 
    missionNamespace setVariable ["ActionTalkToMarcinko5", false, true]; 
    
	params ["_target", "_caller", "_actionID", "_args"]; 
	["question5", [_caller, _target]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _target <= 100}];
	}, 
    nil, 
    8, 
    false, 
    true, 
    "", 
    "!(_this in [scout]) && ActionTalkToMarcinko5 && !(_originalTarget getVariable ['foxclub_var_isTalking',false])", 
	4 
];

// Question 6
Marcinko addAction [
    "<t color='#FFFF00'>""Should we Capture Tan instead?""</t>", 
    { 
    missionNamespace setVariable ["ActionTalkToMarcinko6", false, true]; 
    
	params ["_target", "_caller", "_actionID", "_args"]; 
	["question6", [_caller, _target]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _target <= 100}];
	}, 
    nil, 
    8, 
    false, 
    true, 
    "", 
    "!(_this in [scout]) && ActionTalkToMarcinko6 && !(_originalTarget getVariable ['foxclub_var_isTalking',false])",
	4
];

// Question 7
Marcinko addAction [
    "<t color='#FFFF00'>""How good is the intel?""</t>", 
    { 
    missionNamespace setVariable ["ActionTalkToMarcinko7", false, true]; 
    
	params ["_target", "_caller", "_actionID", "_args"]; 
	["question7", [_caller, _target]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _target <= 100}];
	}, 
    nil, 
    8, 
    false, 
    true, 
    "", 
    "!(_this in [scout]) && ActionTalkToMarcinko7 && !(_originalTarget getVariable ['foxclub_var_isTalking',false])", 
	4 
];

// Question 8
scout addAction [
    "<t color='#FFFF00'>""So, you're our carson?""</t>", 
    { 
	missionNamespace setVariable ["ActionTalkToCarson", false, true];
    
	params ["_target", "_caller", "_actionID", "_args"]; 
	["question8", [_caller, _target]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _target <= 100}];
	}, 
    nil, 
    8, 
    false, 
    true, 
    "", 
    "_target != _this && ActionTalkToCarson && !(_originalTarget getVariable ['foxclub_var_isTalking',false])",
	4
];

// Question 9
_scout  = missionNamespace getVariable ["scout", objNull];
Marcinko addAction [
    "<t color='#FFFF00'>""I ready, Captain.""</t>", 
    { 
	missionNamespace setVariable ["ActionTalkToMarcinko9", false, true];
    
	params ["_target", "_caller", "_actionID", "_args"]; 
	["question9", [_caller, _target]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _target <= 100}];
	}, 
    nil, 
    8, 
    false, 
    true, 
    "", 
    "_this in [scout] && ActionTalkToMarcinko9 && !(_originalTarget getVariable ['foxclub_var_isTalking',false])",
	4
];


//////////////////////////////////////////////////
//                                              //
//          HOLD ACTION SKIP TO INFIL           //
//                                              //
//////////////////////////////////////////////////

[
	ptboat,
	"<t color='#FFFF00'>Skip to the Infiltration Point</t>",
	"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa", //idle icon 
	"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa", //progress icon
	"isNil 'skipToInfil' && (allPlayers - crew ptboat) isEqualTo []", //condition, use this for any player in boat in the init field _this in (crew _target)
	"true", //condition progress
	{}, //code on start
	{}, // code every tick
	{
		missionNamespace setVariable ["skipToInfil", false, true]; 
		["scripts\SkiptoIngress.sqf"] remoteExec ["execVM", 0];
	}, // code on finish
	{}, // code on interuption
	[], //arguements
	3, //duration
	8, //order from top
	true, //remove on finish
	false, //show if unconcious
	false //show in middle of screen
] call BIS_fnc_holdActionAdd;


//////////////////////////////////////////////////
//                                              //
//         HOLD ACTION FOR EQUIP SCUBA          //
//                                              //
//////////////////////////////////////////////////

scubaEquipped = false; //lets player equip scuba when its ready

[
	ptboat,
	"<t color='#FFFF00'>Equip SCUBA Gear</t>",
	"a3\missions_f_oldman\data\img\holdactions\holdAction_box_ca.paa", //idle icon 
	"a3\missions_f_oldman\data\img\holdactions\holdAction_box_ca.paa", //progress icon
	"_this in (crew _target) && !scubaEquipped && ActionSCUBA", 
	"true", //condition progress
	{}, //code on start
	{}, // code every tick
	{
		params ["_target", "_caller", "_actionID", "_args"];
        if (_caller == missionNamespace getVariable ["scout", objNull]) then {
			["scubatimeScout", [_caller]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];
		} else {
			[selectRandom ["scubatime1", "scubatime2", "scubatime3"], [_caller]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];
		};
        execVM "scripts\scubagear.sqf";
	}, // code on finish
	{}, // code on interuption
	[], //arguements
	3, //duration
	8, //order from top
	false, //remove on finish
	false, //show if unconcious
	false //show in middle of screen
] call BIS_fnc_holdActionAdd;


//////////////////////////////////////////////////
//                                              //
//        HOLD ACTION FOR EQUIP LOADOUT         //
//                                              //
//////////////////////////////////////////////////

[
	ptboat,
	"<t color='#FFFF00'>Equip Loadout Gear</t>",
	"a3\missions_f_oldman\data\img\holdactions\holdAction_box_ca.paa", //idle icon 
	"a3\missions_f_oldman\data\img\holdactions\holdAction_box_ca.paa", //progress icon
	"_this in (crew _target) && scubaEquipped", //condition //triggerActivated wait_pass || triggeractivated wait_fail
	"true", //condition progress
	{}, //code on start
	{}, // code every tick
	{
		params ["_target", "_caller", "_actionID", "_args"];
        if (_caller == missionNamespace getVariable ["scout", objNull]) then {
			["gearupScout", [_caller]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];
		} else {
			[selectRandom ["gearup1", "gearup2", "gearup3"], [_caller]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];
		};
        execVM "scripts\loadoutgear.sqf";
	}, // code on finish
	{}, // code on interuption
	[], //arguements
	3, //duration
	8, //order from top
	false, //remove on finish
	false, //show if unconcious
	false //show in middle of screen
] call BIS_fnc_holdActionAdd;


//////////////////////////////////////////////////
//                                              //
//        HOLD ACTION FOR STAB TIME-BOMB        //
//                                              //
//////////////////////////////////////////////////

private _conditionC4 = {
    (missionNamespace getVariable ['ActionSTABTimeBombs', false]) && (vehicle _this != _target)
};

[
	ptboat,
	"<t color='#FFFF00'>Place C-4 Plastic Explosive: 15 Minutes</t>",
	"a3\ui_f_oldman\data\igui\cfg\holdactions\destroy_ca.paa", //idle icon 
	"a3\ui_f_oldman\data\igui\cfg\holdactions\destroy_ca.paa", //progress icon
	toString _conditionC4,
	"true", //condition progress
	{
        params ["_target", "_caller", "_actionID", "_args"];
        if (_caller == missionNamespace getVariable ["scout", objNull]) then {
			["bomb15Scout", [_caller]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];
		} else {
			["bomb15", [_caller]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];
		};
    }, //code on start
	{}, // code every tick
	{
        params ["_target", "_caller", "_actionID", "_args"];
        if (_caller == missionNamespace getVariable ["scout", objNull]) then {
			["bombplantedScout", [_caller]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];
		} else {
			["bombplanted", [_caller]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];
		};
		missionNamespace setVariable ["ActionSTABTimeBombs", false, true];
        playSound3D [getMissionPath "sound\PlaceBomb.ogg", getPosASL ptboat, false, ptboat, 3];
        ["scripts\bomb.sqf"] remoteExec ["execVM", 2];
	}, // code on finish
	{}, // code on interuption
	[], //arguements
	3, //duration
	8, //order from top
	false, //remove on finish
	false, //show if unconcious
	false //show in middle of screen
] call BIS_fnc_holdActionAdd;

[
	ptboat,
	"<t color='#FFFF00'>Place C-4 Plastic Explosive: 30 Minutes</t>",
	"a3\ui_f_oldman\data\igui\cfg\holdactions\destroy_ca.paa", //idle icon 
	"a3\ui_f_oldman\data\igui\cfg\holdactions\destroy_ca.paa", //progress icon
	toString _conditionC4,
	"true", //condition progress
	{
        params ["_target", "_caller", "_actionID", "_args"];
        if (_caller == missionNamespace getVariable ["scout", objNull]) then {
			["bomb30Scout", [_caller]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];
		} else {
			["bomb30", [_caller]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];
		};
    }, //code on start
	{}, // code every tick
	{
        params ["_target", "_caller", "_actionID", "_args"];
        if (_caller == missionNamespace getVariable ["scout", objNull]) then {
			["bombplantedScout", [_caller]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];
		} else {
			["bombplanted", [_caller]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];
		};
		missionNamespace setVariable ["ActionSTABTimeBombs", false, true];
        playSound3D [getMissionPath "sound\PlaceBomb.ogg", getPosASL ptboat, false, ptboat, 3];
        ["scripts\bomb2.sqf"] remoteExec ["execVM", 2];
	}, // code on finish
	{}, // code on interuption
	[], //arguements
	3, //duration
	8, //order from top
	false, //remove on finish
	false, //show if unconcious
	false //show in middle of screen
] call BIS_fnc_holdActionAdd;

[
	ptboat,
	"<t color='#FFFF00'>Place C-4 Plastic Explosive: 45 Minutes</t>",
	"a3\ui_f_oldman\data\igui\cfg\holdactions\destroy_ca.paa", //idle icon 
	"a3\ui_f_oldman\data\igui\cfg\holdactions\destroy_ca.paa", //progress icon
	toString _conditionC4,
	"true", //condition progress
	{
        params ["_target", "_caller", "_actionID", "_args"];
        if (_caller == missionNamespace getVariable ["scout", objNull]) then {
			["bomb45Scout", [_caller]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];
		} else {
			["bomb45", [_caller]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];
		};
    }, //code on start
	{}, // code every tick
	{
        params ["_target", "_caller", "_actionID", "_args"];
        if (_caller == missionNamespace getVariable ["scout", objNull]) then {
			["bombplantedScout", [_caller]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];
		} else {
			["bombplanted", [_caller]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];
		};
		missionNamespace setVariable ["ActionSTABTimeBombs", false, true];
        playSound3D [getMissionPath "sound\PlaceBomb.ogg", getPosASL ptboat, false, ptboat, 3];
        ["scripts\bomb3.sqf"] remoteExec ["execVM", 2];
	}, // code on finish
	{}, // code on interuption
	[], //arguements
	3, //duration
	8, //order from top
	false, //remove on finish
	false, //show if unconcious
	false //show in middle of screen
] call BIS_fnc_holdActionAdd;


//////////////////////////////////////////////////
//                                              //
//          HOLD ACTION DISABLING COMMS         //
//                                              //
//////////////////////////////////////////////////

private _conditionComms = {
    _this distance _target < 3
};

[
	generator,
	"<t color='#FFFF00'>Sabotage Communications Equipment</t>",
	"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\destroy_ca.paa", //idle icon 
	"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\destroy_ca.paa", //progress icon
	toString _conditionComms, //condition
	"true", //condition progress
	{
		params ["_target", "_caller", "_actionID", "_args"];
        if (_caller == missionNamespace getVariable ["scout", objNull]) then {
			["commsdestroyScout", [_caller]] remoteExec [
                "FoxClub_fnc_Conversation", 
                allPlayers select {_x distance _caller <= 100}];
		} else {
			["commsdestroy", [_caller]] remoteExec [
                "FoxClub_fnc_Conversation", 
                allPlayers select {_x distance _caller <= 100}];
		};
	}, //code on start
	{}, // code every tick
	{
		params ["_target", "_caller", "_actionID", "_args"];
        if (_caller == missionNamespace getVariable ["scout", objNull]) then {
			["commsoffScout", [_caller, covey]] remoteExec [
                "FoxClub_fnc_Conversation", 
                allPlayers select {_x distance _caller <= 100}];
		} else {
			["commsoff", [_caller]] remoteExec [
                "FoxClub_fnc_Conversation", 
                allPlayers select {_x distance _caller <= 100}];
		};
        missionNamespace setVariable ["comsdestroyed", true, true];
	}, // code on finish
	{}, // code on interuption
	[], //arguements
	5, //duration
	8, //order from top
	true, //remove on finish
	false, //show if unconcious
	false //show in middle of screen
] call BIS_fnc_holdActionAdd;


//////////////////////////////////////////////////
//                                              //
//      HOLD ACTION FOR SEARCHING GENERAL       //
//                                              //
//////////////////////////////////////////////////

private _conditionGeneral = {
    _this distance _target < 2 && !alive officer
};

[
	officer,
	"<t color='#FFFF00'>Search Body for Identification</t>",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa", //idle icon 
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa", //progress icon
	toString _conditionGeneral, //condition
	"true", //condition progress
	{
		params ["_target", "_caller", "_actionID", "_args"];
        if (_caller == missionNamespace getVariable ["scout", objNull]) then {
			["papersScout", [_caller]] remoteExec [
                "FoxClub_fnc_Conversation", 
                allPlayers select {_x distance _caller <= 100}];
		} else {
			[selectRandom ["papers1", "papers2", "papers3"], [_caller]] remoteExec [
                "FoxClub_fnc_Conversation", 
                allPlayers select {_x distance _caller <= 100}];
		};
	}, //code on start
	{}, // code every tick
	{
		params ["_target", "_caller", "_actionID", "_args"];
        if (_caller == missionNamespace getVariable ["scout", objNull]) then {
			["bingoScout", [_caller, covey]] remoteExec [
                "FoxClub_fnc_Conversation", 
                allPlayers select {_x distance _caller <= 100}];
		} else {
			["bingo", [_caller, covey]] remoteExec [
                "FoxClub_fnc_Conversation", 
                allPlayers select {_x distance _caller <= 100}];
		};
        missionNamespace setVariable ["hvtdead", true, true];
	}, // code on finish
	{}, // code on interuption
	[], //arguements
	5, //duration
	8, //order from top
	true, //remove on finish
	false, //show if unconcious
	false //show in middle of screen
] call BIS_fnc_holdActionAdd;


//////////////////////////////////////////////////
//                                              //
// HOLD ACTION FOR SEARCHABLE ITEMS IN LUMPHAT  //
//                                              //
//////////////////////////////////////////////////

private _conditionItems = {
    _this distance _target < 3
};

// List of objects, percent modifier, and holdAction title
private _objectsWithModifiers = [
    [obj11, 0.05, "<t color='#FFFF00'>Search Body for Intel</t>"],  // 5% per attempt (bodies)
    [obj12, 0.05, "<t color='#FFFF00'>Search Body for Intel</t>"],
    [obj13, 0.05, "<t color='#FFFF00'>Search Body for Intel</t>"],
    [obj14, 0.05, "<t color='#FFFF00'>Search Body for Intel</t>"],
    [obj15, 0.05, "<t color='#FFFF00'>Search Body for Intel</t>"],
    [obj16, 0.05, "<t color='#FFFF00'>Search Body for Intel</t>"],
    [obj3, 0.10, "<t color='#FFFF00'>Search Folder for Intel</t>"],  // 10% per attempt (folders)
    [obj4, 0.10, "<t color='#FFFF00'>Search Folder for Intel</t>"],  
    [obj5, 0.075, "<t color='#FFFF00'>Search Locker for Intel</t>"],  // 7.5% per attempt (lockers)
    [obj6, 0.075, "<t color='#FFFF00'>Search Locker for Intel</t>"],  
    [obj7, 0.15, "<t color='#FFFF00'>Search File Cabinet for Intel</t>"],  // 15% per attempt (file cabinets)
    [obj8, 0.15, "<t color='#FFFF00'>Search File Cabinet for Intel</t>"],  
    [obj9, 0.05, "<t color='#FFFF00'>Search Vehicle for Intel</t>"],  // 5% per attempt (cars)
    [obj10, 0.05, "<t color='#FFFF00'>Search Vehicle for Intel</t>"]   
];

{
    // Used to swap out different objects so I only have to have one holdAction code block
    private _object = _x select 0;
    private _modifier = _x select 1;
    private _title = _x select 2;

    [
	_object, //object
	_title, //title
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa", //idle icon 
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa", //progress icon
	toString _conditionItems, //condition
	"true", //condition progress
	{
        params ["_target", "_caller", "_actionId", "_arguments"];
        _this call FoxClub_fnc_intelSearch; 
    }, //code on start
	{}, // code every tick
	{
		// This runs after the holdAction has been completed
        params ["_target", "_caller", "_actionId", "_arguments"];
        _scout = missionNamespace getVariable ["scout", objNull]; //prevents errors if noone is play scout
        private _modifier = _arguments select 0;   // << grab modifier

        // Remove action for all players once hold action is complete
        [_target, _actionId] remoteExec ["BIS_fnc_holdActionRemove", 0, _target];
        
        // Increase attempt count
        private _attemptCount = missionNamespace getVariable ["holdActionAttemptCount", 0];
        _attemptCount = _attemptCount + 1;
        missionNamespace setVariable ["holdActionAttemptCount", _attemptCount, true];
        //[format ["Attempt Count: %1", _attemptCount]] remoteExec ["systemChat"]; //for debug

        // Calculate chance based on multiplier. More attempts increase the chance of success.
        private _chance = _attemptCount * _modifier * 100; // Adjust the chance based on multiplier
        private _randomRoll = random 100;
        //[format ["Chance: %1%%", _chance]] remoteExec ["systemChat"]; //for debug

        // Check if intel was found. If yes, then run the code below.
        if (_randomRoll < _chance) then {
            
            // make sure created side tasks are randomized and complete a task if it was done before the task was created
            private _tasks = ["cacheTaskPool", "gunboatTaskPool", "samsiteTaskPool"] select {!(missionNamespace getVariable [_x, false])};
            if (_tasks isNotEqualTo []) then {
                private _selectedTask = selectRandom _tasks;
                _tasks = _tasks - [_selectedTask];
                //systemChat _selectedTask; // for debugging
                if (_selectedTask == "gunboatTaskPool") then {
                    if (missionNamespace getvariable ["gunboatDestroyed", false]) then {
				        missionNamespace setVariable ["gunboatTaskAlreadyDone", true, true]; //creates and completes the task
                        missionNamespace setVariable ["gunboatTaskPool", true, true]; // removes task from pool so it isnt chosen twice
                        _this call FoxClub_fnc_intelAlreadyDone; 
				    } else {
                        missionNamespace setVariable ["gunboatTask", true, true]; // creates the task
                        missionNamespace setVariable ["gunboatTaskPool", true, true]; // removes task from pool so it isnt chosen twice
                        _this call FoxClub_fnc_intelFound; // plays lines after task is created
                    };
                };
                if (_selectedTask == "samsiteTaskPool") then {
                    if (missionNamespace getvariable ["samsiteDestroyed", false]) then {
				        missionNamespace setVariable ["samsiteTaskAlreadyDone", true, true];
                        missionNamespace setVariable ["samsiteTaskPool", true, true];
                        _this call FoxClub_fnc_intelAlreadyDone;
				    } else {
                        missionNamespace setVariable ["samsiteTask", true, true];
                        missionNamespace setVariable ["samsiteTaskPool", true, true];
                        _this call FoxClub_fnc_intelFound;
                    };
                };
                if (_selectedTask == "cacheTaskPool") then {
                    if (missionNamespace getvariable ["weaponsCacheDestroyed", false] && missionNamespace getvariable ["foodCacheDestroyed", false]) then {
				        missionNamespace setVariable ["cacheTaskAlreadyDone", true, true];
                        missionNamespace setVariable ["cacheTaskPool", true, true];
                        _this call FoxClub_fnc_intelAlreadyDone;
				    } else {
                        missionNamespace setVariable ["cacheTask", true, true];
                        missionNamespace setVariable ["cacheTaskPool", true, true];
                        _this call FoxClub_fnc_intelFound;
                    };
                };
            };

            // Remove all holdActions if no tasks remain 
            if (_tasks isEqualTo []) then {
                private _objects = [obj3, obj4, obj5, obj6, obj7, obj8, obj9, obj10, obj11, obj12, obj13, obj14, obj15, obj16];
                { [_x, _actionId] remoteExec ["BIS_fnc_holdActionRemove", 0, _x]; } forEach _objects;
            };

            // Sends reinforcements to Lumphat if players were spotted by OPFOR in set area AND at least one side task was found.
            if (missionNamespace getVariable ["playersSpottedLumphat", false] && !(missionNamespace getVariable ["reinforcements", false])) then {
                missionNamespace setVariable ["reinforcements", true, true];
            };
            // if the roll doesn't suceed then run the code below.
        } else {
            [_caller] call FoxClub_fnc_intelNotFound;
        };
	}, // code on finish
	{}, // code on interuption
	[_modifier, _title], //arguements
	5, //duration
	8, //order from top
	true, //remove on finish
	false, //show if unconcious
	false //show in middle of screen
    ] call BIS_fnc_holdActionAdd;

} forEach _objectsWithModifiers;


//////////////////////////////////////////////////
//                                              //
//            DOWNED PILOT QUESTIONS            //
//                                              //
//////////////////////////////////////////////////

pilot addAction [
    "<t color='#FFFF00'>""Who are you?""</t>", 
    {
	missionNamespace setVariable ["ActionTalkToPilot2", false, true];
	params ["_target", "_caller", "_actionID", "_args"];
    _scout = missionNamespace getVariable ["scout", objNull];    
	private _convo = ["askpilot1", "askpilot1Scout"] select (_caller == _scout); 
    [_convo, [_caller, _target]] remoteExec [ 
        "FoxClub_fnc_Conversation",     
        allPlayers select { _x distance _caller <= 100 }     
    ];
	}, 
    nil, 
    8, 
    false, 
    true, 
    "", 
    "!(_originalTarget getVariable ['foxclub_var_isTalking',false]) && ActionTalkToPilot2", 
	4 
];

pilot addAction [
    "<t color='#FFFF00'>""Are you hurt?""</t>", 
    {
	missionNamespace setVariable ["ActionTalkToPilot3", false, true];
	params ["_target", "_caller", "_actionID", "_args"];
    _scout = missionNamespace getVariable ["scout", objNull];   
	private _convo = ["askpilot2", "askpilot2Scout"] select (_caller == _scout); 
    [_convo, [_caller, _target]] remoteExec [ 
        "FoxClub_fnc_Conversation",     
        allPlayers select { _x distance _caller <= 100 }     
    ];
	}, 
    nil, 
    8, 
    false, 
    true, 
    "", 
    "!(_originalTarget getVariable ['foxclub_var_isTalking',false]) && ActionTalkToPilot3", 
	4 
];

pilot addAction [
    "<t color='#FFFF00'>""What was your mission?""</t>", 
    {
	missionNamespace setVariable ["ActionTalkToPilot4", false, true];
	params ["_target", "_caller", "_actionID", "_args"];
    _scout = missionNamespace getVariable ["scout", objNull];   
	private _convo = ["askpilot3", "askpilot3Scout"] select (_caller == _scout); 
    [_convo, [_caller, _target]] remoteExec [ 
        "FoxClub_fnc_Conversation",     
        allPlayers select { _x distance _caller <= 100 }     
    ];
	}, 
    nil, 
    8, 
    false, 
    true, 
    "", 
    "!(_originalTarget getVariable ['foxclub_var_isTalking',false]) && ActionTalkToPilot4", 
	4 
];


//////////////////////////////////////////////////
//                                              //
//               POW QUESTIONS                  //
//                                              //
//////////////////////////////////////////////////

pow addAction [
    "<t color='#FFFF00'>""Who are you?""</t>", 
    {
	missionNamespace setVariable ["ActionTalkToPOW1", false, true];
	params ["_target", "_caller", "_actionID", "_args"];
    _scout = missionNamespace getVariable ["scout", objNull];    
	private _convo = ["askpow1", "askpow1Scout"] select (_caller == _scout); 
    [_convo, [_caller, _target]] remoteExec [ 
        "FoxClub_fnc_Conversation",     
        allPlayers select { _x distance _caller <= 100 }
        ];
	}, 
    nil, 
    8, 
    false, 
    true, 
    "", 
    "!(_originalTarget getVariable ['foxclub_var_isTalking',false]) && ActionTalkToPOW1", 
	4 
];

pow addAction [
    "<t color='#FFFF00'>""What happened?""</t>", 
    {
	missionNamespace setVariable ["ActionTalkToPOW2", false, true];
	params ["_target", "_caller", "_actionID", "_args"];
    _scout = missionNamespace getVariable ["scout", objNull];    
	private _convo = ["askpow2", "askpow2Scout"] select (_caller == _scout); 
    [_convo, [_caller, _target]] remoteExec [ 
        "FoxClub_fnc_Conversation",     
        allPlayers select { _x distance _caller <= 100 }
        ];
	}, 
    nil, 
    8, 
    false, 
    true, 
    "", 
    "!(_originalTarget getVariable ['foxclub_var_isTalking',false]) && ActionTalkToPOW2", 
	4 
];

pow addAction [
    "<t color='#FFFF00'>""Been here long?""</t>", 
    {
	missionNamespace setVariable ["ActionTalkToPOW3", false, true];
	params ["_target", "_caller", "_actionID", "_args"];
    _scout = missionNamespace getVariable ["scout", objNull];    
	private _convo = ["askpow3", "askpow3Scout"] select (_caller == _scout); 
    [_convo, [_caller, _target]] remoteExec [ 
        "FoxClub_fnc_Conversation",     
        allPlayers select { _x distance _caller <= 100 }
        ];
	}, 
    nil, 
    8, 
    false, 
    true, 
    "", 
    "!(_originalTarget getVariable ['foxclub_var_isTalking',false]) && ActionTalkToPOW3", 
	4 
];

pow addAction [
    "<t color='#FFFF00'>""How was it?""</t>", 
    {
	missionNamespace setVariable ["ActionTalkToPOW4", false, true];
	params ["_target", "_caller", "_actionID", "_args"];
    _scout = missionNamespace getVariable ["scout", objNull];    
	private _convo = ["askpow4", "askpow4Scout"] select (_caller == _scout); 
    [_convo, [_caller, _target]] remoteExec [ 
        "FoxClub_fnc_Conversation",     
        allPlayers select { _x distance _caller <= 100 }
        ];
	}, 
    nil, 
    8, 
    false, 
    true, 
    "", 
    "!(_originalTarget getVariable ['foxclub_var_isTalking',false]) && ActionTalkToPOW4", 
	4 
];

pow addAction [
    "<t color='#FFFF00'>""Your leg...""</t>", 
    {
	missionNamespace setVariable ["ActionTalkToPOW5", false, true];
	params ["_target", "_caller", "_actionID", "_args"];
    _scout = missionNamespace getVariable ["scout", objNull];    
	private _convo = ["askpow5", "askpow5Scout"] select (_caller == _scout); 
    [_convo, [_caller, _target]] remoteExec [ 
        "FoxClub_fnc_Conversation",     
        allPlayers select { _x distance _caller <= 100 }
        ];
	}, 
    nil, 
    8, 
    false, 
    true, 
    "", 
    "!(_originalTarget getVariable ['foxclub_var_isTalking',false]) && ActionTalkToPOW5", 
	4 
];


//////////////////////////////////////////////////
//                                              //
//     INFINITE SMOKE AND CONVO FOR LZ TASK     //
//                                              //
//////////////////////////////////////////////////

// Adds EH to player if smokeThrown doesn't exist.
if (isNil "SmokeThrown") then {
    player addEventHandler ["FiredMan", {
        params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle"];

        // Removes EH if smokeThrown is defined.
        if (missionNamespace getVariable ["SmokeThrown", false] || missionNamespace getVariable ["smokeFailed", false]) exitWith {
            _unit removeEventHandler [_thisEvent, _thisEventHandler];
        };

        // Handle each type of smoke grenade
        if ("vn_m18_purple_mag" in _magazine && _unit inArea "Grenade_Marker" && missionNamespace getVariable ["ExtractConvo", false]) then {
            [_projectile] spawn {
                params ["_thrownSmoke"];
                waitUntil {uiSleep 1; abs (speed _thrownSmoke) == 0};
                if !(_thrownSmoke inArea "Grenade_Marker") exitWith {};
                _smokeEmitter = "SmokeShellPurple_Infinite" createVehicle getPos _thrownSmoke;
            };
            missionNamespace setVariable ["SmokeThrown", true, true];
            [] spawn {
                sleep 20;
				["smokegrape", [ranger]] remoteExec ["FoxClub_fnc_Conversation"];
                missionNamespace setVariable ["ActionConfirmSmoke", true, true];
            };
        };

        if ("vn_m18_red_mag" in _magazine && _unit inArea "Grenade_Marker" && missionNamespace getVariable ["ExtractConvo", false]) then {
            [_projectile] spawn {
                params ["_thrownSmoke"];
                waitUntil {uiSleep 1; abs (speed _thrownSmoke) == 0};
                if !(_thrownSmoke inArea "Grenade_Marker") exitWith {};
                _smokeEmitter = "SmokeShellRed_Infinite" createVehicle getPos _thrownSmoke;
            };
            missionNamespace setVariable ["SmokeThrown", true, true];
            [] spawn {
                sleep 20;
                ["smokecherry", [ranger]] remoteExec ["FoxClub_fnc_Conversation"];
                missionNamespace setVariable ["ActionConfirmSmoke", true, true];
            };
        };

        if ("vn_m18_yellow_mag" in _magazine && _unit inArea "Grenade_Marker" && missionNamespace getVariable ["ExtractConvo", false]) then {
            [_projectile] spawn {
                params ["_thrownSmoke"];
                waitUntil {uiSleep 1; abs (speed _thrownSmoke) == 0};
                if !(_thrownSmoke inArea "Grenade_Marker") exitWith {};
                _smokeEmitter = "SmokeShellYellow_Infinite" createVehicle getPos _thrownSmoke;
            };
            missionNamespace setVariable ["SmokeThrown", true, true];
            [] spawn {
                sleep 20;
                ["smokelemon", [ranger]] remoteExec ["FoxClub_fnc_Conversation"];
                missionNamespace setVariable ["ActionConfirmSmoke", true, true];
            };
        };

        if ("vn_m18_green_mag" in _magazine && _unit inArea "Grenade_Marker" && missionNamespace getVariable ["ExtractConvo", false]) then {
            [_projectile] spawn {
                params ["_thrownSmoke"];
                waitUntil {uiSleep 1; abs (speed _thrownSmoke) == 0};
                if !(_thrownSmoke inArea "Grenade_Marker") exitWith {};
                _smokeEmitter = "SmokeShellGreen_Infinite" createVehicle getPos _thrownSmoke;
            };
            missionNamespace setVariable ["SmokeThrown", true, true];
            [] spawn {
                sleep 20;
                ["smokelime", [ranger]] remoteExec ["FoxClub_fnc_Conversation"];
                missionNamespace setVariable ["ActionConfirmSmoke", true, true];
            };
        };

        if ("vn_m18_white_mag" in _magazine && _unit inArea "Grenade_Marker" && missionNamespace getVariable ["ExtractConvo", false]) then {
            [_projectile] spawn {
                params ["_thrownSmoke"];
                waitUntil {uiSleep 1; abs (speed _thrownSmoke) == 0};
                if !(_thrownSmoke inArea "Grenade_Marker") exitWith {};
                _smokeEmitter = "SmokeShell_Infinite" createVehicle getPos _thrownSmoke;
            };
            missionNamespace setVariable ["SmokeThrown", true, true];
            [] spawn {
                sleep 20;
                ["smokecream", [ranger]] remoteExec ["FoxClub_fnc_Conversation"];
				missionNamespace setVariable ["ActionConfirmSmoke", true, true];
            };
        };
    }];
};


//////////////////////////////////////////////////
//                                              //
//       HOLD ACTION FOR RETURN TO BASE         //
//                                              //
//////////////////////////////////////////////////

private _conditionExtract = {
    missionNamespace getVariable ["actionReturnToBase", false] &&
    _this in crew extractHeli
};

[
	extractheli,
	"<t color='#FFFF00'>Return to Base</t>",
	"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa", //idle icon 
	"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa", //progress icon
	toString _conditionExtract, //condition, all alive players in the helicopter.
	"true", //condition progress
	{}, //code on start
	{}, // code every tick
	{
        params ["_target", "_caller", "_actionID", "_args"];
        _scout   = missionNamespace getVariable ["scout", objNull]; 
        private _convo = ["goGoGo", "goGoGoScout"] select (_caller == _scout);
        missionNamespace setVariable ["actionReturnToBase", false, true];
        
        [_convo, [_caller, ranger]] remoteExec [
            "FoxClub_fnc_Conversation",    
            allPlayers select { _x distance _caller <= 100 }    
        ];
        /*
        [] spawn {
            ExtractHeli landAt [ExtractHelipad, "None"]; // lets the heli take off
            ExtractHeli flyInHeight 80; // goes to height then moves to base. Doesnt look smooth.
            _group = ExtractHeliGroup;  
            _markerName = "returnToBase";   
            _waypointPosition = getMarkerPos _markerName;  
            _wp1 = _group addWaypoint [_waypointPosition, 0]; 
            _wp1 setWaypointType "MOVE";  
            _group setCurrentWaypoint _wp1; // forces heli to move
            sleep 60; // lets heli take off before giving another landing
            ExtractHeli landAt [baseHelipad, "Land"]; // if there was no sleep the engine will turn off and heli wont take off.
		};
        */
        remoteExec ["FoxClub_fnc_heliRTB", extractHeli];
	}, // code on finish
	{}, // code on interuption
	[], //arguements
	3, //duration
	8, //order from top
	true, //remove on finish
	false, //show if unconcious
	true //show in middle of screen
] call BIS_fnc_holdActionAdd;


//////////////////////////////////////////////////
//                                              //
//     DEBFRIEF CONVO BASED ON PERFORMANCE      //
//                                              //
//////////////////////////////////////////////////

Marcinko addAction [
    "<t color='#FFFF00'>""Ready for debrief, sir.""</t>",
    {
        missionNamespace setVariable ["ActionDebrief", false, true];
		params ["_target", "_caller", "_actionID", "_args"]; //makes the caller say the first line
		
        _scout = missionNamespace getVariable ["scout", objNull];
        private _allPrimary = missionnamespace getVariable ["AllPriTasksComplete",false];
        private _allSecondary = missionnamespace getVariable ["AllSecTasksComplete",false];
        private _someSecondary = missionNamespace getVariable ["SomeSecTasksComplete",false];
        private _hvtDead = missionNamespace getVariable ["hvtDead",false];
        private _stabFailed = missionNamespace getVariable ["stabFailed",false];
        private _hvtFled = missionNamespace getVariable ["hvtFled",false];
        private _stabPassed = missionNamespace getVariable ["stabPassed",false];
        private _powDied = missionNamespace getVariable ["powDied",false];
        private _pilotDied = missionNamespace getVariable ["pilotDied",false];
        private _menLeftBehind = missionNamespace getVariable ["extractTaskFailed",false];

    if (_scout == _caller) then {

		if (_allPrimary && _allSecondary)  then {
			["scout10", [_caller, Marcinko]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance Marcinko <= 100}];  
		};

		if (_allPrimary && _someSecondary && !_allSecondary)  then {
			["scout9", [_caller, Marcinko]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance Marcinko <= 100}];  
		};
		
		if (_allPrimary && !_allSecondary && !_someSecondary)  then {
			["scout8", [_caller, Marcinko]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance Marcinko <= 100}];  
		};
		
		if (_hvtDead && _stabFailed && _someSecondary)  then {
			["scout7", [_caller, Marcinko]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance Marcinko <= 100}];  
		};
        
		if (_hvtDead && _stabFailed && !_someSecondary)  then {
			["scout6", [_caller, Marcinko]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance Marcinko <= 100}];  
		};
		
        if (_hvtFled && _stabPassed && _someSecondary)  then {
			["scout5", [_caller, Marcinko]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance Marcinko <= 100}];  
		};
		
        if (_hvtFled && _stabPassed && !_someSecondary)  then {
			["scout4", [_caller, Marcinko]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance Marcinko <= 100}];  
		};
		
        if (_hvtFled && _stabFailed && _someSecondary)  then {
			["scout3", [_caller, Marcinko]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance Marcinko <= 100}];  
		
        };
		if (_hvtFled && _stabFailed && !_someSecondary && !_powDied && !_pilotDied)  then {
			["scout2", [_caller, Marcinko]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance Marcinko <= 100}];  
		
        };
		if (_hvtFled && _stabFailed && (_powDied || _pilotDied) && !_menLeftBehind)  then {
			["scout1", [_caller, Marcinko]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance Marcinko <= 100}];  
		
        };
		if (_hvtFled && _stabFailed && (_powDied || _pilotDied) && _menLeftBehind)  then {
			["scout0", [_caller, Marcinko]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance Marcinko <= 100}];  
		};

    } else {

        if (_allPrimary && _allSecondary)  then {
			["10", [_caller, Marcinko]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance Marcinko <= 100}];  
		};

		if (_allPrimary && _someSecondary && !_allSecondary)  then {
			["9", [_caller, Marcinko]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance Marcinko <= 100}];  
		};
		
		if (_allPrimary && !_allSecondary && !_someSecondary)  then {
			["8", [_caller, Marcinko]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance Marcinko <= 100}];  
		};
		
		if (_hvtDead && _stabFailed && _someSecondary)  then {
			["7", [_caller, Marcinko]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance Marcinko <= 100}];  
		};
        
		if (_hvtDead && _stabFailed && !_someSecondary)  then {
			["6", [_caller, Marcinko]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance Marcinko <= 100}];  
		};
		
        if (_hvtFled && _stabPassed && _someSecondary)  then {
			["5", [_caller, Marcinko]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance Marcinko <= 100}];  
		};
		
        if (_hvtFled && _stabPassed && !_someSecondary)  then {
			["4", [_caller, Marcinko]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance Marcinko <= 100}];  
		};
		
        if (_hvtFled && _stabFailed && _someSecondary)  then {
			["3", [_caller, Marcinko]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance Marcinko <= 100}];  
		
        };
		if (_hvtFled && _stabFailed && !_someSecondary && !_powDied && !_pilotDied)  then {
			["2", [_caller, Marcinko]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance Marcinko <= 100}];  
		
        };
		if (_hvtFled && _stabFailed && (_powDied || _pilotDied) && !_menLeftBehind)  then {
			["1", [_caller, Marcinko]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance Marcinko <= 100}];  
		
        };
		if (_hvtFled && _stabFailed && (_powDied || _pilotDied) && _menLeftBehind)  then {
			["0", [_caller, Marcinko]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance Marcinko <= 100}];  
		};

    };

	},
    [],
    8,
    false,
    true,
    "",
    "ActionDebrief", //ActionDebrief
	4
];


/*
    initPlayerLocal.sqf
    Sets up Place + Detonate holdActions for food/weapon caches
    Works in SP & MP, safe for respawn
*/

