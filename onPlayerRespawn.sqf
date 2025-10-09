/*
    File: onPlayerRespawn.sqf
    Author: FoxClubNiner
    Description:
        Runs on player respawn. This event script will also fire at the beginning of a mission if respawnOnStart is 0 or 1
*/

//////////////////////////////////////////////////
//                                              //
//            HOLD ACTION FOR RADIO HQ          //
//                                              //
//////////////////////////////////////////////////

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


//////////////////////////////////////////////////
//                                              //
//      HOLD ACTION FOR WEAPON CACHE BOMB       //
//                                              //
//////////////////////////////////////////////////
/* 
bomb for weapon cache. Although normally you dont want non-player object addactions here in OPR, this is needed because if a player uses the hold action
it is removed from their action menu. If they die it will remember they used the hold action and wouldnt be able to use it again. Changing the hold
action to repeat wont work cause there is an addaction nested in the hold action and they could repeatedly add the addaction to the obhect. Thus if we 
place the hold action in OPR then the player will get the option to use it again regardless of death. And because of the remove action command in init
duplicates of the hold action wont be a problem.
*/

if (!isNil "weaponcache") then {
_weaponCacheActionID = [
	weaponcache,
	"<t color='#FFFF00'>Place C-4 Plastic Explosive</t>",
	"a3\ui_f_oldman\data\igui\cfg\holdactions\destroy_ca.paa", //idle icon 
	"a3\ui_f_oldman\data\igui\cfg\holdactions\destroy_ca.paa", //progress icon
	"_this distance _target < 3", //condition
	"true", //condition progress
	{
		params ["_target", "_caller", "_actionID", "_args"];
		_scout   = missionNamespace getVariable ["scout", objNull];
		private _convo = ["cachebombPlace", "cachebombPlaceScout"] select (_caller == _scout);
		[_convo, [_caller]] remoteExec [
			"FoxClub_fnc_Conversation", 
			allPlayers select {_x distance _caller <= 100}];
	}, //code on start
	{}, // code every tick
	{
		params ["_target", "_caller", "_actionID", "_args"];
		_scout   = missionNamespace getVariable ["scout", objNull];
		private _convo = ["cachebombset", "cachebombsetScout"] select (_caller == _scout);
		[_convo, [_caller]] remoteExec [
			"FoxClub_fnc_Conversation", 
			allPlayers select {_x distance _caller <= 100}];
		// holdAction
		[
		player,
		"<t color='#FF0000'>Detonate Weapons Cache</t>",
		"a3\ui_f_oldman\data\igui\cfg\holdactions\destroy_ca.paa", //idle icon 
		"a3\ui_f_oldman\data\igui\cfg\holdactions\destroy_ca.paa", //progress icon
		"_this distance weaponcache < 60", //condition
		"true", //condition progress
		{
			params ["_target", "_caller", "_actionID", "_args"];
			_scout   = missionNamespace getVariable ["scout", objNull];
			private _convo = ["cachebombCount", "cachebombCountScout"] select (_caller == _scout);
			[_convo, [_caller]] remoteExec [
				"FoxClub_fnc_Conversation", 
				allPlayers select {_x distance _caller <= 100}];	
		}, //code on start
		{}, // code every tick
		{	
			params ["_target", "_caller", "_actionID", "_args"];
			_scout   = missionNamespace getVariable ["scout", objNull];
			private _convo = ["cachepass", "cachepassScout"] select (_caller == _scout);
			missionNamespace setVariable ["weaponsCacheDestroyed", true, true];	
			"M_Mo_82mm_AT_LG" createVehicle (getPos weaponcache);
			sleep 1;
			deletevehicle weaponcache;
			deletevehicle ammo_crate2;
			deletevehicle ammo_crate3;
			deletevehicle shelter1;
			sleep 1;
			if (missionNamespace getvariable ["weaponsCacheDestroyed", false] && 
				missionNamespace getvariable ["foodCacheDestroyed", false]) then {
					[_convo, [_caller]] remoteExec [
						"FoxClub_fnc_Conversation", 
						allPlayers select {_x distance _caller <= 100}];
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
	}, // code on finish
	{}, // code on interuption
	[], //arguements
	3, //duration
	8, //order from top
	true, //remove on finish
	false, //show if unconcious
	false //show in middle of screen
] call BIS_fnc_holdActionAdd;
missionNamespace setVariable ["weaponCacheActionID", _weaponCacheActionID];
};


//////////////////////////////////////////////////
//                                              //
//        HOLD ACTION FOR FOOD CACHE BOMB       //
//                                              //
//////////////////////////////////////////////////

if (!isNil "foodcache") then { // have to do the nil check because you would get an error since this runs on respawn and the foodcache might not be alive.
_foodCacheActionID = [
	foodcache,
	"<t color='#FFFF00'>Place C-4 Plastic Explosive</t>",
	"a3\ui_f_oldman\data\igui\cfg\holdactions\destroy_ca.paa", //idle icon 
	"a3\ui_f_oldman\data\igui\cfg\holdactions\destroy_ca.paa", //progress icon
	"_this distance _target < 3", //condition
	"true", //condition progress
	{
		params ["_target", "_caller", "_actionID", "_args"];
		_scout   = missionNamespace getVariable ["scout", objNull];
		private _convo = ["cachebombPlace", "cachebombPlaceScout"] select (_caller == _scout);
		[_convo, [_caller]] remoteExec [
			"FoxClub_fnc_Conversation", 
			allPlayers select {_x distance _caller <= 100}];
	}, //code on start
	{}, // code every tick
	{
		params ["_target", "_caller", "_actionID", "_args"];
		_scout   = missionNamespace getVariable ["scout", objNull];
		private _convo = ["cachebombset", "cachebombsetScout"] select (_caller == _scout);
		[_convo, [_caller]] remoteExec [
			"FoxClub_fnc_Conversation", 
			allPlayers select {_x distance _caller <= 100}];
		// holdAction
		[
		player,
		"<t color='#FF0000'>Detonate Food Cache</t>",
		"a3\ui_f_oldman\data\igui\cfg\holdactions\destroy_ca.paa", //idle icon 
		"a3\ui_f_oldman\data\igui\cfg\holdactions\destroy_ca.paa", //progress icon
		"_this distance foodcache < 60", //condition
		"true", //condition progress
		{
			params ["_target", "_caller", "_actionID", "_args"];
			_scout   = missionNamespace getVariable ["scout", objNull];
			private _convo = ["cachebombCount", "cachebombCountScout"] select (_caller == _scout);
			[_convo, [_caller]] remoteExec [
				"FoxClub_fnc_Conversation", 
				allPlayers select {_x distance _caller <= 100}];	
		}, //code on start
		{}, // code every tick
		{	
			params ["_target", "_caller", "_actionID", "_args"];
			_scout   = missionNamespace getVariable ["scout", objNull];
			private _convo = ["cachepass", "cachepassScout"] select (_caller == _scout);
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
			sleep 1;
			if (missionNamespace getvariable ["weaponsCacheDestroyed", false] && 
				missionNamespace getvariable ["foodCacheDestroyed", false]) then {
					[_convo, [_caller]] remoteExec [
						"FoxClub_fnc_Conversation", 
						allPlayers select {_x distance _caller <= 100}];
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
	}, // code on finish
	{}, // code on interuption
	[], //arguements
	3, //duration
	8, //order from top
	true, //remove on finish
	false, //show if unconcious
	false //show in middle of screen
] call BIS_fnc_holdActionAdd;
missionNamespace setVariable ["foodCacheActionID", _foodCacheActionID];
};

//////////////////////////////////////////////////
//                                              //
//        HOLD ACTION FOR SAM MISSLE BOMB       //
//                                              //
//////////////////////////////////////////////////

if (!isNil "samlauncher") then { // have to do the nil check because you would get an error since this runs on respawn and the foodcache might not be alive.
_samlauncherActionID = [
	samlauncher,
	"<t color='#FFFF00'>Place C-4 Plastic Explosive</t>",
	"a3\ui_f_oldman\data\igui\cfg\holdactions\destroy_ca.paa", //idle icon 
	"a3\ui_f_oldman\data\igui\cfg\holdactions\destroy_ca.paa", //progress icon
	"_this distance _target < 3", //condition
	"true", //condition progress
	{
		params ["_target", "_caller", "_actionID", "_args"];
		_scout   = missionNamespace getVariable ["scout", objNull];
		private _convo = ["cachebombPlace", "cachebombPlaceScout"] select (_caller == _scout);
		[_convo, [_caller]] remoteExec [
			"FoxClub_fnc_Conversation", 
			allPlayers select {_x distance _caller <= 100}];
	}, //code on start
	{}, // code every tick
	{
		params ["_target", "_caller", "_actionID", "_args"];
		_scout   = missionNamespace getVariable ["scout", objNull];
		private _convo = ["cachebombset", "cachebombsetScout"] select (_caller == _scout);
		[_convo, [_caller]] remoteExec [
			"FoxClub_fnc_Conversation", 
			allPlayers select {_x distance _caller <= 100}];
		// holdAction
		[
		player,
		"<t color='#FF0000'>Detonate Food Cache</t>",
		"a3\ui_f_oldman\data\igui\cfg\holdactions\destroy_ca.paa", //idle icon 
		"a3\ui_f_oldman\data\igui\cfg\holdactions\destroy_ca.paa", //progress icon
		"_this distance samlauncher < 60", //condition
		"true", //condition progress
		{
			params ["_target", "_caller", "_actionID", "_args"];
			_scout   = missionNamespace getVariable ["scout", objNull];
			private _convo = ["cachebombCount", "cachebombCountScout"] select (_caller == _scout);
			[_convo, [_caller]] remoteExec [
				"FoxClub_fnc_Conversation", 
				allPlayers select {_x distance _caller <= 100}];	
		}, //code on start
		{}, // code every tick
		{	
			params ["_target", "_caller", "_actionID", "_args"];
			_scout   = missionNamespace getVariable ["scout", objNull];
			private _convo = ["cachepass", "cachepassScout"] select (_caller == _scout);
			missionNamespace setVariable ["samlauncherDestroyed", true, true];
			"M_Mo_82mm_AT_LG" createVehicle (getPos samlauncher);
			sleep 1;
			deletevehicle samlauncher;
			sleep 1;
			if (missionNamespace getvariable ["weaponsCacheDestroyed", false] && 
				missionNamespace getvariable ["samlauncherDestroyed", false]) then {
					[_convo, [_caller]] remoteExec [
						"FoxClub_fnc_Conversation", 
						allPlayers select {_x distance _caller <= 100}];
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
	}, // code on finish
	{}, // code on interuption
	[], //arguements
	3, //duration
	8, //order from top
	true, //remove on finish
	false, //show if unconcious
	false //show in middle of screen
] call BIS_fnc_holdActionAdd;
missionNamespace setVariable ["foodCacheActionID", _foodCacheActionID];
};


//////////////////////////////////////////////////
//                                              //
//             CALL POW TO SURFACE              //
//                                              //
//////////////////////////////////////////////////

[
	player,
	"<t color='#FFFF00'>Call POW with Field Telephone</t>",
	"a3\missions_f_oldman\data\img\holdactions\holdaction_talk_ca.paa", //idle icon 
	"a3\missions_f_oldman\data\img\holdactions\holdaction_talk_ca.paa", //progress icon
	"_this distance fieldtelephone < 4 && ActionCallPOW && alive pow", //condition
	"true", //condition progress
	{}, //code on start
	{}, // code every tick
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
//     RADIO FOR EXTRACTION - HELI LOITERS      //
//                                              //
//////////////////////////////////////////////////

[
	player,
	"<t color='#FFFF00'>Radio for Extraction</t>",
	"a3\missions_f_oldman\data\img\holdactions\holdaction_talk_ca.paa", //idle icon 
	"a3\missions_f_oldman\data\img\holdactions\holdaction_talk_ca.paa", //progress icon
	"ExtractAction", //condition
	"true", //condition progress
	{}, //code on start
	{}, // code every tick
	{
		missionNamespace setVariable ["ExtractAction", false, true];
		// missionNamespace setVariable ["RTBAction", true, true];
		{[_x,"ALL"] remoteExec ["disableAI",0,true];} forEach crew samlauncher;
		_scout = missionNamespace getVariable ["scout", objNull];
		params ["_target", "_caller", "_actionID", "_args"];
		if (_caller == _scout) then {
			["scoutextract", [_scout, covey]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _scout <= 100}];
		} else {
			["extract", [_caller, covey]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];
		};
		//sleep 60; // use to set how long it takes for the heli to come
		_loiterPosition = getMarkerPos "loiterSpot";
		_wp1 = ExtractHeliGroup addWaypoint [_loiterPosition, 0];
		_wp1 setWaypointType "LOITER";
		_wp1 setWaypointLoiterRadius 100; 
		_wp1 setWaypointLoiterType "CIRCLE";
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
//    CONFIRM SMOKE COLOR CONVO - LAND AT LZ    //
//                                              //
//////////////////////////////////////////////////

[
	player,
	"<t color='#FFFF00'>Confirm Smoke Color (Bird Cleared to Land)</t>",
	"a3\missions_f_oldman\data\img\holdactions\holdaction_talk_ca.paa", //idle icon 
	"a3\missions_f_oldman\data\img\holdactions\holdaction_talk_ca.paa", //progress icon
	"ActionConfirmSmoke", //condition
	"true", //condition progress
	{}, //code on start
	{}, // code every tick
	{
		missionNamespace setVariable ["ActionConfirmSmoke", false, true];
		_scout = missionNamespace getVariable ["scout", objNull];
		params ["_target", "_caller", "_actionID", "_args"];
		if (_caller == _scout) then {
			["scoutsmokeconfirm", [_scout, ranger]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _scout <= 100}];
		} else {
			["smokeconfirm", [_caller, ranger]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];
		};
		["scripts\extract.sqf"] remoteExec ["execVM"];
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
//          NO SMOKE CONVO - LAND AT LZ         //
//                                              //
//////////////////////////////////////////////////

[
	player,
	"<t color='#FFFF00'>Confirm LZ (Bird Cleared to Land)</t>",
	"a3\missions_f_oldman\data\img\holdactions\holdaction_talk_ca.paa", //idle icon 
	"a3\missions_f_oldman\data\img\holdactions\holdaction_talk_ca.paa", //progress icon
	"denyConfirmSmoke", //condition
	"true", //condition progress
	{}, //code on start
	{}, // code every tick
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
	}, // code on finish
	{}, // code on interuption
	[], //arguements
	3, //duration
	8, //order from top
	true, //remove on finish
	false, //show if unconcious
	false //show in middle of screen
] call BIS_fnc_holdActionAdd;