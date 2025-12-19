// briefing pics 367*206

//create a custom ending for SOG
class CfgDebriefing
{
    class co03_victory
    {
        title =    $STR_VN_DEBRIEFING_VICTORY_TITLE;
        subtitle = $STR_VN_DEBRIEFING_VICTORY_SUBTITLE;
        description = $STR_VN_DEBRIEFING_CO03_VICTORY;
        pictureBackground = "vn\missions_f_vietnam\data\img\m03\debrief_success.jpg";
        
        vn_debrief_mission_text = $STR_VN_DEBRIEFING_CO03_OVERVIEW;
        vn_debrief_notes_text = $STR_VN_DEBRIEFING_CO03_NOTES;
        vn_debrief_background = "vn\missions_f_vietnam\data\img\debrief\debrief_03.paa";
    };
};


ptboat addAction ["<t color='#FFFF00'>Place Timed Explosive: 15 Minutes</t>", {timebomb = false; publicVariable "timebomb"; ["scripts\bomb.sqf"] remoteExec ["execVM", 0];}, nil, 8, false, true, "", "isNil 'timebomb'", 5.5]; 
ptboat addAction ["<t color='#FFFF00'>Place Timed Explosive: 30 Minutes</t>", {timebomb = false; publicVariable "timebomb"; ["scripts\bomb2.sqf"] remoteExec ["execVM", 0];}, nil, 8, false, true, "", "isNil 'timebomb'", 5.5]; 
ptboat addAction ["<t color='#FFFF00'>Place Timed Explosive: 45 Minutes</t>", {timebomb = false; publicVariable "timebomb"; ["scripts\bomb3.sqf"] remoteExec ["execVM", 0];}, nil, 8, false, true, "", "isNil 'timebomb'", 5.5];


// example of how to grab a sound file that is not a class
playSound3D [getMissionPath "sound\answer1.ogg", getPosASL Rankin, false, Rankin, 5];

// refer to discord convo with hypoxic if you forget this script
private _inHeli = vehicle pilot isKindOf "Helicopter"; //rescued pilot is in heli

if (!_inHeli) exitWith { false }; // dont run the code below unless rescue pilot is in helicopter

private _heli = vehicle pilot; // returns the vehicle the the pilot is in
private _inTriggerArea = pilot inArea myTrigger; // retruns true if the rescue pilot is in the trigger area
private _friendlyHeli = side group driver _heli == west; // returns true if the side of the group of the driver is WEST
private _allPlayersInHeli = units west findIf { // checks all west units and returns true if all players are alive and in the helicopter
    isPlayer _x &&
    alive _x &&
    !(_x in myHeli)
} == -1;

systemChat str [_inHeli, _inTriggerArea, _friendlyHeli, _allPlayersInHeli];
_inHeli && _inTriggerArea && _friendlyHeli && _allPlayersInHeli


// try this if having issues with set face
if (isServer) then { [_unit, "AsianHead_A3_02"] remoteExec ["setFace", 0, _unit] };
/* if the unit is created later in the game. However this will work only with stock faces, when player joins with a custom face into this unit,
all current players need to be force updated to the desired face as custom face overwrites current face. Use BIS_fnc_setIdenity for persistent identity.*/


//
//
//How to convert to remoteexec
_caller say3D ["question1",100];
_left say3D _right;
[_left, _right] remoteExec ["command"];
[_caller, ["question1",100]] remoteExec ["say3D"];

["scripts\bombs.sqf"] remoteExec ["execVM", 0, true]; //deafult 0 and false. if true then code will run for JIP players



//jet flyover script:
[[8500,5500,50],[8500,9500,50], 200, “normal”, “vn_o_air_mig19_cap”, EAST] call bis_fnc_ambientflyby;

for any smoke to fire trigger:
"vn_m18" in _magazine

case ("red" in toLower _smokeType): {"SmokeShellRed"};
					case ("blue" in toLower _smokeType): {"SmokeShellBlue"};
					case ("green" in toLower _smokeType): {"SmokeShellGreen"};
					case ("yellow" in toLower _smokeType): {"SmokeShellYellow"};
					case ("orange" in toLower _smokeType): {"SmokeShellOrange"};

[[7100,11000,0], [7100,3000,0], 175, "LIMITED", "vn_o_air_mig19_cap", WEST] call BIS_fnc_ambientFlyBy;

