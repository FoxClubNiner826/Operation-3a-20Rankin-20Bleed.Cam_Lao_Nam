// TAG_fnc_loopAnim
params ["_unit", "_anim"];

// remove old EH
_unit removeEventHandler ["AnimStateChanged", _unit getVariable ["TAG_AnimStateChangedEH", -1]];

private _EH = -1;
// if anim is empty, just stop looping
if (_anim != "") then
{
	_EH = _unit addEventHandler ["AnimStateChanged", {
		params ["_unit", "_anim"];
		systemChat "mainFired";
		private _loopedAnim = _unit getVariable ["TAG_LoopedAnim", ""];
		if (alive _unit && _anim != _loopedAnim) then {
			_unit switchMove [_loopedAnim, 0, 0, false];
		};
	}];
};

_unit setVariable ["TAG_AnimStateChangedEH", _EH];
_unit setVariable ["TAG_LoopedAnim", _anim];

// start the anim
_unit switchMove [_anim, 0, 0, false];