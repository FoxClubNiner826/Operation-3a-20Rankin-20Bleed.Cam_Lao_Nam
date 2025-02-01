if (pow in heli) then {
    _playersInHeli = (switchableUnits + playableUnits) select { _x in heli };
    _randomPlayer = selectRandom _playersinHeli;
    _scout = missionNamespace getVariable ["scout", objNull];

    if (_randomPlayer == _scout) then {
        ["scoutseesprisonPOW", [ranger, pow, _scout]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance heli <= 100}];
    } else {
        ["playersseeprisonPOW", [ranger, _randomPlayer, pow]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance heli <= 100}];
    };

} else {
    _playersInHeli = (switchableUnits + playableUnits) select { _x in heli };
    _randomPlayer = selectRandom _playersinHeli;
    _scout = missionNamespace getVariable ["scout", objNull];

    if (_randomPlayer == _scout) then {
        ["scoutseesprison", [ranger, _scout]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance heli <= 100}];
    } else {
        ["playersseeprison", [ranger, _randomPlayer]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance heli <= 100}];
    };
};


[]spawn {
    if (!alive SmokePassState) then {
        ["nosmokeconvo", [ranger, leader player]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance heli <= 100}]; 
        sleep 10;
        playsound "talkradio"; 
        ranger sideChat "Ranger, Hawk. Rankin has been exfiltrated. We are RTB. Over.";
        sleep 6;
        playsound "talkradio";
        HQRadio sideChat "Hawk, Ranger. Copy that. Safe return."; 
    } else {
        playsound "talkradio"; 
        ranger sideChat "Ranger, Hawk. Rankin has been exfiltrated. We are RTB. Over.";
        sleep 6;
        playsound "talkradio";
        HQRadio sideChat "Hawk, Ranger. Copy that. Safe return."; 
    };
};

[ranger, "CARELESS"] remoteExec ["setCombatBehaviour", ranger];
[rangercopilot, "CARELESS"] remoteExec ["setCombatBehaviour", rangercopilot];
[doorgunner1, "CARELESS"] remoteExec ["setCombatBehaviour", doorgunner1];
[doorgunner2, "CARELESS"] remoteExec ["setCombatBehaviour", doorgunner2];


playsound "talkradio"; 
ranger sideChat "Ranger, Hawk. Rankin has been exfiltrated. We are RTB. Over.";
sleep 6;
playsound "talkradio";
HQRadio sideChat "Hawk, Ranger. Copy that. Safe return.";

[]spawn {
    if (!alive SmokePassState) then {
        ["nosmokeconvo", [ranger, leader player]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance heli <= 100}]; 
        sleep 5;
        ["exfilconvo", [ranger, HQRadio]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance heli <= 100}]; 
    } else {
        ["exfilconvo", [ranger, HQRadio]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance heli <= 100}]; 
    };
};