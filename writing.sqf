if (local this) then {
this setIdentity "pow";
this setCaptive true;
this setHit ["legs", 0.5];
};

this addEventHandler ["HandleHeal",{ 
    params ["_injured"]; 
     
    private _oldHealCount = POW getVariable ["fox_var_healCount",0]; 
    private _newHealCount = _oldHealCount + 1; 
    _injured setVariable ["fox_var_healCount", _newHealCount, true];
     
    if (_newHealCount == 1) then { 
        _injured spawn { 
            sleep 7;
            [_this, ["legs", 0.5]] remoteExec ["setHit", _this];  
            ["heal1", [POW]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance POW <= 100}]; 
        }; 
    }; 
 
    if (_newHealCount == 2) then { 
        _injured spawn { 
            sleep 7; 
            [_this, ["legs", 0.5]] remoteExec ["setHit", _this];  
            ["heal2", [POW]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance POW <= 100}]; 
        }; 
    }; 
     
    if (_newHealCount == 3) then { 
        _injured spawn { 
            sleep 7; 
            [_this, ["legs", 0.5]] remoteExec ["setHit", _this];  
            ["heal3", [POW]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance POW <= 100}]; 
        }; 
    }; 
 
    if (_newHealCount >= 4) then { 
        _injured spawn { 
            sleep 7; 
            [_this, ["legs", 0.5]] remoteExec ["setHit", _this];  
            ["heal4", [POW]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance POW <= 100}]; 
        }; 
    };  
     
}];


