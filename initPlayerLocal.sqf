// creates briefing tabs
if ((!isServer) && (player != player)) then
{
  waitUntil {player == player};
};
_null = [] execVM "diary.sqf";

//replaces multiplayer faces with the ones I want
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

// Custom Function Testing. Uses custom chat with Say3d.
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
    "ActionTalkToMarcinko1 && !(_originalTarget getVariable ['foxclub_var_isTalking',false])", //makes action available: ActionTalkToMarcinko1 && AllowActionTalk
	4 //radius of addadction
];

/* This convo system uses the KBTell function just for subtitles and Say3D for the audio.
Marcinko addAction [
    "<t color='#FFFF00'>""Could this be a trap?""</t>", //what addaction is displayed as
    {	
	missionNamespace setVariable ["AllowActionTalk", false, true]; //disables all addactions during the convo    
    missionNamespace setVariable ["ActionTalkToMarcinko1", false, true]; //removes the used addAction
	params ["_target", "_caller", "_actionID", "_args"]; //needed for finding player that made the action

	["PlayerQuestions", "StagingArea", ["Question1", "Question1"]] remoteExec ["BIS_fnc_kbTell", 2]; // subtitles
	[_caller, ["question1",100]] remoteExec ["say3D"]; //sound file is played from caller
	[_caller, true] remoteExec ["setRandomLip"]; //caller lips move
	sleep 6; //waits for sound file to finish
	[_caller, false] remoteExec ["setRandomLip"]; //caller lips stop

	["PlayerQuestions", "StagingArea", ["Answer1", "Answer1"]] spawn BIS_fnc_kbTell; // subtitles
	[Marcinko, ["answer1",100]] remoteExec ["say3D"]; //plays sound file from NPC
	[Marcinko, true] remoteExec ["setRandomLip"]; //NPC lips move
	sleep 6; //waits for sound file to finish
	[Marcinko, false] remoteExec ["setRandomLip"]; //NPC lips stop

	missionNamespace setVariable ["AllowActionTalk", true, true]; //enables remaining addaction questions
	}, 
    nil, 
    8, 
    false, 
    true, 
    "", 
    "ActionTalkToMarcinko1 && AllowActionTalk", //makes action available 
	4 //radius of addadction
];
*/

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
    "ActionTalkToMarcinko3 && !(_originalTarget getVariable ['foxclub_var_isTalking',false])",
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
    "ActionTalkToMarcinko4 && !(_originalTarget getVariable ['foxclub_var_isTalking',false])",
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
    "ActionTalkToMarcinko5 && !(_originalTarget getVariable ['foxclub_var_isTalking',false])", 
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
    "ActionTalkToMarcinko6 && !(_originalTarget getVariable ['foxclub_var_isTalking',false])",
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
    "ActionTalkToMarcinko7 && !(_originalTarget getVariable ['foxclub_var_isTalking',false])", 
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

