//wait for naval patrol hold action. old one below was in trigger on activation
//player addAction ["<t color='#FFFF00'>Radio Headquarters</t>", {GlobalRadioHQ = false; publicVariable "GlobalRadioHQ"; ["scripts\RadioHQ.sqf"] remoteExec ["execVM", 0];}, nil, 8, false, true, "", "isNil 'GlobalRadioHQ'"];
[
	player,
	"<t color='#FFFF00'>Radio Headquarters</t>",
	"a3\missions_f_oldman\data\img\holdactions\holdaction_talk_ca.paa", //idle icon 
	"a3\missions_f_oldman\data\img\holdactions\holdaction_talk_ca.paa", //progress icon
	"ActionCallHQ", //condition
	"true", //condition progress
	{}, //code on start
	{}, // code every tick
	{
		params ["_target", "_caller", "_actionID", "_args"]; //needed for finding player that made the action
		missionNamespace setVariable ["ActionCallHQ", false, true];
		if (_caller == missionNamespace getVariable ["scout", objNull]) then {
			["radiohqScout", [_caller, HQRadio]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];
		} else {
			["radiohq1", [_caller, HQRadio]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];
		};
	}, // code on finish
	{}, // code on interuption
	[], //arguements
	3, //duration
	8, //order from top
	true, //remove on finish
	false, //show if unconcious
	false //show in middle of screen
] call BIS_fnc_holdActionAdd;

// calls POW to surface
player addAction [
    "<t color='#FFFF00'>Call POW</t>", 
    {
	params ["_target", "_caller", "_actionID", "_args"];
    missionNamespace setVariable ["ActionCallPOW", false, true];
	_scout = missionNamespace getVariable ["scout", objNull];

	if (_caller == _scout) then {
		["scoutcallPOW", [_caller, pow]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];
	} else {
		["callPOW", [_caller, pow]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];
	};

	sleep 20;
	POW setPosATL (getPosATL ExitSpot);
	sleep 1;

	if (_caller == _scout) then {
		["scoutPOWexits", [_caller, pow]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];
	} else {
		["POWexits", [_caller, pow]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];
	};
	
	sleep 9;
	[POW] join (group player);
	sleep 1; //needed for setcaptive
	POW setCaptive false;
	sleep 1; //possible needed for path command to work
	POW enableai "PATH";
    }, 
    nil, 
    8, 
    false, 
    true, 
    "", 
    "_this distance fieldtelephone < 4 && ActionCallPOW && alive pow"
];

/*extract action
player addAction [
    "<t color='#FFFF00'>Radio for Extraction</t>", 
    { 
	{[_x,"ALL"] remoteExec ["disableAI",0,true];} forEach crew samlauncher;
	missionNamespace setVariable ["ExtractAction", false, true];
    missionNamespace setVariable ["ChopperLZ", true, true];
    missionNamespace setVariable ["RTBAction", true, true];
	_scout = missionNamespace getVariable ["scout", objNull];
	params ["_target", "_caller", "_actionID", "_args"];
	if (_caller == _scout) then {
		["scoutextract", [_scout, covey]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _scout <= 100}];
		} else {
		["extract", [_caller, covey]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];
		};
    }, 
    nil, 
    8, 
    false, 
    true, 
    "", 
    "ExtractAction"
];
*/
//extract action new version
player addAction [
    "<t color='#FFFF00'>Radio for Extraction</t>", 
    {
	missionNamespace setVariable ["ExtractAction", false, true];
	missionNamespace setVariable ["RTBAction", true, true];
	{[_x,"ALL"] remoteExec ["disableAI",0,true];} forEach crew samlauncher;
	_scout = missionNamespace getVariable ["scout", objNull];
	params ["_target", "_caller", "_actionID", "_args"];
	if (_caller == _scout) then {
		["scoutextract", [_scout, covey]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _scout <= 100}];
		} else {
		["extract", [_caller, covey]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];
		};
	//sleep 60;
	_group = ExtractHeliGroup; 
	_markerName = "loiterSpot"; 
	_waypointPosition = getMarkerPos _markerName;
	_waypoint = _group addWaypoint [_waypointPosition, 0];
	_waypoint setWaypointType "LOITER";
	_waypoint setWaypointLoiterRadius 100; 
	_waypoint setWaypointLoiterType "CIRCLE_L";
    }, 
    nil, 
    8, 
    false, 
    true, 
    "", 
    "ExtractAction"
];

// deny smoke request
player addAction [
    "<t color='#FFFF00'>Confirm LZ (Bird Cleared to Land)</t>", 
    { 
    missionNamespace setVariable ["denyConfirmSmoke", false, true];
	_scout = missionNamespace getVariable ["scout", objNull];
	params ["_target", "_caller", "_actionID", "_args"];
	if (_caller == _scout) then {
		["scoutsmokedeny", [_scout, ranger]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _scout <= 100}];
		} else {
		["smokedeny", [_caller, ranger]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];
		};
	["scripts\extract.sqf"] remoteExec ["execVM"];
    }, 
    nil, 
    8, 
    false, 
    true, 
    "", 
    "denyConfirmSmoke"
];

