// Atempt to merge KBTell with my custom function.
params ["_convo", "_speaker"];

if (!canSuspend) exitWith { _this spawn FoxClub_fnc_Conversation };

switch toLowerANSI _convo do {
    case "question1": {
        //["PlayerQuestions", "StagingArea", ["Question1", "Question1"]] remoteExec ["BIS_fnc_kbTell", -2];
        //["PlayerQuestions", "StagingArea", ["Question1", "Question1"]] spawn BIS_fnc_kbTell; // For subtitles only
        private _sound = _speaker say3D "question1"; // for audio only
        _speaker setRandomLip true;
        waitUntil {isNull _sound};
        _speaker setRandomLip false;
        ["answer1", Marcinko] spawn FoxClub_fnc_Conversation;
    };

    case "answer1": {
        //["PlayerQuestions", "StagingArea", ["Answer1", "Answer1"]] spawn BIS_fnc_kbTell; 
        //["PlayerQuestions", "StagingArea", ["Answer1", "Answer1"]] remoteExec ["BIS_fnc_kbTell", -2];
    };
};

/*
params ["_convo", "_speaker"];

if (!canSuspend) exitWith { _this spawn FoxClub_fnc_Conversation };

switch toLowerANSI _convo do {
    case "question1": {
        private _sound = _speaker say3D "question1";
        _speaker setRandomLip true;
        waitUntil {isNull _sound};
        _speaker setRandomLip false;
        ["answer1", Marcinko] spawn FoxClub_fnc_Conversation;
    };

    case "answer1": {
        private _sound = _speaker say3D "answer1";
        _speaker setRandomLip true;
        waitUntil {isNull _sound};
        _speaker setRandomLip false;
        // etc  to the next etc etc
    };
};