
params ["_convo", "_speaker", "_caller"];

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

// MP Banter 1
    case "mpbanter1_1": {
        if (alive MP1) then {
        private _sound = _speaker say3D "MPBanter1_1";
        _speaker customChat [FOX_DialogueChannel, "Hop in, Lee."];
        _speaker setRandomLip true;
        waitUntil {isNull _sound};
        _speaker setRandomLip false;
        ["mpbanter1_2", MP1] spawn FoxClub_fnc_Conversation;    
        };
    };

    case "mpbanter1_2": {
        if (alive MP2) then {
        private _sound = _speaker say3D "MPBanter1_2";
        _speaker customChat [FOX_DialogueChannel, "Thank God. Get me to the latrine. That chow's tearing me up!"];
        _speaker setRandomLip true;
        waitUntil {isNull _sound};
        _speaker setRandomLip false;
        ["mpbanter1_3", MP2] spawn FoxClub_fnc_Conversation;    
        };
    };

    case "mpbanter1_3": {
        if (alive MP1) then {
        private _sound = _speaker say3D "MPBanter1_3";
        _speaker customChat [FOX_DialogueChannel, "Jesus, just don't mess up the damn jeep."];
        _speaker setRandomLip true;
        waitUntil {isNull _sound};
        _speaker setRandomLip false;
        ["mpbanter1_4", MP1] spawn FoxClub_fnc_Conversation;    
        };
    };

    case "mpbanter1_4": {
        if (alive MP2) then {
        private _sound = _speaker say3D "MPBanter1_4";
        _speaker customChat [FOX_DialogueChannel, "No promises, Byrd. Step on it."];
        _speaker setRandomLip true;
        waitUntil {isNull _sound};
        _speaker setRandomLip false;    
        };
    };

// MP Banter 2
case "mpbanter2_1": {
        if (alive MP1) then {
        private _sound = _speaker say3D "MPBanter1_1";
        _speaker customChat [FOX_DialogueChannel, "You wouldn’t believe it. I caught a rat in the mess hall."];
        _speaker setRandomLip true;
        waitUntil {isNull _sound};
        _speaker setRandomLip false;
        ["mpbanter2_2", MP1] spawn FoxClub_fnc_Conversation;    
        };
    };

    case "mpbanter2_2": {
        if (alive MP2) then {
        private _sound = _speaker say3D "MPBanter1_2";
        _speaker customChat [FOX_DialogueChannel, "Seriously? I thought they’d fixed that problem."];
        _speaker setRandomLip true;
        waitUntil {isNull _sound};
        _speaker setRandomLip false;
        ["mpbanter2_3", MP2] spawn FoxClub_fnc_Conversation;    
        };
    };

    case "mpbanter2_3": {
        if (alive MP1) then {
        private _sound = _speaker say3D "MPBanter1_3";
        _speaker customChat [FOX_DialogueChannel, "Yeah, and if you look at the chow it's suspiciously rodent-like."];
        _speaker setRandomLip true;
        waitUntil {isNull _sound};
        _speaker setRandomLip false;
        ["mpbanter2_4", MP1] spawn FoxClub_fnc_Conversation;    
        };
    };

    case "mpbanter2_4": {
        if (alive MP2) then {
        private _sound = _speaker say3D "MPBanter1_4";
        _speaker customChat [FOX_DialogueChannel, "I’ll take my chances. Had enough C-rations to last me a lifetime."];
        _speaker setRandomLip true;
        waitUntil {isNull _sound};
        _speaker setRandomLip false;    
        };
    };

