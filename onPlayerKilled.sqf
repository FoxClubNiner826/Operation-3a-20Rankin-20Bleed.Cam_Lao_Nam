// Allows players to set the respawn delay
// [{true}, 10, ""] call BIS_fnc_setRespawnDelay; // causes an error on the local host on second force respawn.
["OPK FIRED"] remoteExec ["systemChat", 0];

private _respawn_delay = paramsArray param [0]; // players choice of respawn delay
private _respawn_tickets = paramsArray param [1];
private _respawn_mode = paramsArray param [2]; // players choice of respawn mode
private _globalTickets = [missionNamespace] call BIS_fnc_respawnTickets; // number of remaining global tickets
private _playerTickets = [player, nil, true] call BIS_fnc_respawnTickets; // number of remaining global tickets

// when a player dies, check to see if all players are dead. If so then end the mission. This is needed regarless of the amount of tickets or distribution method. Stop the script here if the condition returns true.
if ( units playerGroup findIf { alive _x } == -1 ) exitWith {
    [] spawn {
        sleep 5;
        ["DefeatAllPlayersDead", false, true, true, true] remoteExec ["VN_fnc_endMission"];
    };
};

// Checks if the shared pool ticket option was selected. If so then check if there are remaining tickets. If yes the apply the choosen respawn timer, else end the mission
if ( _respawn_mode == 1 ) then { 
    if (_globalTickets != 0) then {   
        setPlayerRespawnTime _respawn_delay;
        ["There are tickets remaining."] remoteExec ["systemChat", 0];
    } else {
        ["There are NO tickets remaining."] remoteExec ["systemChat", 0];
        // need to do this so that the game can end when tickets are used up
        if ( units playerGroup findIf { alive _x /*|| lifeState _x == "INCAPACITATED"*/ } == -1 ) then {
            [] spawn {
                sleep 5;
                ["DefeatAllPlayersDead", false, true, true, true] remoteExec ["VN_fnc_endMission"];
            };
        };
    };
    /*
    if ( _respawn_tickets == 0 ) then {
        // if infinite tickets are used then we will consider this easy mode. The only situation that could prevent progress is if all the players are dead (on the respawn scree) and there isn't the single player in the incapacitated state (because, you can spawn on them still). So I need to do a check for that and I think the situation could arise with tickets as well.
        if ( units playerGroup findIf { alive _x || lifeState _x == "INCAPACITATED" } == -1 ) then {
            [] spawn {
                sleep 5;
                ["DefeatSTABDestroyed", false, true, true, true] remoteExec ["VN_fnc_endMission"];
            };
        };
    };
    */
};

// Checks if the per-player ticket option was selected. If so then check if there are remaining tickets. If yes the apply the choosen respawn timer
if ( _respawn_mode == 0 ) then { // 0 is per player tickets
    if (_playerTickets != 0) then {   
        setPlayerRespawnTime _respawn_delay;
        //["Player Tickets used"] remoteExec ["systemChat", 0];
    };
};






