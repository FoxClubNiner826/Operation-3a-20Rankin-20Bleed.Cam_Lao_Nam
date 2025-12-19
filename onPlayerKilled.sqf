// Allows players to set the respawn delay
// [{true}, 10, ""] call BIS_fnc_setRespawnDelay; // causes an error on the local host on second force respawn.

private _respawn_delay = paramsArray param [0]; // players choice of respawn delay
private _respawn_mode = paramsArray param [2]; // players choice of respawn mode
private _globalTickets = [missionNamespace] call BIS_fnc_respawnTickets; // number of remaining global tickets
private _playerTickets = [player, nil, true] call BIS_fnc_respawnTickets; // number of remaining global tickets

if ( _respawn_mode == 1 ) then { // 1 is global tickets
    if (_globalTickets != 0) then {   
        setPlayerRespawnTime _respawn_delay;
        //["Global Tickets used"] remoteExec ["systemChat", 0];
    };
};

if ( _respawn_mode == 0 ) then { // 0 is per player tickets
    if (_playerTickets != 0) then {   
        setPlayerRespawnTime _respawn_delay;
        //["Player Tickets used"] remoteExec ["systemChat", 0];
    };
};