[[7200,11100,0], [7200,3000,0], 175, "LIMITED", "vn_o_air_mig19_cap", WEST] call BIS_fnc_ambientFlyBy;

76561197974183451 - player id

//helo support trigger
findIf{(_x isKindOf "Helicopter") && (_x isKindOf "Blufor")} > -1

//Can someone please help with this code? Someone wrote it for me on r/armadev and it works on local host and single player but doesnt work on dedicated server. What it does is locate a thrown purple smoke grenade within a marker and make it has infinite smoke plume. The trigger associated with it fires and completes the task but the smoke grenade doesn't quite work. Instead of infinite smoke plume the grenade pops and smokes for a second or two then is deleted and no smoke is created after it is deleted.
```if (isNil "mission_SmokeinLZArea") then {
	_player addEventHandler ["FiredMan", {
		params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle"];
		if !isNil "mission_SmokeinLZArea" exitWith {
			_unit removeEventHandler [_thisEvent, _thisEventHandler];
		};
		if (_weapon == "Throw" && {_magazine == "vn_m18_purple_mag"} && {_unit inArea "marker_1_lzArea"}) then {
			[_projectile] spawn {
				params ["_thrownSmoke"];
				waitUntil {uiSleep 1; abs speed _thrownSmoke == 0};
				if !(_thrownSmoke inArea "marker_1_lzArea") exitWith {};
				missionNamespace setVariable ["mission_SmokeinLZArea", true, true];
				private _smokeEmitter = "ModuleSmoke_F" createVehicleLocal getPos _thrownSmoke;
				_smokeEmitter setVariable ["repeat", 1];
				_smokeEmitter setVariable ["type", "SmokeShellPurple"];
				deleteVehicle _thrownSmoke;
			};
		};
	}];
};```

skipTime -24;
_RandomClouds = (random 1);
0 setOvercast _rand;
forceWeatherChange
999999 setOvercast _RandomClouds; //overcaast never changes
skipTime 24;

/*
[0.6 min 0.8 middle 1 max] can be _rand = (random [0.6, 0.8, 1]); 
In most cases, closer to the middle.
if need other method
[0, 1] call BIS_fnc_randomNum; [0, 1] call BIS_fnc_randomNum;
*/

//old style random convo
Define the array with your audio tracks
_MP1Tracks = [
    ["MP1_1", 75],  // First track and its volume
    ["MP1_2", 75],
	["MP1_3", 75]// Second track and its volume
];

// Randomly select an audio track from the array
_selectedTrack = selectRandom _MP1Tracks;

// Play the selected audio track
MP1 setRandomLip true;
MP1 say3D [_selectedTrack select 0, _selectedTrack select 1];
MP1 setRandomLip false;


sleep 5; // lets track finsish playing

// Define the array with your audio tracks
_MP2Tracks = [
    ["MP2_1", 100],  // First track and its volume
    ["MP2_2", 100],
	["MP2_3", 100]// Second track and its volume
];

// Randomly select an audio track from the array
_selectedTrack = selectRandom _MP2Tracks;

// Play the selected audio track
MP2 setRandomLip true;
MP2 say3D [_selectedTrack select 0, _selectedTrack select 1];
MP2 setRandomLip false;

/* Building the Final Convo.
_Convo1 = 
JeepDriver say3D "JeepDriver1_1";
JeepDriver setRandomLip true;
sleep 5;
JeepDriver setRandomLip false;

["MPBanter", "StagingArea", ["MPBanter1_1", "MPBanter1_4"]] spawn BIS_fnc_kbTell;

["MPBanter", "StagingArea", ["MPBanter2_1", "MPBanter2_4"]] spawn BIS_fnc_kbTell;

["MPBanter", "StagingArea", ["MPBanter3_1", "MPBanter3_5"]] spawn BIS_fnc_kbTell;

selectRandom _MPBanter;


_MPBanter = [
    ["MPBanter", "StagingArea", ["MPBanter1_1", "MPBanter1_4"]] spawn BIS_fnc_kbTell;,
    ["MPBanter", "StagingArea", ["MPBanter2_1", "MPBanter2_4"]] spawn BIS_fnc_kbTell;,
    ["MPBanter", "StagingArea", ["MPBanter3_1", "MPBanter3_5"]] spawn BIS_fnc_kbTell;
];

selectRandom _MPBanter;
*/

this action ["engineOff", vehicle heli]; // tirn of engines

