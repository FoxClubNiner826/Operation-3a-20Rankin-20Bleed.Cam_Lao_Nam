/*
    File: extract.sqf
    Author: FoxClubNiner
    Description:
        Tells helicopter to land at a specific point. Executed from an addAction in onPlayerRespawn.sqf
*/

[] spawn {
	_heli = ExtractHeli_1;
	_helipadPos = ExtractHelipad;
	_clearRadius = 5;

	// Loop until landing zone is clear
	while {true} do {
		_objectsNearby = ExtractHelipad nearEntities [["Man", "Tank"], _clearRadius];

		if (count _objectsNearby == 0) then {
			_heli landAt [_helipadPos, "Land"];
			systemChat "The extraction helicopter is landing!";
			break; // exit loop once landing command issued
		} else {
			private _names = _objectsNearby apply {
				getText (configFile >> "CfgVehicles" >> typeOf _x >> "displayName")
			};
			systemChat format ["The LZ is blocked by: %1", _names joinString ", "];
		};

		sleep 1; // wait 1 second before checking again
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

