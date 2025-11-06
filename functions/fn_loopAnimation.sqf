// TAG_fnc_loopAnim
params ["_unit", "_anim"];

// remove old EH
_unit removeEventHandler ["AnimDone", _unit getVariable ["TAG_AnimStateChangedEH", -1]];
//systemChat "funcFired";

private _EH = -1;
// if anim is empty, just stop looping
if (_anim != "") then
{
	//systemChat "Iffired";
	_EH = _unit addEventHandler ["AnimDone", {
		params ["_unit", "_anim"];
		//systemChat "ehFired";
		//private _loopedAnim = _unit getVariable ["TAG_LoopedAnim", ""];
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
_unit setVariable ["TAG_LoopedAnim", _anim];

// start the anim
_unit switchMove _anim;


/*
// start looping
[testUnit, "HubSittingChairUA_move1"] call TAG_fnc_loopAnim;

// stop looping
[testUnit, ""] call TAG_fnc_loopAnim;


// sitting slightly back sitUnit1, sitUnit5 - finished
HubSittingChairUA_idle1
HubSittingChairUA_idle2
HubSittingChairUA_idle3
HubSittingChairUA_move1

// sitting upright sitUnit2
HubSittingChairUB_idle1
HubSittingChairUB_idle2
HubSittingChairUB_idle3
HubSittingChairUB_move1

// sitting leaned far back sitUnit4
HubSittingChairUC_idle1
HubSittingChairUC_idle2
HubSittingChairUC_idle3
HubSittingChairUC_move1 

// TAG_fnc_loopAnim
params ["_unit", "_anim"];

// remove old EH
_unit removeEventHandler ["AnimDone", _unit getVariable ["TAG_AnimStateChangedEH", -1]];
systemChat "funcFired";

private _EH = -1;
// if anim is empty, just stop looping
if (_anim != "") then
{
	systemChat "Iffired";
	_EH = _unit addEventHandler ["AnimDone", {
		params ["_unit", "_anim"];
		systemChat "ehFired";
		//private _loopedAnim = _unit getVariable ["TAG_LoopedAnim", ""];
		if (alive _unit) then {
			if (_anim == "HubSittingChairUA_idle1") then {
				systemChat "firedMove";
				_unit switchMove "HubSittingChairUA_move1";
			};  
			if (_anim == "HubSittingChairUA_move1") then {
				systemChat "firedIdle";
				_unit switchMove "HubSittingChairUA_idle1";
			};
			//testUnit switchMove "HubSittingChairUA_move1";
		};
	}];
};

_unit setVariable ["TAG_AnimStateChangedEH", _EH];
_unit setVariable ["TAG_LoopedAnim", _anim];

// start the anim
_unit switchMove _anim;