if (isNil "mission_SmokeinLZArea") then {
	_player addEventHandler ["FiredMan", {
		params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle"];
		if !isNil "mission_SmokeinLZArea" exitWith {
			_unit removeEventHandler [_thisEvent, _thisEventHandler];
		};
		if (_weapon == "Throw" && {_magazine == "vn_m18_purple_mag"} && {_unit inArea "marker_1_lzArea"}) then {
			[_projectile] spawn {
				params ["_thrownSmoke"];
				waitUntil {uiSleep 1; abs speed _thrownSmoke == 0};
				if !(_thrownSmoke inArea "marker_1_lzArea") exitWith {};
				missionNamespace setVariable ["mission_SmokeinLZArea", true, true];
				private _smokeEmitter = "ModuleSmoke_F" createVehicleLocal getPos _thrownSmoke;
				_smokeEmitter setVariable ["repeat", 1];
				_smokeEmitter setVariable ["type", "SmokeShellPurple"];
				deleteVehicle _thrownSmoke;
			};
		};
	}];
};

findIf{(_x isKindOf "Helicopter") && (_x isKindOf "Blufor")} > -1 //Recognizes helo from SOGPF radio support module in a blurfor present trigger zone

76561197974183451 //arma 3 player id, useful for zeus

[[7200,11100,0], [7200,3000,0], 175, "LIMITED", "vn_o_air_mig19_cap", WEST] call BIS_fnc_ambientFlyBy; //jet flyby, kinda sucks because you must use coordinate positions

"vn_m18" in _magazine //for any smoke shell to be detected
case ("red" in toLower _smokeType): {"SmokeShellRed"};
					case ("blue" in toLower _smokeType): {"SmokeShellBlue"};
					case ("green" in toLower _smokeType): {"SmokeShellGreen"};
					case ("yellow" in toLower _smokeType): {"SmokeShellYellow"};
					case ("orange" in toLower _smokeType): {"SmokeShellOrange"};

