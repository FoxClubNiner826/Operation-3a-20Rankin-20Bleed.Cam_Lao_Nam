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