// MP Banter 3
    case "mpbanter3_1": {
        if (alive MP1) then {
        private _sound = _speaker say3D "MPBanter1_1";
        _speaker customChat [FOX_DialogueChannel, "We just chased down an escaped prisoner!"];
        _speaker setRandomLip true;
        waitUntil {isNull _sound};
        _speaker setRandomLip false;
        ["mpbanter3_2", MP1] spawn FoxClub_fnc_Conversation;    
        };
    };

    case "mpbanter3_2": {
        if (alive MP2) then {
        private _sound = _speaker say3D "MPBanter1_2";
        _speaker customChat [FOX_DialogueChannel, "No way! How'd that go down?"];
        _speaker setRandomLip true;
        waitUntil {isNull _sound};
        _speaker setRandomLip false;
        ["mpbanter3_3", MP2] spawn FoxClub_fnc_Conversation;    
        };
    };

    case "mpbanter3_3": {
        if (alive MP1) then {
        private _sound = _speaker say3D "MPBanter1_3";
        _speaker customChat [FOX_DialogueChannel, "We tracked him for half a klick through the jungle. Finally caught him trying to hide up a damn palm tree."];
        _speaker setRandomLip true;
        waitUntil {isNull _sound};
        _speaker setRandomLip false;
        ["mpbanter3_4", MP1] spawn FoxClub_fnc_Conversation;    
        };
    };

    case "mpbanter3_4": {
        if (alive MP2) then {
        private _sound = _speaker say3D "MPBanter1_4";
        _speaker customChat [FOX_DialogueChannel, "Sounds like a real mess. Just another day in paradise, right?"];
        _speaker setRandomLip true;
        waitUntil {isNull _sound};
        _speaker setRandomLip false;    
        };
    };

// MP Banter 4
    case "mpbanter4_1": {
        if (alive MP3) then {
        private _sound = _speaker say3D "MPBanter1_1";
        _speaker customChat [FOX_DialogueChannel, "What’s this? You two lounging around while you’re supposed to be on patrol?"];
        _speaker setRandomLip true;
        waitUntil {isNull _sound};
        _speaker setRandomLip false;
        ["mpbanter4_2", MP3] spawn FoxClub_fnc_Conversation;    
        };
    };

    case "mpbanter4_2": {
        if (alive MP2) then {
        private _sound = _speaker say3D "MPBanter1_2";
        _speaker customChat [FOX_DialogueChannel, "Just catching a break. Did you read the Stripes yesterday? Westmoreland thinks we've almost licked the VC!"];
        _speaker setRandomLip true;
        waitUntil {isNull _sound};
        _speaker setRandomLip false;
        ["mpbanter4_3", MP2] spawn FoxClub_fnc_Conversation;    
        };
    };

    case "mpbanter4_3": {
        if (alive MP3) then {
        private _sound = _speaker say3D "MPBanter1_3";
        _speaker customChat [FOX_DialogueChannel, "Well, until we have you're still on patrol."];
        _speaker setRandomLip true;
        waitUntil {isNull _sound};
        _speaker setRandomLip false;
        ["mpbanter4_4", MP3] spawn FoxClub_fnc_Conversation;    
        };
    };

    case "mpbanter4_4": {
        if (alive MP2) then {
        private _sound = _speaker say3D "MPBanter1_4";
        _speaker customChat [FOX_DialogueChannel, "Understood. Come on, Sisler. Let's go."];
        _speaker setRandomLip true;
        waitUntil {isNull _sound};
        _speaker setRandomLip false;    
        };
    };

// MP Banter 5
    case "mpbanter5_1": {
        if (alive MP3) then {
        private _sound = _speaker say3D "MPBanter1_1";
        _speaker customChat [FOX_DialogueChannel, "Big stuff must be going down. Hope you boys come back in one piece!"];
        _speaker setRandomLip true;
        waitUntil {isNull _sound};
        _speaker setRandomLip false;
        };
    };

    case "mpbanter5_2": {
        if (alive MP2) then {
        private _sound = _speaker say3D "MPBanter1_2";
        _speaker customChat [FOX_DialogueChannel, "Looks like yall're in for a wild ride. Keep your heads down!"];
        _speaker setRandomLip true;
        waitUntil {isNull _sound};
        _speaker setRandomLip false;
        };
    };

    case "mpbanter5_3": {
        if (alive MP3) then {
        private _sound = _speaker say3D "MPBanter1_3";
        _speaker customChat [FOX_DialogueChannel, "Damn, something serious is happening. Give 'em hell!"];
        _speaker setRandomLip true;
        waitUntil {isNull _sound};
        _speaker setRandomLip false;
        };
    };

// Marcinko Question 1
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
    };

