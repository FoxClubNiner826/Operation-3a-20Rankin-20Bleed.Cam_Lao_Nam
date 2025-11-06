/*
    File: fn_loopAnimation.sqf
    Author: Original, Leopard20. Modified, FoxClubNiner.
    Description:
        Loops animations for excercising units.
*/

params ["_unit", "_anim"];

// remove old EH
_unit removeEventHandler ["AnimDone", _unit getVariable ["TAG_AnimStateChangedEH", -1]];

private _EH = -1;
// if anim is empty, just stop looping
if (_anim != "") then
{
    _EH = _unit addEventHandler ["AnimDone", {  
        params ["_unit", "_anim"]; 
        if (alive _unit) then {
			if (_anim == "HubStandingUA_idle2") then {
				_unit switchMove ["AmovPercMstpSnonWnonDnon_exercisePushup", 0, 0, false]; 
			};   
			if (_anim == "AmovPercMstpSnonWnonDnon_exercisePushup") then {
				_unit switchMove ["HubStandingUA_idle2", .8, 0, false];
			};
        };
    }];
};

_unit setVariable ["TAG_AnimStateChangedEH", _EH];

// start the anim
_unit switchMove [_anim, 0, 0, false];


