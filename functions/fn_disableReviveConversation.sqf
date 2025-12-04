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
hint "Override function fn_disableReviveConversation is running";

/*
   Disabled revive conversation.
*/


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