// old version
["playersspotted",
		[
			[0, "", "answer", 0, { 
				if (player != (_this#0)) then { playsound "talkradio"; }; // plays the radio effect for all players minus the speaking player			
				_this#0 groupChat "Shit! Haul ass to the target, now!"; // provides subtitle for radio transmission above
				}
			],
			[1, "", "answer", 0, { 
				if (player != (_this#1)) then { playsound "talkradio"; }; 			
				_this#1 groupChat "I go now!";
				}
			]
		]
	]


["playersspottedLumphat",
	[
		[0, "", "answer", 0, {
			if (alive officer) then {
				if (player != (_this#0)) then { playsound "talkradio"; }; 
				leader player sideChat "Fuck! Take out the target now!";
				} else {
				if (player != (_this#0)) then { playsound "talkradio"; }; 
				leader player sideChat "Fuck! Put these bastards in the ground, quick!";
				};
			}
		]
	]
]

// old version of finding intel.
this setPosATL (getPosATL (selectRandom [gunboat_file_pos_1, gunboat_file_pos_2, gunboat_file_pos_3]));

// old generator version
_unitsInArea = (switchableUnits + playableUnits) select {  
    (_x inArea generatorArea) && (alive _x)  
}; 

private ["_selectedUnit"];
if (count _unitsInArea > 0) then { 
    _selectedUnit = selectRandom _unitsInArea;
};

["idea", [_selectedUnit]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance generator <= 25}];

// old pilot convo 
_unitsInArea = (switchableUnits + playableUnits) select {  
    (_x inArea pilot_trigger) && (alive _x)  
}; 

private ["_selectedUnit"];
if (count _unitsInArea > 0) then { 
    _selectedUnit = selectRandom _unitsInArea;
};

["pilotdown", [_selectedUnit]] remoteExec [
    "FoxClub_fnc_Conversation", 
    allPlayers select {_x distance _selectedUnit <= 100}];

// old pilot meet and greet 
thisList spawn {

_firstUnit = _this#0;
pilot lookAt _firstUnit;
sleep 1;
pilot playmove "Acts_PercMstpSlowWrflDnon_handup2"; 
deletemarker "PilotArea";
deletemarker "RescuePilotText";

["meet", [pilot, _firstUnit]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance pilot <= 100}];

sleep 15;
[pilot] join _firstUnit;
[pilot, true] remoteExec ["allowdamage", 0, true];
[pilot, "PATH"] remoteExec ["enableai", 0, true];

};

// simulates the convo over the radio by not letting the player who is talking hear the static sound file.
,
	["gunboatpass",
		[
			[0,"", "answer", 0, {
				if (player != (_this#0)) then { playsound "talkradio"; };  
				_this#0 sideChat "Gunboat’s toast!";
				}
			]
		]
	]

// old holdaction 
/*
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
*/

,
	["entertunnel",
		[
			[0, "", "answer", 0, {
				if (player != (_this#0)) then { playsound "talkradio"; };  
				_this#0 sideChat "Oh shit... We've got a rat hole here. A big one too by the looks of it.";
				}
			]
		]
	],
	["scoutentertunnel",
		[
			[0, "", "answer", 0, {
				if (player != (_this#0)) then { playsound "talkradio"; };  
				_this#0 sideChat "Big rat hole. Be quiet. Many V.C.";
				}
			]
		]
	]

thisList spawn {

_firstUnit = _this#0;
_scout = missionNamespace getVariable ["scout", objNull];

if (_firstUnit == _scout) then {

["scoutentertunnel", [_firstUnit]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _firstUnit <= 100}];

} else {

["entertunnel", [_firstUnit]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance _firstUnit <= 100}];

};

};

//
!(_this in [scout]) && !(_originalTarget getVariable ['foxclub_var_isTalking',false]) && ActionTalkToPOW5

//
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

//_group = ExtractHeliGroup;
//_extractionPosition = getMarkerPos "extractionSpot";  
_loiterPosition = getMarkerPos "loiterSpot";

//_wp1 = ExtractHeliGroup addWaypoint [_extractionPosition, 0];
//_wp1 setWaypointType "MOVE";

_wp2 = ExtractHeliGroup addWaypoint [_loiterPosition, 0];
_wp2 setWaypointType "LOITER";
_wp2 setWaypointLoiterRadius 100; 
_wp2 setWaypointLoiterType "CIRCLE";


/* old style heli RTB holdaction condition:
Reworked new condition for RTB and how arma deals with repawns if a player dies then the heli takes off.
    - The condition correctly checks to make sure all players are in the heli, minus downed players. 
    - Players dead and at the respawn screen can spawn back into the heli.
    - Injured, dead, or downed players will not block the heicopter from leaving.
*/

private _conditionExtract = {
    ((allPlayers select { alive _x && lifeState _x != "INCAPACITATED" }) - crew ExtractHeli) isEqualTo []
    && { missionNamespace getVariable ["actionReturnToBase", false] }
};

// old extract heli condiiton 
this && units west findIf {isPlayer _x && alive _x && !(_x in extractheli)} == -1;

// old extraction fail conditon:
this && 
extractheli in thislist &&
(
    (units playerGroup)
    + (if ((missionNamespace getVariable ["powFound", false]) && {!isNull pow} && {alive pow}) then {[pow]} else {[]})
    + (if ((missionNamespace getVariable ["pilotEjected", false]) && {!isNull pilot} && {alive pilot}) then {[pilot]} else {[]})
) findIf { alive _x && !(_x in extractheli) } != -1


//////////////////////////////////////////////////
//                                              //
//   STOP FLOATING OBJECTS ON DESTROYED HUTS    //
//                                              //
//////////////////////////////////////////////////
// oldest version
myBuilding = ((nearestObjects [getpos chair1,["Land_vn_hut_02"],20])#0);
myBuilding2 = ((nearestObjects [getpos hut_table2,["Land_vn_hut_07"],20])#0);
myBuilding3 = ((nearestObjects [getpos hut3_wire1,["Land_vn_hut_06"],20])#0);
myBuildgunboat1 = ((nearestObjects [getpos gunboat_file,["Land_vn_hut_02"],20])#0);
myBuildgunboat2 = ((nearestObjects [getpos gunboat_file,["Land_vn_hut_01"],20])#0);
myBuildgunboat3 = ((nearestObjects [getpos gunboat_file,["Land_vn_hut_07"],20])#0);
myBuildcache1 = ((nearestObjects [getpos photo,["Land_vn_hut_02"],20])#0);
myBuildcache2 = ((nearestObjects [getpos photo,["Land_vn_hut_02"],20])#0);
myBuildcache2 = ((nearestObjects [getpos photo,["Land_vn_hut_01"],20])#0);
myBuildsam1 = ((nearestObjects [getpos samsite_file,["Land_vn_hut_07"],20])#0);
myBuildsam2 = ((nearestObjects [getpos samsite_file,["Land_vn_c_prop_car_01"],20])#0);
myBuildsam3 = ((nearestObjects [getpos samsite_file,["Land_vn_hut_07"],20])#0);

addMissionEventHandler ["BuildingChanged", {
    params ["_from", "_to", "_isRuin"];
    if (_from isEqualTo myBuilding) then
    {
        deleteVehicle chair1;
		deleteVehicle desk1;
		deleteVehicle radio_hut1;
		deleteVehicle hut_cup1;
		deleteVehicle hut_cup2;
		deleteVehicle hut_cup3;
		deleteVehicle hut_trash1;
		//hint "hut 1 deleted"; // put your deleteVehicle commands here
    };
	if (_from isEqualTo myBuilding2) then
    {
        deleteVehicle hut_table2;
		deleteVehicle hut_bench;
		deleteVehicle hut2_chair1;
		deleteVehicle hut2_table2;
		deleteVehicle hut2_bed1;
		deleteVehicle hut2_bedroll1;
		//hint "hut 2 deleted"; // put your deleteVehicle commands here
    };
	if (_from isEqualTo myBuilding3) then
    {
        deleteVehicle hut3_wire1;
		deleteVehicle hut3_table1;
		deleteVehicle hut3_chair1;
		deleteVehicle hut3_stool1;
		deleteVehicle hut3_bench1;
		deleteVehicle cachetask;
		deleteVehicle photo;
		//hint "hut 3 deleted"; // put your deleteVehicle commands here
    };
	if (_from isEqualTo myBuildgunboat1) then
    {
        deleteVehicle gunboattask;
		deleteVehicle gunboat_file;
		//hint "boat file deleted"; // put your deleteVehicle commands here
    };
	if (_from isEqualTo myBuildgunboat2) then
    {
        deleteVehicle gunboattask;
		deleteVehicle gunboat_file;
		//hint "boat file deleted"; // put your deleteVehicle commands here
    };
	if (_from isEqualTo myBuildgunboat3) then
    {
        deleteVehicle gunboattask;
		deleteVehicle gunboat_file;
		//hint "boat file deleted"; // put your deleteVehicle commands here
    };
	if (_from isEqualTo myBuildcache1) then
    {
        deleteVehicle photo;
		deleteVehicle cachetask;
		//hint "cache file deleted"; // put your deleteVehicle commands here
    };
	if (_from isEqualTo myBuildcache2) then
    {
        deleteVehicle photo;
		deleteVehicle cachetask;
		//hint "cache file deleted"; // put your deleteVehicle commands here
    };
	if (_from isEqualTo myBuildcache3) then
    {
        deleteVehicle photo;
		deleteVehicle cachetask;
		//hint "cache file deleted"; // put your deleteVehicle commands here
    };
	if (_from isEqualTo myBuildsam1) then
    {
        deleteVehicle samsite_file;
		deleteVehicle samtask;
		//hint "samsite file deleted"; // put your deleteVehicle commands here
    };
	if (_from isEqualTo myBuildsam2) then
    {
        deleteVehicle samsite_file;
		deleteVehicle samtask;
		//hint "samsite file deleted"; // put your deleteVehicle commands here
    };
	if (_from isEqualTo myBuildsam3) then
    {
        deleteVehicle samsite_file;
		deleteVehicle samtask;
		//hint "samsite file deleted"; // put your deleteVehicle commands here
    };
}];

// Newest way to delete floating objects. Abandoned due to inconsistancies with the EH being triggered 
addMissionEventHandler ["BuildingChanged", {
	params ["_from", "_to", "_isRuin"];

	
		// Classes to exclude from deletion
		private _excludeClasses = [
			"Land_vn_hut_01_ruin", "Land_vn_hut_02_ruin", "Land_vn_hut_03_ruin", "Land_vn_hut_04_ruin",
			"#destructioneffects", "#explosion", "#crateronvehicle", "vn_m10_ammo", "Land_vn_stallwater_f"
		];

		private _nearObjs = _from nearObjects 7;

		private _toDelete = [];
		private _skipped  = [];

		{
			if (
				!(_excludeClasses find typeOf _x > -1)	   // not in exclude list
				&& {!(_x isKindOf "AllVehicles")}			// excludes from deletion men and vehicles
			) then {
				_toDelete pushBack _x;
			} else {
				_skipped pushBack _x;
			};
		} forEach _nearObjs;

		// Log all at once
		diag_log format ["Deleting objects: %1", _toDelete];
		diag_log format ["Skipped objects (excluded class): %1", _skipped];

		// Actually delete
		{ deleteVehicle _x; } forEach _toDelete;
	
}];

// old smoke EH
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


//missionNamespace getvariable ["weaponCacheActionID", false]
    // these are the correct way to remove holdactions. Just make sure that the holdACtion itself is in a variable.
	[weaponcache, missionNamespace getvariable ["weaponCacheActionID", false]] call BIS_fnc_holdActionRemove;
    [foodcache, missionNamespace getvariable ["foodCacheActionID", false]] call BIS_fnc_holdActionRemove;
    //[weaponcache, _weaponCacheActionID] call BIS_fnc_holdActionRemove;
	//[foodcache, _foodCacheActionID] call BIS_fnc_holdActionRemove;
	//removeAllActions weaponcache; //now its not removing holdaction. also intermittant
	//removeAllActions foodcache; //now its not removing holdaction. also intermittant


//////////////////////////////////////////////////
//                                              //
//          OVERWRITE SOG REVIVE CONVO          //
//                                              //
//////////////////////////////////////////////////

// How to overwrite the SOG advance revive conversation so that you can use your convo function. Define this is description.ext
class vn
    {
        class revive
        {
            class revive_conversation
            {
                file = "functions\fn_disableReviveConversation.sqf";
            };
        };
    };


// Place this in the sqf
hint "Override function fn_disableReviveConversation is running";

// The main issue I've found with their system is that _user is called twice on one action. For example after the holdAction for stabilizing completes the _user will be the _caller for the action, say their line, then after that this script will fire again but this time _user will be _target.

params ["_user", "_action"];

if (!alive _user) exitWith {};

private _scout  = missionNamespace getVariable ["scout", objNull];

private _radius = 6;
private _near = _user nearEntities ["CAManBase", _radius];
private _downed = _near select {
    _x != _user && lifeState _x == "INCAPACITATED"
};

private _responder = objNull;
private _minDist = _radius + 1;

{
    private _dist = _x distance _user;
    if (_dist < _minDist) then {
        _minDist = _dist;
        _responder = _x;
    };
} forEach _downed;

private _convo = switch (_action) do {

    case "help": {
        systemChat "help case fired.";
        "revive_help";
    };

    case "heal": {
    systemChat "heal case fired.";

        if (_user != _scout && _responder != _scout) then {
            systemChat "neither user nor responder is scout.";
            ["heal_blu_blu", [_user, _responder]]
                remoteExec ["foxclub_fnc_conversation", 0];
        }
        else {
            if (_user != _scout && _responder == _scout) then {
                systemChat "user is not the scout but the responder is.";
                ["heal_blu_scout", [_user, _responder]]
                    remoteExec ["foxclub_fnc_conversation", 0];
            }
            else {
                systemChat "user is the scout.";
                ["heal_scout_blu", [_user, _responder]]
                    remoteExec ["foxclub_fnc_conversation", 0];
            };
        };
    };

    case "revive": {
        systemChat "revive case fired.";

        if (_user != _scout && _responder != _scout) then {
            systemChat "neither user nor responder is scout.";
            ["revive_blu_blu", [_user, _responder]]
                remoteExec ["foxclub_fnc_conversation", 0];
        }
        else {
            if (_user != _scout && _responder == _scout) then {
                systemChat "user is not the scout but the responder is.";
                ["revive_blu_scout", [_user, _responder]]
                    remoteExec ["foxclub_fnc_conversation", 0];
            }
            else {
                systemChat "user is the scout.";
                ["revive_scout_blu", [_user, _responder]]
                    remoteExec ["foxclub_fnc_conversation", 0];
            };
        };
    };

    
    case "drag_player": { systemChat "drag_player case fired."; };
    case "undrag_player": { systemChat "undrag_player case fired."; };
    case "pickup_player": { systemChat "pickup_player case fired."; };
    case "drop_player": { systemChat "drop_player case fired."; };
    case "carried": { systemChat "carried case fired."; };
    case "dragged": { systemChat "dragged case fired."; };
    case "general": { systemChat "general case fired."; };

    default { "" };
};


_respawn_mode = [player, missionNamespace] select _respawn_mode; // selects based on 1 or 0 like the true or false

