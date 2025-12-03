/*
    File: fn_conversation.sqf
    Author: NikkoJT (Built for FoxClubNiner by NikkoJT of Arma Discord - Scripting Channel)
    Description:
        Plays a conversation with audio and text and broadcasts it with FoxClub_fnc_Conversation.
*/

/*
    Override for: vn_fnc_revive_conversation
    Converts VN revive module actions into Foxclub conversation events.

    PARAMETERS (from VN system):
        0: OBJECT - the unit performing the action
        1: STRING - the action ("help", "heal", "revive", etc.)

    RETURNS:
        NONE
*/

//systemChat "fired";

params ["_user", "_action"];

systemChat format [
    "Revive Convo Debug: user=%1 | revive_target=%2",
    _user,
    (_user getVariable ['vn_revive_target', objNull])
];

if (!alive _user) exitWith {};

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

        if (_user == scout) then {
            ["revive_healer_scout", [_user, _responder]] remoteExec ["foxclub_fnc_conversation", 0];
        } else {
            ["revive_healer", [_user, _responder]] remoteExec ["foxclub_fnc_conversation", 0];
        };
    };

    case "revive": {
        systemChat "revive case fired.";

        if (_user == scout) then {
            ["revive_healer_scout", [_user, _responder]] remoteExec ["foxclub_fnc_conversation", 0];
        } else {
            ["revive_healer", [_user, _responder]] remoteExec ["foxclub_fnc_conversation", 0];
        };
    };

    //case "revive": { systemChat "revive case fired."; };
    case "drag_player": { systemChat "drag_player case fired."; };
    case "undrag_player": { systemChat "undrag_player case fired."; };
    case "pickup_player": { systemChat "pickup_player case fired."; };
    case "drop_player": { systemChat "drop_player case fired."; };
    case "carried": { systemChat "carried case fired."; };
    case "dragged": { systemChat "dragged case fired."; };
    case "general": { systemChat "general case fired."; };

    default { "" };
};




