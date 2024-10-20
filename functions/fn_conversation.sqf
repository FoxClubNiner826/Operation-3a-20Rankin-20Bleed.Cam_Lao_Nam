
params ["_convo", "_speaker"];

if (!canSuspend) exitWith { _this spawn FoxClub_fnc_Conversation };

switch toLowerANSI _convo do {
    
    case "intro1": {
        private _sound = _speaker say3D "intro1";
        _speaker customChat [FOX_DialogueChannel, "Good morning gentlemen. There's an arsenal right there if you want to adjust your equipment. I'll be over here if you have any last minute questions."];
        _speaker setRandomLip true;
        waitUntil {isNull _sound};
        _speaker setRandomLip false;
    };

    case "intro2": {
        private _sound = _speaker say3D "intro2";
        _speaker customChat [FOX_DialogueChannel, "What's on your mind P.O.?"];
        _speaker setRandomLip true;
        waitUntil {isNull _sound};
        _speaker setRandomLip false;
    };

    case "mpbanter1_1": {
        private _sound = _speaker say3D "MPBanter1_1";
        _speaker customChat [FOX_DialogueChannel, "Hop in, Lee."];
        _speaker setRandomLip true;
        waitUntil {isNull _sound};
        _speaker setRandomLip false;
        ["mpbanter1_2", MP1] spawn FoxClub_fnc_Conversation;
    };

    case "mpbanter1_2": {
        private _sound = _speaker say3D "MPBanter1_2";
        _speaker customChat [FOX_DialogueChannel, "Thank God. Get me to the latrine. That chow's tearing me up!"];
        _speaker setRandomLip true;
        waitUntil {isNull _sound};
        _speaker setRandomLip false;
        ["mpbanter1_3", MP2] spawn FoxClub_fnc_Conversation;
    };

    case "mpbanter1_3": {
        private _sound = _speaker say3D "MPBanter1_3";
        _speaker customChat [FOX_DialogueChannel, "Jesus, just don't mess up the damn jeep."];
        _speaker setRandomLip true;
        waitUntil {isNull _sound};
        _speaker setRandomLip false;
        ["mpbanter1_4", MP1] spawn FoxClub_fnc_Conversation;
    };

    case "mpbanter1_4": {
        private _sound = _speaker say3D "MPBanter1_4";
        _speaker customChat [FOX_DialogueChannel, "No promises, Byrd. Step on it."];
        _speaker setRandomLip true;
        waitUntil {isNull _sound};
        _speaker setRandomLip false;
    };

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
        _speaker customChat [FOX_DialogueChannel, "It’s possible. But if the guys at the farm gave it the green light, they must believe it’s legitimate. Otherwise, we wouldn’t be getting orders from higher-ups."];
        _speaker setRandomLip true;
        waitUntil {isNull _sound};
        _speaker setRandomLip false;
        // etc  to the next etc etc
    };
};
