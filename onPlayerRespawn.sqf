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
	"ActionCallHQ && (player in units playerGroup)", //condition
	"true", //condition progress
	{}, //code on start
	{}, // code every tick
	{
		params ["_target", "_caller", "_actionID", "_args"]; //needed for finding player that made the action
		missionNamespace setVariable ["ActionCallHQ", false, true];
		if (_caller == missionNamespace getVariable ["scout", objNull]) then {
			["radiohqScout", [_caller, HQRadio], true] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];
		} else {
			["radiohq1", [_caller, HQRadio], true] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];
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
		["scoutcallPOW", [_caller, pow], true] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];
		} else {
		["callPOW", [_caller, pow], true] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];
		};

		sleep 20;
		POW setPosATL (getPosATL ExitSpot);
		sleep 1;

		if (_caller == _scout) then {
		["scoutPOWexits", [_caller, pow], true] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];
		} else {
		["POWexits", [_caller, pow], true] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];
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
	"ExtractAction && (player in units playerGroup)", //condition
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
			["scoutextract", [_scout, covey], true] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _scout <= 100}];
		} else {
			["extract", [_caller, covey], true] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];
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
	"<t color='#FFFF00'>Confirm Smoke Color (Ranger Cleared to Land)</t>",
	"a3\missions_f_oldman\data\img\holdactions\holdaction_talk_ca.paa", //idle icon 
	"a3\missions_f_oldman\data\img\holdactions\holdaction_talk_ca.paa", //progress icon
	"ActionConfirmSmoke && (player in units playerGroup)", //condition
	"true", //condition progress
	{}, //code on start
	{}, // code every tick
	{
		missionNamespace setVariable ["ActionConfirmSmoke", false, true];
		_scout = missionNamespace getVariable ["scout", objNull];
		params ["_target", "_caller", "_actionID", "_args"];
		if (_caller == _scout) then {
			["scoutsmokeconfirm", [_scout, ranger], true] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _scout <= 100}];
		} else {
			["smokeconfirm", [_caller, ranger], true] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];
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
	"<t color='#FFFF00'>Confirm LZ (Ranger Cleared to Land)</t>",
	"a3\missions_f_oldman\data\img\holdactions\holdaction_talk_ca.paa", //idle icon 
	"a3\missions_f_oldman\data\img\holdactions\holdaction_talk_ca.paa", //progress icon
	"denyConfirmSmoke && (player in units playerGroup)", //condition
	"true", //condition progress
	{}, //code on start
	{}, // code every tick
	{
		missionNamespace setVariable ["denyConfirmSmoke", false, true];
		_scout = missionNamespace getVariable ["scout", objNull];
		params ["_target", "_caller", "_actionID", "_args"];
		if (_caller == _scout) then {
			["scoutsmokedeny", [_scout, ranger], true] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _scout <= 100}];
		} else {
			["smokedeny", [_caller, ranger], true] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _caller <= 100}];
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