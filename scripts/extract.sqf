/*
    File: extract.sqf
    Author: FoxClubNiner
    Description:
        Tells helicopter to land at a specific point. Executed from an addAction in onPlayerRespawn.sqf
*/

_heli = ExtractHeli;                       // The helicopter
_lzPos = getMarkerPos "LZMarker";          // Original LZ
_checkRadius = 5;                           // Radius to check for obstacles
_shiftAmount = 5;                           // Max shift in meters
_safetyAltitude = 3;                         // Stop monitoring when heli touches ground
_group = ExtractHeliGroup;

_currentPos = _lzPos;
_landComplete = false;

_currentPos set [0, (_currentPos select 0) + _dx]; // X shift
_currentPos set [1, (_currentPos select 1) + _dy]; // Y shift
// Z stays the same for waypoint
[_group, _currentPos, _heli] spawn BIS_fnc_wpLand;


while {!_landComplete} do {
    private _height = getPosASL _heli select 2;

    if (_height <= _safetyAltitude) exitWith { _landComplete = true }; // Helipad reached

    // Check for objects in radius
    private _objsNearby = nearestObjects [_currentPos, ["Man","Car","Air","Tank","Static","Dead"], _checkRadius];

    if (count _objsNearby > 0) then {
        // Shift landing slightly
        private _dx = (random 1 - 0.5) * 2 * _shiftAmount;
        private _dy = (random 1 - 0.5) * 2 * _shiftAmount;
        _currentPos set [0, (_currentPos select 0) + _dx];
        _currentPos set [1, (_currentPos select 1) + _dy];

        // Update waypoint dynamically
        [_heli, [_currentPos select [0,1], _height], _heli] spawn BIS_fnc_wpLand;
    };

    sleep 0.5; // check twice per second
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