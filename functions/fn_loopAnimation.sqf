// TAG_fnc_loopAnim
params ["_unit", "_anim"];
_unit disableAI "ANIM";
// remove old EH
_unit removeEventHandler ["AnimDone", _unit getVariable ["TAG_AnimStateChangedEH", -1]];

private _EH = -1;
// if anim is empty, just stop looping
if (_anim != "") then
{
	_EH = _unit addEventHandler ["AnimDone", {
		params ["_unit", "_anim"];
		systemChat "mainFired";
		private _loopedAnim = _unit getVariable ["TAG_LoopedAnim", ""];
		if (alive _unit) then {
			testUnit switchMove "HubSittingChairUA_move1";
		};
	}];
};

_unit setVariable ["TAG_AnimStateChangedEH", _EH];
_unit setVariable ["TAG_LoopedAnim", _anim];

// start the anim
_unit switchMove _anim;


/*
// start looping
[testUnit, "HubSittingChairUA_move1"] call TAG_fnc_loopAnim;

// stop looping
[testUnit, ""] call TAG_fnc_loopAnim;

[_unit, _anim] spawn {  
  params ["_unit", "_anim"];  
  sleep 5;  
  if (alive _unit) then { 
   [_unit, "HubSittingChairA_idle3"] remoteExec ["switchMove", 0]; 
  };    
 };