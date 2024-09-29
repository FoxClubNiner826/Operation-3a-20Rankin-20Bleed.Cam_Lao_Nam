if !(isServer) exitWith {};

private _startTime = time;
private _lastPlayTime = _startTime - 1; //sound file length is 1 second
while { sleep 1; time <= _startTime + (60*15) } do {
    if ((time - _lastPlayTime) >= 1) then {
        [ptboat, ["timebomb", 75]] remoteExec ["say3d", 0];
        _lastPlayTime = time;
    };
};

"M_Mo_82mm_AT_LG" createVehicle (ASLToAGL getPosASL ptboat);