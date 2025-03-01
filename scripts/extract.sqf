_group = ExtractHeliGroup;
_markerName = "moveToLZ"; 
_waypointPosition = getMarkerPos _markerName;
_waypoint = _group addWaypoint [_waypointPosition, 0];
_waypoint setWaypointType "MOVE";
_group setCurrentWaypoint [_group, 2];
[ExtractHeliGroup, [8584.56,8187.52,0], ExtractHeli] spawn BIS_fnc_wpLand;