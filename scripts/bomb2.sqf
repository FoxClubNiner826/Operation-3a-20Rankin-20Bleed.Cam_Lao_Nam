/*
    File: bomb2.sqf
    Author: Hypoxic (Built for FoxClubNiner by Hypoxic of Arma Discord - Scripting Channel)
    Description:
        Starts a timer then executes the code after timer completes.
*/

if !(isServer) exitWith {};

private _startTime = time;
private _lastPlayTime = _startTime - 1;
while { sleep 1; time <= _startTime + (60*30) } do {
    if ((time - _lastPlayTime) >= 1) then {
        [ptboat, ["timebomb", 75]] remoteExec ["say3d", 0];
        _lastPlayTime = time;
    };
};

"M_Mo_82mm_AT_LG" createVehicle (ASLToAGL getPosASL ptboat);