//skip to infil hold action
//old addaction just in case. was in boat init.
//this addAction ["<t color='#FFFF00'>Skip to the Infiltration Point</t>", {GlobalSkipIngress = false; publicVariable "GlobalSkipIngress"; ["scripts\SkiptoIngress.sqf"] remoteExec ["execVM", 0];}, nil, 8, false, true, "", "isNil 'GlobalSkipIngress' && _this in (crew _target)"]; 
[
	ptboat,
	"<t color='#FFFF00'>Skip to the Infiltration Point</t>",
	"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa", //idle icon 
	"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa", //progress icon
	"isNil 'GlobalSkipIngress' && (allPlayers - crew ptboat) isEqualTo []", //condition, use this for any player in boat in the init field _this in (crew _target)
	"true", //condition progress
	{}, //code on start
	{}, // code every tick
	{
		GlobalSkipIngress = false; 
		publicVariable "GlobalSkipIngress"; 
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

//lets player equip scuba when its ready
scubaEquipped = false;

//equip SCUBA
//["scripts\scubanow.sqf"] remoteExec ["execVM", 0, true]; was in trigger from wait_pass or fail
//ptboat addAction ["<t color='#FFFF00'>Equip SCUBA Gear</t>", "scripts\scubagear.sqf", nil, 7, false, true, "", "_this in (crew _target) && !scubaEquipped"]; //Shows up if you are in the boat and have your regular loadout
[
	ptboat,
	"<t color='#FFFF00'>Equip SCUBA Gear</t>",
	"a3\ui_f\data\igui\cfg\actions\take_ca.paa", //idle icon 
	"a3\ui_f\data\igui\cfg\actions\take_ca.paa", //progress icon
	"_this in (crew _target) && !scubaEquipped && ActionSCUBA", 
	"true", //condition progress
	{}, //code on start
	{}, // code every tick
	{
		execVM "scripts\scubagear.sqf";
		params ["_target", "_caller", "_actionID", "_args"];
		[selectRandom ["scubatime1", "scubatime2", "scubatime3"], [_caller]] remoteExec ["FoxClub_fnc_Conversation"];
	}, // code on finish
	{}, // code on interuption
	[], //arguements
	3, //duration
	8, //order from top
	false, //remove on finish
	false, //show if unconcious
	false //show in middle of screen
] call BIS_fnc_holdActionAdd;

//equip loadout
//ptboat addAction ["<t color='#FFFF00'>Equip Loadout Gear</t>", "scripts\loadoutgear.sqf", nil, 7, false, true, "", "_this in (crew _target) && scubaEquipped"]; //Shows up if you are in the boat and have your SCUBA
[
	ptboat,
	"<t color='#FFFF00'>Equip Loadout Gear</t>",
	"a3\ui_f\data\igui\cfg\actions\obsolete\ui_action_takeweapon_ca.paa", //idle icon 
	"a3\ui_f\data\igui\cfg\actions\obsolete\ui_action_takeweapon_ca.paa", //progress icon
	"_this in (crew _target) && scubaEquipped", //condition //triggerActivated wait_pass || triggeractivated wait_fail
	"true", //condition progress
	{}, //code on start
	{}, // code every tick
	{
		execVM "scripts\loadoutgear.sqf";
		params ["_target", "_caller", "_actionID", "_args"];
		[selectRandom ["gearup1", "gearup2", "gearup2"], [_caller]] remoteExec ["FoxClub_fnc_Conversation"];
	}, // code on finish
	{}, // code on interuption
	[], //arguements
	3, //duration
	8, //order from top
	false, //remove on finish
	false, //show if unconcious
	false //show in middle of screen
] call BIS_fnc_holdActionAdd;

/*
ptboat addAction [
    "<t color='#FFFF00'>TEST</t>", 
    {
        missionNamespace setVariable ["ActionSTABTimeBombs", false, true];
		[getMissionPath "sound\PlaceBomb.ogg", getPosASL ptboat, false, ptboat, 5] remoteExec ["playSound3D", 0];
		//playSound3D [getMissionPath "sound\PlaceBomb.ogg", getPosASL ptboat, false, ptboat, 5];
        ["scripts\bomb.sqf"] remoteExec ["execVM", 2];
    }, 
    nil, 
    8, 
    false, 
    true, 
    "", 
    "ActionSTABTimeBombs",
    5.5
];
*/

//Place time bombs on STAB
ptboat addAction [
    "<t color='#FFFF00'>Place C-4 Plastic Explosive: 15 Minutes</t>", 
    {
        missionNamespace setVariable ["ActionSTABTimeBombs", false, true];
        playSound3D [getMissionPath "sound\PlaceBomb.ogg", getPosASL ptboat, false, ptboat, 3];
		["scripts\bomb.sqf"] remoteExec ["execVM", 2];
		params ["_target", "_caller", "_actionID", "_args"];
		["bomb15", [_caller]] remoteExec ["FoxClub_fnc_Conversation"];
    }, 
    nil, 
    8, 
    false, 
    true, 
    "", 
    "ActionSTABTimeBombs",
    5.5
];

//Place time bombs on STAB
ptboat addAction [
    "<t color='#FFFF00'>Place C-4 Plastic Explosive: 30 Minutes</t>", 
    {
        missionNamespace setVariable ["ActionSTABTimeBombs", false, true];
        playSound3D [getMissionPath "sound\PlaceBomb.ogg", getPosASL ptboat, false, ptboat, 3];
		["scripts\bomb2.sqf"] remoteExec ["execVM", 2];
		params ["_target", "_caller", "_actionID", "_args"];
		["bomb30", [_caller]] remoteExec ["FoxClub_fnc_Conversation"];
    }, 
    nil, 
    8, 
    false, 
    true, 
    "", 
    "ActionSTABTimeBombs",
    5.5
];

//Place time bombs on STAB
ptboat addAction [
    "<t color='#FFFF00'>Place C-4 Plastic Explosive: 45 Minutes</t>", 
    {
        missionNamespace setVariable ["ActionSTABTimeBombs", false, true];
        playSound3D [getMissionPath "sound\PlaceBomb.ogg", getPosASL ptboat, false, ptboat, 3];
		["scripts\bomb3.sqf"] remoteExec ["execVM", 2];
		params ["_target", "_caller", "_actionID", "_args"];
		["bomb45", [_caller]] remoteExec ["FoxClub_fnc_Conversation"];
    }, 
    nil, 
    8, 
    false, 
    true, 
    "", 
    "ActionSTABTimeBombs",
    5.5
];

// equip time bombs. not using hold action for now cause of bug on multiple ones not showing icon. gencoder may have a fix try at last resort
//["scripts\bombs.sqf"] remoteExec ["execVM", 0, true]; // in trigger area on infil.
//ptboat addAction ["<t color='#FFFF00'>Place Timed Explosive: 15 Minutes</t>", {timebomb = false; publicVariable "timebomb"; ["scripts\bomb.sqf"] remoteExec ["execVM", 0];}, nil, 8, false, true, "", "isNil 'timebomb'", 5.5];
/*
[
	ptboat,
	"<t color='#FFFF00'>Place Timed Explosive: 15 Minutes</t>",
	"a3\ui_f_oldman\data\igui\cfg\holdactions\destroy_ca.paa", //idle icon 
	"a3\ui_f_oldman\data\igui\cfg\holdactions\destroy_ca.paa", //progress icon
	"true", //condition //triggerActivated wait_pass || triggeractivated wait_fail
	"true", //condition progress
	{}, //code on start
	{}, // code every tick
	{
		timebomb = false; 
		publicVariable "timebomb"; 
		["scripts\bomb.sqf"] remoteExec ["execVM", 0];
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
	"<t color='#FFFF00'>Place Timed Explosive: 30 Minutes</t>",
	"a3\ui_f_oldman\data\igui\cfg\holdactions\destroy_ca.paa", //idle icon 
	"a3\ui_f_oldman\data\igui\cfg\holdactions\destroy_ca.paa", //progress icon
	"true", //condition //triggerActivated wait_pass || triggeractivated wait_fail
	"true", //condition progress
	{}, //code on start
	{}, // code every tick
	{
		timebomb = false; 
		publicVariable "timebomb"; 
		["scripts\bomb2.sqf"] remoteExec ["execVM", 0];
	}, // code on finish
	{}, // code on interuption
	[], //arguements
	3, //duration
	8, //order from top
	false, //remove on finish
	false, //show if unconcious
	false //show in middle of screen
] call BIS_fnc_holdActionAdd;
*/

[
	officer,
	"<t color='#FFFF00'>Search Body for Identification</t>",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_forceRespawn_ca.paa", //idle icon 
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa", //progress icon
	"_this distance _target < 2 && !alive officer", //condition
	"true", //condition progress
	{
		params ["_target", "_caller", "_actionID", "_args"];      
 		[selectRandom ["papers1", "papers2", "papers3"], [_caller]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _target <= 100}];
	}, //code on start
	{}, // code every tick
	{
		missionNamespace setVariable ["hvtdead", true, true];
		params ["_target", "_caller", "_actionID", "_args"];      
 		["bingo", [_caller, covey]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];
 		//["bingo2", [_caller, covey]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _target <= 100}];
	}, // code on finish
	{}, // code on interuption
	[], //arguements
	5, //duration
	8, //order from top
	true, //remove on finish
	false, //show if unconcious
	false //show in middle of screen
] call BIS_fnc_holdActionAdd;

// downed pilot questions
pilot addAction [
    "<t color='#FFFF00'>""So...""</t>", 
    {
	missionNamespace setVariable ["ActionTalkToPilot1", false, true];
	params ["_target", "_caller", "_actionID", "_args"];    
	["startpilot", [_caller, _target]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _target <= 100}];
	missionNamespace setVariable ["ActionTalkToPilot", true, true];
	}, 
    nil, 
    8, 
    false, 
    true, 
    "", 
    "!(_this in [scout]) && !(_originalTarget getVariable ['foxclub_var_isTalking',false]) && ActionTalkToPilot1", 
	4 
];