// Marcinko Question 2
    case "question2": {
        private _sound = _speaker say3D "question2";
        _speaker customChat [FOX_DialogueChannel, "Do we really need a Kit Carson? How can we trust him?"];
        _speaker setRandomLip true;
        waitUntil {isNull _sound};
        _speaker setRandomLip false;
        ["answer2", Marcinko] spawn FoxClub_fnc_Conversation;
    };

    case "answer2": {
        private _sound = _speaker say3D "answer2";
        _speaker customChat [FOX_DialogueChannel, "As I mentioned in the briefing, he’s been vetted by the Marines. He’s seen combat and performed better than some of our own. If you have concerns, go talk to him yourself."];
        _speaker setRandomLip true;
        waitUntil {isNull _sound};
        _speaker setRandomLip false;
    };

// Marcinko Question 3
    case "question3": {
        private _sound = _speaker say3D "question1";
        _speaker customChat [FOX_DialogueChannel, "If this General is in Lumphat right, why don’t we just blow the place to pieces with an Arclight?"];
        _speaker setRandomLip true;
        waitUntil {isNull _sound};
        _speaker setRandomLip false;
        ["answer3", Marcinko] spawn FoxClub_fnc_Conversation;
    };

    case "answer3": {
        private _sound = Marcinko say3D "answer1";
        Marcinko customChat [FOX_DialogueChannel, "We can’t be certain he’s there. We need to confirm his location and get a solid kill before taking any action. Besides, it’s illegal to use an Arclight in Cambodia. Higher-ups fear escalation."];
        Marcinko setRandomLip true;
        waitUntil {isNull _sound};
        Marcinko setRandomLip false;
        ["question3_1", _speaker] spawn FoxClub_fnc_Conversation;
    };

    case "question3_1": {
        private _sound = _speaker say3D "question1";
        _speaker customChat [FOX_DialogueChannel, "Hell, it ain’t legal for us to be there either!"];
        _speaker setRandomLip true;
        waitUntil {isNull _sound};
        _speaker setRandomLip false;
        ["answer3_1", Marcinko] spawn FoxClub_fnc_Conversation;
    };

    case "answer3_1": {
        private _sound = Marcinko say3D "answer1";
        Marcinko customChat [FOX_DialogueChannel, "Exactly. That’s why you need to make damn sure to destroy the STAB, P.O."];
        Marcinko setRandomLip true;
        waitUntil {isNull _sound};
        Marcinko setRandomLip false;
    };

// Marcinko Question 4

// Marcinko Question 5
    case "question5": {
        private _sound = _speaker say3D "question1";
        _speaker customChat [FOX_DialogueChannel, "Can you tell me more about General Tan?"];
        _speaker setRandomLip true;
        waitUntil {isNull _sound};
        _speaker setRandomLip false;
        ["answer5", Marcinko] spawn FoxClub_fnc_Conversation;
    };

    case "answer5": {
        private _sound = _speaker say3D "answer1";
        _speaker customChat [FOX_DialogueChannel, "General Tan has been a key figure with the PAVN for quite a while—longer than we’ve been in Vietnam. He fought against the French before us and has played a crucial role in building and maintaining the Ho Chi Minh Trail. That’s likely why he’s there now—ensuring everything on the trail is running smoothly."];
        _speaker setRandomLip true;
        waitUntil {isNull _sound};
        _speaker setRandomLip false;
    };

// Marcinko Question 6

// Marcinko Question 7
    case "question7": {
        private _sound = _speaker say3D "question1";
        _speaker customChat [FOX_DialogueChannel, "How reliable is this intel?"];
        _speaker setRandomLip true;
        waitUntil {isNull _sound};
        _speaker setRandomLip false;
        ["answer7", Marcinko] spawn FoxClub_fnc_Conversation;
    };

    case "answer7": {
        private _sound = _speaker say3D "answer1";
        _speaker customChat [FOX_DialogueChannel, "The prisoner who provided it is locked up in the prison just North of us. It’s solid and credible, or the top brass wouldn’t have signed off on the mission."];
        _speaker setRandomLip true;
        waitUntil {isNull _sound};
        _speaker setRandomLip false;
    };

// Marcinko Question 8

};

