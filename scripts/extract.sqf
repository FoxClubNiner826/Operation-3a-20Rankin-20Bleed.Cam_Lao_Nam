/*
    File: extract.sqf
    Author: FoxClubNiner
    Description:
        Tells helicopter to land at a specific point. Executed from an addAction in onPlayerRespawn.sqf
*/

[] spawn {
	private _heli = ExtractHeli;
	private _helipad = ExtractHelipad;   // invisible helipad object
	private _clearRadius = 5;

	while {true} do {
		private _objectsNearby = _helipad nearEntities [["Man", "Tank", "Car", "StaticWeapon"], _clearRadius];
		private _heliCanLand = _heli landAt [_helipad, "GetIn"];

		if (_heliCanLand) then {
			_heli landAt [getPos _helipad, "GetIn", 9999];
			systemChat "The extraction helicopter is landing!";
			break; // exit loop once landing command issued
		} else {
			// report blocking units
			private _names = _objectsNearby apply {
				getText (configFile >> "CfgVehicles" >> typeOf _x >> "displayName")
			};
			systemChat format ["The LZ is blocked by: %1", _names joinString ", "];

			// move helipad 5m in random direction
			private _dir = random 360;
			private _pos = getPos _helipad;
			private _newPos = [
				(_pos select 0) + 5 * cos _dir,
				(_pos select 1) + 5 * sin _dir,
				_pos select 2
			];
			_helipad setPos _newPos;
		};

		sleep 1;
	};
};


    
/*
private _lz = createVehicle [
    "Land_vn_helipadempty_f",   // type (classname)
    [8584.56, 8187.52, 0],      // position array
    [],                         // no markers
    0,                          // exact spot
    "NONE"                      // place normally
];

[ExtractHeliGroup, getPosATL _lz, ExtractHeli] spawn BIS_fnc_wpLand;


// working code
_group = ExtractHeliGroup;
_markerName = "moveToLZ"; 
_waypointPosition = getMarkerPos _markerName;
_waypoint = _group addWaypoint [_waypointPosition, 0];
_waypoint setWaypointType "MOVE";
_group setCurrentWaypoint [_group, 2];
[ExtractHeliGroup, [8584.56,8187.52,0], ExtractHeli] spawn BIS_fnc_wpLand;

// new working code 
_group = ExtractHeliGroup;
_markerName = "moveToLZ"; 
_waypointPosition = getMarkerPos _markerName;
_waypoint = _group addWaypoint [_waypointPosition, 0];
_waypoint setWaypointType "MOVE";
_group setCurrentWaypoint [_group, 2];
ExtractHeli landAt [ExtractHelipad, "Land"];