pilot addAction [
    "<t color='#FFFF00'>""Who are you?""</t>", 
    {
	missionNamespace setVariable ["ActionTalkToPilot2", false, true];
	params ["_target", "_caller", "_actionID", "_args"];    
	["askpilot1", [_caller, _target]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _target <= 100}];
	}, 
    nil, 
    8, 
    false, 
    true, 
    "", 
    "!(_this in [scout]) && !(_originalTarget getVariable ['foxclub_var_isTalking',false]) && ActionTalkToPilot2 && ActionTalkToPilot", 
	4 
];

pilot addAction [
    "<t color='#FFFF00'>""Are you hurt?""</t>", 
    {
	missionNamespace setVariable ["ActionTalkToPilot3", false, true];
	params ["_target", "_caller", "_actionID", "_args"];    
	["askpilot2", [_caller, _target]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _target <= 100}];
	}, 
    nil, 
    8, 
    false, 
    true, 
    "", 
    "!(_this in [scout]) && !(_originalTarget getVariable ['foxclub_var_isTalking',false]) && ActionTalkToPilot3 && ActionTalkToPilot", 
	4 
];

pilot addAction [
    "<t color='#FFFF00'>""What was your mission?""</t>", 
    {
	missionNamespace setVariable ["ActionTalkToPilot4", false, true];
	params ["_target", "_caller", "_actionID", "_args"];    
	["askpilot3", [_caller, _target]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _target <= 100}];
	}, 
    nil, 
    8, 
    false, 
    true, 
    "", 
    "!(_this in [scout]) && !(_originalTarget getVariable ['foxclub_var_isTalking',false]) && ActionTalkToPilot4 && ActionTalkToPilot", 
	4 
];