/* delay smoke request
player addAction [
    "<t color='#FFFF00'>Delay Smoke Request</t>", 
    { 
    missionNamespace setVariable ["delayConfirmSmoke", false, true];
	_scout = missionNamespace getVariable ["scout", objNull];
	params ["_target", "_caller", "_actionID", "_args"];
	if (_caller == _scout) then {
		["scoutsmokedelay", [_scout, ranger]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _scout <= 100}];
		} else {
		["smokedelay", [_caller, ranger]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];
		};
    }, 
    nil, 
    8, 
    false, 
    true, 
    "", 
    "delayConfirmSmoke"
];
*/

// confirm smoke convo
player addAction [
    "<t color='#FFFF00'>Confirm Smoke Color (Bird Cleared to Land)</t>", 
    { 
    missionNamespace setVariable ["ActionConfirmSmoke", false, true];
	_scout = missionNamespace getVariable ["scout", objNull];
	params ["_target", "_caller", "_actionID", "_args"];
	if (_caller == _scout) then {
		["scoutsmokeconfirm", [_scout, ranger]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _scout <= 100}];
		} else {
		["smokeconfirm", [_caller, ranger]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];
		};
[	"scripts\extract.sqf"] remoteExec ["execVM"];
    }, 
    nil, 
    8, 
    false, 
    true, 
    "", 
    "ActionConfirmSmoke"
];

//bomb for weapon cache. Although normally you dont want non player object addactions here in OPR, this is needed because if a player uses the hold action
//it is removed from their action menu. If they die it will remember they used the hold action and wouldnt be able to use it again. Changing the hold
//action to repeat wont work cause there is an addaction nested in the hold action and they could repeatedly add the addaction to the obhect. Thus if we 
//place the hold action in OPR then the player will get the option to use it again regardless of death. And because of the remove action command in init
//duplicates of the hold action wont be a problem.
if (!isNil "weaponcache") then {
[
	weaponcache,
	"<t color='#FFFF00'>Place C-4 Plastic Explosive</t>",
	"a3\ui_f_oldman\data\igui\cfg\holdactions\destroy_ca.paa", //idle icon 
	"a3\ui_f_oldman\data\igui\cfg\holdactions\destroy_ca.paa", //progress icon
	"_this distance _target < 3", //condition
	"true", //condition progress
	{}, //code on start
	{}, // code every tick
	{
		["cachebombset", [_caller]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];
			
			player addAction [
			"<t color='#FF0000'>Detonate Weapons Cache</t>", 
			{
			missionNamespace setVariable ["weaponsCacheDestroyed", true, true];	
			"M_Mo_82mm_AT_LG" createVehicle (getPos weaponcache);
			sleep 1;
			deletevehicle weaponcache;
			deletevehicle ammo_crate2;
			deletevehicle ammo_crate3;
			deletevehicle shelter1;
			params ["_target", "_caller", "_actionID", "_args"];
			sleep 1;
			if (missionNamespace getvariable ["weaponsCacheDestroyed", false] && missionNamespace getvariable ["foodCacheDestroyed", false]) then {
				["cachepass", [_caller]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];
				};
			}, 
			nil, 
			8, 
			false, 
			true,
			"",
			"_this distance weaponcache < 60"
			];

	}, // code on finish
	{}, // code on interuption
	[], //arguements
	3, //duration
	8, //order from top
	true, //remove on finish
	false, //show if unconcious
	false //show in middle of screen
] call BIS_fnc_holdActionAdd;
};

//bomb for food cache
if (!isNil "foodcache") then {
[
	foodcache,
	"<t color='#FFFF00'>Place C-4 Plastic Explosive</t>",
	"a3\ui_f_oldman\data\igui\cfg\holdactions\destroy_ca.paa", //idle icon 
	"a3\ui_f_oldman\data\igui\cfg\holdactions\destroy_ca.paa", //progress icon
	"_this distance _target < 3", //condition
	"true", //condition progress
	{}, //code on start
	{}, // code every tick
	{
		["cachebombset", [_caller]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];
			
			player addAction [
			"<t color='#FF0000'>Detonate Food Cache</t>", 
			{
			missionNamespace setVariable ["foodCacheDestroyed", true, true];
			"M_Mo_82mm_AT_LG" createVehicle (getPos foodcache);
			sleep 1;
			deletevehicle foodcache;
			deletevehicle food1;
			deletevehicle food4;
			deletevehicle food5;
			deletevehicle food6;
			deletevehicle food7;
			deletevehicle food8;
			deletevehicle food9;
			deletevehicle food10;
			params ["_target", "_caller", "_actionID", "_args"];
			sleep 1;
			if (missionNamespace getvariable ["weaponsCacheDestroyed", false] && missionNamespace getvariable ["foodCacheDestroyed", false]) then {
				["cachepass", [_caller]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];
				};
			}, 
			nil, 
			8, 
			false, 
			true,
			"",
			"_this distance foodcache < 60"
			];
		
	}, // code on finish
	{}, // code on interuption
	[], //arguements
	3, //duration
	8, //order from top
	true, //remove on finish
	false, //show if unconcious
	false //show in middle of screen
] call BIS_fnc_holdActionAdd;
};
