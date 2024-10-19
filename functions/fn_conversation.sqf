
params ["_convo", "_speaker"];

if (!canSuspend) exitWith { _this spawn FoxClub_fnc_Conversation };

switch toLowerANSI _convo do {
    case "question1": {
        private _sound = _speaker say3D "question1";
        _speaker customChat [FOX_DialogueChannel, "Could this be a trap?"];
        _speaker setRandomLip true;
        waitUntil {isNull _sound};
        _speaker setRandomLip false;
        ["answer1", Marcinko] spawn FoxClub_fnc_Conversation;
    };

    case "answer1": {
        private _sound = _speaker say3D "answer1";
        marcinko customChat [FOX_DialogueChannel, "It’s possible. But if the guys at the farm gave it the green light, they must believe it’s legitimate. Otherwise, we wouldn’t be getting orders from higher-ups."];
        _speaker setRandomLip true;
        waitUntil {isNull _sound};
        _speaker setRandomLip false;
        // etc  to the next etc etc
    };
};
