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
 		["bingo", [_caller, leader player, covey]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];
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
        if ("vn_m18_purple_mag" in _magazine && _unit inArea "Grenade_Marker" && triggerActivated ExtractConvo) then {
            [_projectile] spawn {
                params ["_thrownSmoke"];
                waitUntil {uiSleep 1; abs (speed _thrownSmoke) == 0};
                if !(_thrownSmoke inArea "Grenade_Marker") exitWith {};
                _smokeEmitter = "SmokeShellPurple_Infinite" createVehicle getPos _thrownSmoke;
            };
            missionNamespace setVariable ["SmokeThrown", true, true];
            [] spawn {
                sleep 15;
                [Ranger, "Ranger, Rankin. I see grape smoke please confirm, over."] remoteExec ["sideChat"];
                missionNamespace setVariable ["ActionConfirmSmoke", true, true];
            };
        };

        if ("vn_m18_red_mag" in _magazine && _unit inArea "Grenade_Marker" && triggerActivated ExtractConvo) then {
            [_projectile] spawn {
                params ["_thrownSmoke"];
                waitUntil {uiSleep 1; abs (speed _thrownSmoke) == 0};
                if !(_thrownSmoke inArea "Grenade_Marker") exitWith {};
                _smokeEmitter = "SmokeShellRed_Infinite" createVehicle getPos _thrownSmoke;
            };
            missionNamespace setVariable ["SmokeThrown", true, true];
            [] spawn {
                sleep 15;
                [Ranger, "Ranger, Rankin. I see cherry smoke please confirm, over."] remoteExec ["sideChat"];
                missionNamespace setVariable ["ActionConfirmSmoke", true, true];
            };
        };

        if ("vn_m18_yellow_mag" in _magazine && _unit inArea "Grenade_Marker" && triggerActivated ExtractConvo) then {
            [_projectile] spawn {
                params ["_thrownSmoke"];
                waitUntil {uiSleep 1; abs (speed _thrownSmoke) == 0};
                if !(_thrownSmoke inArea "Grenade_Marker") exitWith {};
                _smokeEmitter = "SmokeShellYellow_Infinite" createVehicle getPos _thrownSmoke;
            };
            missionNamespace setVariable ["SmokeThrown", true, true];
            [] spawn {
                sleep 15;
                [Ranger, "Ranger, Rankin. I see limon smoke please confirm, over."] remoteExec ["sideChat"];
                missionNamespace setVariable ["ActionConfirmSmoke", true, true];
            };
        };

        if ("vn_m18_green_mag" in _magazine && _unit inArea "Grenade_Marker" && triggerActivated ExtractConvo) then {
            [_projectile] spawn {
                params ["_thrownSmoke"];
                waitUntil {uiSleep 1; abs (speed _thrownSmoke) == 0};
                if !(_thrownSmoke inArea "Grenade_Marker") exitWith {};
                _smokeEmitter = "SmokeShellGreen_Infinite" createVehicle getPos _thrownSmoke;
            };
            missionNamespace setVariable ["SmokeThrown", true, true];
            [] spawn {
                sleep 15;
                [Ranger, "Ranger, Rankin. I see lime smoke please confirm, over."] remoteExec ["sideChat"];
                missionNamespace setVariable ["ActionConfirmSmoke", true, true];
            };
        };

        if ("vn_m18_white_mag" in _magazine && _unit inArea "Grenade_Marker" && triggerActivated ExtractConvo) then {
            [_projectile] spawn {
                params ["_thrownSmoke"];
                waitUntil {uiSleep 1; abs (speed _thrownSmoke) == 0};
                if !(_thrownSmoke inArea "Grenade_Marker") exitWith {};
                _smokeEmitter = "SmokeShell_Infinite" createVehicle getPos _thrownSmoke;
            };
            missionNamespace setVariable ["SmokeThrown", true, true];
            [] spawn {
                sleep 15;
                [Ranger, "Ranger, Rankin. I see cream smoke please confirm, over."] remoteExec ["sideChat"];
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
		missionNamespace setVariable ["RTBAction", false, true];
		missionNamespace setVariable ["ChopperRTB", true, true];
	}, // code on finish
	{}, // code on interuption
	[], //arguements
	3, //duration
	8, //order from top
	true, //remove on finish
	false, //show if unconcious
	true //show in middle of screen
] call BIS_fnc_holdActionAdd;
/*
// end the mission early addaction
player addAction [
    "<t color='#FFFF00'>End Mission</t>",
    {
	["end1", true , true, true, true] remoteExecCall ["VN_fnc_endMission"]
	},
    [],
    8,
    false,
    true,
    "",
    "ActionEndMission"
];
*/

