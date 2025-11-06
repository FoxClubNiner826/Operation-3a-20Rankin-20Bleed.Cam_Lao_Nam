/*
    File: fn_loopAnimation.sqf
    Author: Original, Leopard20. Modified, FoxClubNiner.
    Description:
        Loops animations for sitting units and randomly selects a new animaiton.
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
			switch (true) do {
				case (_unit == sitUnit2): { 
					if (_anim != "HubSittingChairUB_move1") then {
						_unit switchMove "HubSittingChairUB_move1";
					};  
					if (_anim == "HubSittingChairUB_move1") then {
						_randomAnim = selectRandom ["HubSittingChairUB_idle1",
													"HubSittingChairUB_idle2",
													"HubSittingChairUB_idle3"];
						_unit switchMove _randomAnim;
					};	
				}; 
				case (_unit == sitUnit4): { 
					if (_anim != "HubSittingChairUC_move1") then {
						_unit switchMove "HubSittingChairUC_move1";
					};  
					if (_anim == "HubSittingChairUC_move1") then {
						_randomAnim = selectRandom ["HubSittingChairUC_idle1",
													"HubSittingChairUC_idle2",
													"HubSittingChairUC_idle3"];
						_unit switchMove _randomAnim;
					};	
				}; 
				default { 
					if (_anim != "HubSittingChairUA_move1") then {
						_unit switchMove "HubSittingChairUA_move1";
					};  
					if (_anim == "HubSittingChairUA_move1") then {
						_randomAnim = selectRandom ["HubSittingChairUA_idle1",
													"HubSittingChairUA_idle2",
													"HubSittingChairUA_idle3"];
						_unit switchMove _randomAnim;
					};		
				}; 
			};	
		};
	}];
};

_unit setVariable ["TAG_AnimStateChangedEH", _EH];

// start the anim
_unit switchMove _anim;