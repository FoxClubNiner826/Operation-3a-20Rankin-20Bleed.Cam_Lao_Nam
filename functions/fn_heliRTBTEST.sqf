/*
    File: fn_heliRTB.sqf
    Author: FoxClubNiner
    Description:
        Let's the landed heli take off and move to a new spot to land.
*/

[] spawn {
            //ExtractHeli landAt [ExtractHelipad, "None"]; // lets the heli take off
            //ExtractHeli flyInHeight 300; // goes to height then moves to base. Doesnt look smooth.
            _group = ExtractHeliGroup_1;  
            _markerName = "returnToBase";   
            _waypointPosition = getMarkerPos _markerName;  
            _wp1 = _group addWaypoint [_waypointPosition, 0]; 
            _wp1 setWaypointType "MOVE";  
            _group setCurrentWaypoint _wp1; // forces heli to move
            sleep 60; // lets heli take off before giving another landing
            ExtractHeli landAt [baseHelipad, "Land"]; // if there was no sleep the engine will turn off and heli wont take off.
		};

//extractHeliGroup addWaypoint [[7062.49,4292.03,0], -1, 4, "FirstRoad"]; 
//[extractHeliGroup, 4] setWaypointType "MOVE";