// pow questions
pow addAction [
    "<t color='#FFFF00'>""Who are you?""</t>", 
    {
	missionNamespace setVariable ["ActionTalkToPOW1", false, true];
	params ["_target", "_caller", "_actionID", "_args"];    
	["askpow1", [_caller, _target]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _target <= 100}];
	}, 
    nil, 
    8, 
    false, 
    true, 
    "", 
    "!(_this in [scout]) && !(_originalTarget getVariable ['foxclub_var_isTalking',false]) && ActionTalkToPOW1", 
	4 
];

pow addAction [
    "<t color='#FFFF00'>""What happened?""</t>", 
    {
	missionNamespace setVariable ["ActionTalkToPOW2", false, true];
	params ["_target", "_caller", "_actionID", "_args"];    
	["askpow2", [_caller, _target]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _target <= 100}];
	}, 
    nil, 
    8, 
    false, 
    true, 
    "", 
    "!(_this in [scout]) && !(_originalTarget getVariable ['foxclub_var_isTalking',false]) && ActionTalkToPOW2", 
	4 
];

pow addAction [
    "<t color='#FFFF00'>""Been here long?""</t>", 
    {
	missionNamespace setVariable ["ActionTalkToPOW3", false, true];
	params ["_target", "_caller", "_actionID", "_args"];    
	["askpow3", [_caller, _target]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _target <= 100}];
	}, 
    nil, 
    8, 
    false, 
    true, 
    "", 
    "!(_this in [scout]) && !(_originalTarget getVariable ['foxclub_var_isTalking',false]) && ActionTalkToPOW3", 
	4 
];

pow addAction [
    "<t color='#FFFF00'>""How was it?""</t>", 
    {
	missionNamespace setVariable ["ActionTalkToPOW4", false, true];
	params ["_target", "_caller", "_actionID", "_args"];    
	["askpow4", [_caller, _target]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _target <= 100}];
	}, 
    nil, 
    8, 
    false, 
    true, 
    "", 
    "!(_this in [scout]) && !(_originalTarget getVariable ['foxclub_var_isTalking',false]) && ActionTalkToPOW4", 
	4 
];

pow addAction [
    "<t color='#FFFF00'>""Your leg...""</t>", 
    {
	missionNamespace setVariable ["ActionTalkToPOW5", false, true];
	params ["_target", "_caller", "_actionID", "_args"];    
	["askpow5", [_caller, _target]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _target <= 100}];
	}, 
    nil, 
    8, 
    false, 
    true, 
    "", 
    "!(_this in [scout]) && !(_originalTarget getVariable ['foxclub_var_isTalking',false]) && ActionTalkToPOW5", 
	4 
];

// creates infinite smoke
params ["_player", "_didJIP"];
// Check if SmokeThrown is not initialized
if (isNil "SmokeThrown") then {
    _player addEventHandler ["FiredMan", {
        params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle"];

        // Check if SmokeThrown is already set
        if (!isNil "SmokeThrown") exitWith {
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
                sleep 15;
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
                sleep 15;
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
                sleep 15;
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
                sleep 15;
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
                sleep 15;
                ["smokecream", [ranger]] remoteExec ["FoxClub_fnc_Conversation"];
				missionNamespace setVariable ["ActionConfirmSmoke", true, true];
            };
        };
    }];
};