//ends mission early hold action - probably not going to use this now that I have an ending for the mission
/*
[
	player,
	"<t color='#FFFF00'>End Mission</t>",
	"a3\ui_f\data\igui\cfg\holdactions\holdaction_thumbsup_ca.paa", //idle icon 
	"a3\ui_f\data\igui\cfg\holdactions\holdaction_thumbsup_ca.paa", //progress icon
	"ActionEndMission", //condition
	"true", //condition progress
	{}, //code on start
	{}, // code every tick
	{
		["end1", true , true, true, true] remoteExecCall ["VN_fnc_endMission"]
	}, // code on finish
	{}, // code on interuption
	[], //arguements
	3, //duration
	8, //order from top
	true, //remove on finish
	false, //show if unconcious
	true //show in middle of screen
] call BIS_fnc_holdActionAdd;
*/

// debrief conversation based on what triggers were activated
Marcinko addAction [
    "<t color='#FFFF00'>""Ready for debrief, sir.""</t>",
    {
        missionNamespace setVariable ["ActionDebrief", false, true];
		params ["_target", "_caller", "_actionID", "_args"]; //makes the caller say the first line
		//[_caller, ["debrief",100]] remoteExec ["say3D"]; //ready for debrief sir
		//sleep 3; //wait for file to finish playing
		if (AllPriTasksCokmplete && AllSecTasksCokmplete)  then {
			//[Marcinko, ["10", 100]] remoteExec ["say3D"]; //plays sound file 10
			[Marcinko, "You took out that filthy commie rat bastard son of a bitch! You destroyed all evidence of our involvement! You must have taken out every target of opportunity in the entire AO! You disrupted enemy operations so badly that they'll be reeling for months. You've all earned the title of true warriors! You're gonna be banging boom-boom girls on R&R till the cows come home! Outstanding job. Dismissed!"] remoteExec ["sideChat"];
			sleep 10;
			[  
			[  
			["Performance Rating:", "<t align = 'center' shadow = '1' size = '1.5' font='tt2020style_e_vn_bold'>%1</t><br/>"], 
			["10/10", "<t align = 'center' shadow = '1' size = '1.5' font='tt2020style_e_vn_bold'>%1</t><br/>"]  
			]  
			] remoteExec ["vn_ms_fnc_sfx_typeText"];
			sleep 7;
			["end1", true , true, true, true] remoteExec ["VN_fnc_endMission"];
		};
		if (AllPriTasksCokmplete && SomeSecTasksCokmplete && isnil "AllSecTasksCokmplete") then {
			//[Marcinko, ["9", 100]] remoteExec ["say3D"];
			[Marcinko, "You took out that commie rat bastard and covered our tracks like pros! On top of that, you managed to handle some additional objectives that weren’t even on the list. Outstanding work! Hit the showers, and I’ll catch you guys at the bar later. Dismissed!"] remoteExec ["sideChat"];
			sleep 10;
			[  
			[  
			["Performance Rating:", "<t align = 'center' shadow = '1' size = '1.5' font='tt2020style_e_vn_bold'>%1</t><br/>"], 
			["9/10", "<t align = 'center' shadow = '1' size = '1.5' font='tt2020style_e_vn_bold'>%1</t><br/>"]  
			]  
			] remoteExec ["vn_ms_fnc_sfx_typeText"];
			sleep 7;
			["end1", true , true, true, true] remoteExec ["VN_fnc_endMission"];
		};
		if (AllPriTasksCokmplete && NoSecTasksCokmplete) then {
            //[Marcinko, ["8", 100]] remoteExec ["say3D"];
			[Marcinko, "You took out that commie bastard and cleaned up all traces of our involvement. You nailed the primary mission objective, and that’s exactly what we needed. Well done, gentlemen. Your country owes you a great deal. Dismissed!"] remoteExec ["sideChat"];
			sleep 10;
			[  
			[  
			["Performance Rating:", "<t align = 'center' shadow = '1' size = '1.5' font='tt2020style_e_vn_bold'>%1</t><br/>"], 
			["8/10", "<t align = 'center' shadow = '1' size = '1.5' font='tt2020style_e_vn_bold'>%1</t><br/>"]  
			]  
			] remoteExec ["vn_ms_fnc_sfx_typeText"];
			sleep 7;
			["end1", true , true, true, true] remoteExec ["VN_fnc_endMission"];
		};
		if (triggerActivated generaldead && triggerActivated STABfail && SomeSecTasksCokmplete) then {
			//[Marcinko, ["7", 100]] remoteExec ["say3D"];
			[Marcinko, "You took out the bastard, and you did a solid job disrupting their operations by hitting some additional targets. However, leaving evidence of our involvement is a serious breach. It’s unacceptable, but I’ll see if I can work some magic with the top brass, considering the extra effort you put in. Dismissed!"] remoteExec ["sideChat"];
			sleep 10;
			[  
			[  
			["Performance Rating:", "<t align = 'center' shadow = '1' size = '1.5' font='tt2020style_e_vn_bold'>%1</t><br/>"], 
			["7/10", "<t align = 'center' shadow = '1' size = '1.5' font='tt2020style_e_vn_bold'>%1</t><br/>"]  
			]  
			] remoteExec ["vn_ms_fnc_sfx_typeText"];
			sleep 7;
			["end1", true , true, true, true] remoteExec ["VN_fnc_endMission"];
		};
		if (triggerActivated generaldead && triggerActivated STABfail && isnil "SomeSecTasksCokmplete") then {
            //[Marcinko, ["6", 100]] remoteExec ["say3D"];
			[Marcinko, "You took out the bastard, but unfortunately, you left evidence of our involvement behind. While eliminating the General was crucial, the fact that our tracks are exposed could spell trouble, especially if the enemy can prove our involvement. This isn’t going to sit well with the top brass. Dismissed!"] remoteExec ["sideChat"];
			sleep 10;
			[  
			[  
			["Performance Rating:", "<t align = 'center' shadow = '1' size = '1.5' font='tt2020style_e_vn_bold'>%1</t><br/>"], 
			["6/10", "<t align = 'center' shadow = '1' size = '1.5' font='tt2020style_e_vn_bold'>%1</t><br/>"]  
			]  
			] remoteExec ["vn_ms_fnc_sfx_typeText"];
			sleep 7;
			["end1", true , true, true, true] remoteExec ["VN_fnc_endMission"];
		};
		if (triggerActivated end_task_2_fail && triggerActivated ptboatdead && SomeSecTasksCokmplete) then {
			//[Marcinko, ["5", 100]] remoteExec ["say3D"];
			[Marcinko, "I'm sorry you couldn't nail the slippery bastard, but you did a solid job covering our tracks—textbook work. On the bright side, you managed to disrupt enemy operations by hitting some additional targets, and that’s not going unnoticed. Good effort. Dismissed!"] remoteExec ["sideChat"];
			sleep 10;
			[  
			[  
			["Performance Rating:", "<t align = 'center' shadow = '1' size = '1.5' font='tt2020style_e_vn_bold'>%1</t><br/>"], 
			["5/10", "<t align = 'center' shadow = '1' size = '1.5' font='tt2020style_e_vn_bold'>%1</t><br/>"]  
			]  
			] remoteExec ["vn_ms_fnc_sfx_typeText"];
			sleep 7;
			["end1", true , true, true, true] remoteExec ["VN_fnc_endMission"];
		};
		if (triggerActivated end_task_2_fail && triggerActivated ptboatdead && isnil "SomeSecTasksCokmplete") then {
            //[Marcinko, ["4", 100]] remoteExec ["say3D"];
			[Marcinko, "I'm sorry you couldn't nail the slippery bastard. However, you did a commendable job covering our tracks. I’ll be hoping for better results on your next mission. Dismissed."] remoteExec ["sideChat"];
			sleep 10;
			[  
			[  
			["Performance Rating:", "<t align = 'center' shadow = '1' size = '1.5' font='tt2020style_e_vn_bold'>%1</t><br/>"], 
			["4/10", "<t align = 'center' shadow = '1' size = '1.5' font='tt2020style_e_vn_bold'>%1</t><br/>"]  
			]  
			] remoteExec ["vn_ms_fnc_sfx_typeText"];
			sleep 7;
			["end1", true , true, true, true] remoteExec ["VN_fnc_endMission"];
		};
		if (triggerActivated end_task_2_fail && triggerActivated STABfail && SomeSecTasksCokmplete) then {
			//[Marcinko, ["3", 100]] remoteExec ["say3D"];
			[Marcinko, "It’s regrettable you missed the target, and worse, you left evidence of our involvement. What am I supposed to tell the top brass? The only small consolation is that you did manage to disrupt enemy operations. Get your shit squared away. Dismissed!"] remoteExec ["sideChat"];
			sleep 10;
			[  
			[  
			["Performance Rating:", "<t align = 'center' shadow = '1' size = '1.5' font='tt2020style_e_vn_bold'>%1</t><br/>"], 
			["3/10", "<t align = 'center' shadow = '1' size = '1.5' font='tt2020style_e_vn_bold'>%1</t><br/>"]  
			]  
			] remoteExec ["vn_ms_fnc_sfx_typeText"];
			sleep 7;
			["end1", true , true, true, true] remoteExec ["VN_fnc_endMission"];
		};
		if (triggerActivated end_task_2_fail && triggerActivated STABfail && isnil "SomeSecTasksCokmplete") then {
            //[Marcinko, ["2", 100]] remoteExec ["say3D"];
			[Marcinko, "Look, it’s regrettable enough that you missed the target, but what’s worse is you left evidence of our involvement. This mission is FUBAR because of you and your lack of discipline. Get out of my sight. Dismissed!"] remoteExec ["sideChat"];
			sleep 10;
			[  
			[  
			["Performance Rating:", "<t align = 'center' shadow = '1' size = '1.5' font='tt2020style_e_vn_bold'>%1</t><br/>"], 
			["2/10", "<t align = 'center' shadow = '1' size = '1.5' font='tt2020style_e_vn_bold'>%1</t><br/>"]  
			]  
			] remoteExec ["vn_ms_fnc_sfx_typeText"];
			sleep 7;
			["end1", true , true, true, true] remoteExec ["VN_fnc_endMission"];
		};
		if (triggerActivated end_task_2_fail && triggerActivated STABfail && (triggerActivated PilotFail || triggerActivated POWfail)) then {
            //[Marcinko, ["1", 100]] remoteExec ["say3D"];
			[Marcinko, "You lost the target. You left evidence behind of our involvement. You got friendlies killed. I expected better from supposed professionals like you. This mission was a complete cluster-fuck and a critical failure. You should be ashamed. You’ll be cleaning latrines for the rest of your tour. Dismissed!"] remoteExec ["sideChat"];
			sleep 10;
			[  
			[  
			["Performance Rating:", "<t align = 'center' shadow = '1' size = '1.5' font='tt2020style_e_vn_bold'>%1</t><br/>"], 
			["1/10", "<t align = 'center' shadow = '1' size = '1.5' font='tt2020style_e_vn_bold'>%1</t><br/>"]  
			]  
			] remoteExec ["vn_ms_fnc_sfx_typeText"];
			sleep 7;
			["end1", true , true, true, true] remoteExec ["VN_fnc_endMission"];
		};
		if (triggerActivated end_task_2_fail && triggerActivated STABfail && MenLeftBehind && (triggerActivated PilotFail || triggerActivated POWfail)) then {
            //[Marcinko, ["1", 100]] remoteExec ["say3D"];
			[Marcinko, "You lost the target. You left evidence behind of our involvement. You got friendlies killed. And left team members behind in the enemy AO. You might as well have signed their death warrants. Fully expect an immediate courtmartial. Surrender your gear right now. MPs, lock 'em up!"] remoteExec ["sideChat"];
			sleep 10;
			[  
			[  
			["Performance Rating:", "<t align = 'center' shadow = '1' size = '1.5' font='tt2020style_e_vn_bold'>%1</t><br/>"], 
			["0/10", "<t align = 'center' shadow = '1' size = '1.5' font='tt2020style_e_vn_bold'>%1</t><br/>"]  
			]  
			] remoteExec ["vn_ms_fnc_sfx_typeText"];
			sleep 7;
			["end1", true , true, true, true] remoteExec ["VN_fnc_endMission"];
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

/* test
player addAction [
    "<t color='#FFFF00'>Test</t>", 
    { 
    if (isnil "SomeSecTasksCokmplete") then {
			[player, "trigger was activated"] remoteExec ["sideChat"];
		};
    }, 
    nil, 
    8, 
    false, 
    true, 
    "", 
    ""
];
*/

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