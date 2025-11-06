// TAG_fnc_loopAnim
params ["_unit", "_anim"];

// remove old EH
_unit removeEventHandler ["AnimDone", _unit getVariable ["TAG_AnimStateChangedEH", -1]];

private _EH = -1;
// if anim is empty, just stop looping
if (_anim != "") then
{
    _EH = _unit addEventHandler ["AnimDone", {  
        params ["_unit", "_anim"]; 
        systemChat "ehFired";
        //private _loopedAnim = _unit getVariable ["TAG_LoopedAnim", ""];
        if (alive _unit) then {
			if (_anim == "HubStandingUA_idle2") then {
				systemChat "firedPushup";
				_unit switchMove ["AmovPercMstpSnonWnonDnon_exercisePushup", 0, 0, false]; 
			};   
			if (_anim == "AmovPercMstpSnonWnonDnon_exercisePushup") then {
				systemChat "firedScratch";
				
				//_unit switchMove [_randomAnim, .8, 0, false];
				//systemChat _randomAnim;
				_unit switchMove ["HubStandingUA_idle2", .8, 0, false];
			};
        };
    }];
};

_unit setVariable ["TAG_AnimStateChangedEH", _EH];
_unit setVariable ["TAG_LoopedAnim", _anim];

// start the anim
_unit switchMove [_anim, 0, 0, false];


/*
_unit switchMove ["Acts_hubTalk_scratchHead1", 0, 0]; 
  _unit playMove "Acts_hubTalk_scratchHead1";

  HubStandingUA_idle2

  _randomAnim = selectRandom ["",
											"HubStandingUA_idle2",
											"HubStandingUA_idle3",
											"HubStandingUA_move1",
											"HubStandingUA_move2"];