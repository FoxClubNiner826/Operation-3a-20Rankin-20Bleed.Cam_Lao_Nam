if !(isServer) exitWith {};

private _startTime = time;
private _lastPlayTime = _startTime - 1;
while { sleep 1; time <= _startTime + (60*45) } do {
    if ((time - _lastPlayTime) >= 1) then {
        [ptboat, ["timebomb", 75]] remoteExec ["say3d", 0];
        _lastPlayTime = time;
    };
};

"M_Mo_82mm_AT_LG" createVehicle (ASLToAGL getPosASL ptboat);

/*
ptboat say3D ["timebomb", 50]; //play tick tock
sleep 40;
ptboat say3D ["timebomb", 50]; //play tick tock
sleep 40;
ptboat say3D ["timebomb", 50]; //play tick tock
sleep 40;

bombTimerStart = time;
waituntil { sleep 1; (time - bombTimerStart) >= (60*43) };

"M_Mo_82mm_AT_LG" createVehicle (getPos ptboat);