/*
// return heli to base addadction //_this in (crew _target) if you want people to use it without everyone having to be in the helicopter
heli addAction [
    "<t color='#FFFF00'>Return to Base</t>", 
    { 
	missionNamespace setVariable ["RTBAction", false, true];
	missionNamespace setVariable ["ChopperRTB", true, true];
	}, 
    nil, 
    8, 
    false, 
    true, 
    "", 
    "RTBAction && (allPlayers - crew heli) isEqualTo []"
];
*/
// return heli to base hold action
[
	heli,
	"<t color='#FFFF00'>Return to Base</t>",
	"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa", //idle icon 
	"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa", //progress icon
	"RTBAction && (allPlayers - crew heli) isEqualTo []", //condition, use this for any player in boat in the init field _this in (crew _target)
	"true", //condition progress
	{}, //code on start
	{}, // code every tick
	{
	_group = ExtractHeliGroup;  
    _markerName = "returnToBase";   
    _waypointPosition = getMarkerPos _markerName;  
    _wp1 = _group addWaypoint [_waypointPosition, 0]; 
    _wp1 setWaypointType "MOVE"; 
    _wp2 = _group addWaypoint [_waypointPosition, 0]; 
    _wp2 setWaypointType "SCRIPTED";
    _wp2 setWaypointScript "A3\functions_f\waypoints\fn_wpLand.sqf";
        //missionNamespace setVariable ["RTBAction", false, true]; //old style
		//missionNamespace setVariable ["ChopperRTB", true, true];
	}, // code on finish
	{}, // code on interuption
	[], //arguements
	3, //duration
	8, //order from top
	true, //remove on finish
	false, //show if unconcious
	true //show in middle of screen
] call BIS_fnc_holdActionAdd;

[
	extractheli,
	"<t color='#FFFF00'>Return to Base</t>",
	"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa", //idle icon 
	"\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\map_ca.paa", //progress icon
	"RTBAction && (allPlayers - crew extractheli) isEqualTo []", //condition, use this for any player in boat in the init field _this in (crew _target)
	"true", //condition progress
	{}, //code on start
	{}, // code every tick
	{
	_group = ExtractHeliGroup;  
    _markerName = "returnToBase";   
    _waypointPosition = getMarkerPos _markerName;  
    _wp1 = _group addWaypoint [_waypointPosition, 0]; 
    _wp1 setWaypointType "MOVE"; 
    _wp2 = _group addWaypoint [_waypointPosition, 0]; 
    _wp2 setWaypointType "SCRIPTED";
    _wp2 setWaypointScript "A3\functions_f\waypoints\fn_wpLand.sqf";
        //missionNamespace setVariable ["RTBAction", false, true]; //old style
		//missionNamespace setVariable ["ChopperRTB", true, true];
	}, // code on finish
	{}, // code on interuption
	[], //arguements
	3, //duration
	8, //order from top
	true, //remove on finish
	false, //show if unconcious
	true //show in middle of screen
] call BIS_fnc_holdActionAdd;

// debrief conversation based on what triggers were activated
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
        private _menLeftBehind = missionNamespace getVariable ["menLeftBehind",false];

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

//easteregg
player addAction [
    "<t color='#FFFF00'>Are you Ms. Rankin?</t>", 
    {
	[easteregg, true] remoteExec ["setRandomLip"]; 
    [easteregg, ["easteregg",100]] remoteExec ["say3D"];
	sleep 49;
	[easteregg, false] remoteExec ["setRandomLip"]; 
    }, 
    nil, 
    8, 
    false, 
    true, 
    "", 
    "_this distance easteregg < 3 && alive easteregg",
	5
];
/*
player addAction [
    "<t color='#FFFF00'>Clear to Land</t>", 
    { 
	_group = ExtractHeliGroup;
	_markerName = "moveToLZ"; 
	_waypointPosition = getMarkerPos _markerName;
	_waypoint = _group addWaypoint [_waypointPosition, 0];
	_waypoint setWaypointType "MOVE";
	_group setCurrentWaypoint [_group, 2];
	[ExtractHeliGroup, [8584.56,8187.52,0], ExtractHeli] spawn BIS_fnc_wpLand;
	}, 
    nil, 
    8, 
    false, 
    true, 
    "", 
    ""
];
*/
/*
player addAction [
    "<t color='#FFFF00'>Return to Base</t>", 
    { 
	_group = ExtractHeliGroup;
	_markerName = "returnToBase"; 
	_waypointPosition = getMarkerPos _markerName;
	_waypoint = _group addWaypoint [_waypointPosition, 0];
	_waypoint setWaypointType "MOVE";
	_group setCurrentWaypoint [_group, 3];
	Sleep 1;
	[ExtractHeliGroup, [7044.84,4288.17,0], ExtractHeli] spawn BIS_fnc_wpLand; //need to place a move point in between landnings
	}, 
    nil, 
    8, 
    false, 
    true, 
    "", 
    ""
];
*/