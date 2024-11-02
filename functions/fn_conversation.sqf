params ["_convo","_speakers"];

private _conversationData = foxclub_var_conversations get _convo;
{
	_x params ["_speakerIndex","_text","_sound", ["_delayAfter",1]];
	private _speaker = _speakers select _speakerIndex;
	private _sound = _speaker say3D _sound;
	_speaker customChat [FOX_DialogueChannel, _text];
	_speaker setRandomLip true;
	waitUntil {isNull _sound};
	_speaker setRandomLip false;
	sleep _delayAfter;
} forEach _conversationData;

/* The below works but is not optimized
params ["_convo", "_player", "_npc"];

if (!canSuspend) exitWith { _this spawn FoxClub_fnc_Conversation };

switch toLowerANSI _convo do {
    
    case "intro1": {
        private _sound = _npc say3D "intro1";
        _npc customChat [FOX_DialogueChannel, "Good morning gentlemen. There's an arsenal right there if you want to adjust your equipment. I'll be over here if you have any last minute questions."];
        _npc setRandomLip true;
        waitUntil {isNull _sound};
        _npc setRandomLip false;
    };

    case "intro2": {
        private _sound = _npc say3D "intro2";
        _npc customChat [FOX_DialogueChannel, "What's on your mind P.O.?"];
        _npc setRandomLip true;
        waitUntil {isNull _sound};
        _npc setRandomLip false;
    };

// MP Banter 1
    case "mpbanter1_1": {
        if (alive MP1) then {
        private _sound = _npc say3D "MPBanter1_1";
        _npc customChat [FOX_DialogueChannel, "Hop in, Lee."];
        _npc setRandomLip true;
        waitUntil {isNull _sound};
        _npc setRandomLip false;
        ["mpbanter1_2", nil, MP1] spawn FoxClub_fnc_Conversation;    
        };
    };

    case "mpbanter1_2": {
        if (alive MP2) then {
        private _sound = _npc say3D "MPBanter1_2";
        _npc customChat [FOX_DialogueChannel, "Thank God. Get me to the latrine. That chow's tearing me up!"];
        _npc setRandomLip true;
        waitUntil {isNull _sound};
        _npc setRandomLip false;
        ["mpbanter1_3", nil, MP2] spawn FoxClub_fnc_Conversation;    
        };
    };

    case "mpbanter1_3": {
        if (alive MP1) then {
        private _sound = _npc say3D "MPBanter1_3";
        _npc customChat [FOX_DialogueChannel, "Jesus, just don't mess up the damn jeep."];
        _npc setRandomLip true;
        waitUntil {isNull _sound};
        _npc setRandomLip false;
        ["mpbanter1_4", nil, MP1] spawn FoxClub_fnc_Conversation;    
        };
    };

    case "mpbanter1_4": {
        if (alive MP2) then {
        private _sound = _npc say3D "MPBanter1_4";
        _npc customChat [FOX_DialogueChannel, "No promises, Byrd. Step on it."];
        _npc setRandomLip true;
        waitUntil {isNull _sound};
        _npc setRandomLip false;    
        };
    };

// MP Banter 2
case "mpbanter2_1": {
        if (alive MP1) then {
        private _sound = _npc say3D "MPBanter1_1";
        _npc customChat [FOX_DialogueChannel, "You wouldn’t believe it. I caught a rat in the mess hall."];
        _npc setRandomLip true;
        waitUntil {isNull _sound};
        _npc setRandomLip false;
        ["mpbanter2_2", nil, MP1] spawn FoxClub_fnc_Conversation;    
        };
    };

    case "mpbanter2_2": {
        if (alive MP2) then {
        private _sound = _npc say3D "MPBanter1_2";
        _npc customChat [FOX_DialogueChannel, "Seriously? I thought they’d fixed that problem."];
        _npc setRandomLip true;
        waitUntil {isNull _sound};
        _npc setRandomLip false;
        ["mpbanter2_3", nil, MP2] spawn FoxClub_fnc_Conversation;    
        };
    };

    case "mpbanter2_3": {
        if (alive MP1) then {
        private _sound = _npc say3D "MPBanter1_3";
        _npc customChat [FOX_DialogueChannel, "Yeah, and if you look at the chow it's suspiciously rodent-like."];
        _npc setRandomLip true;
        waitUntil {isNull _sound};
        _npc setRandomLip false;
        ["mpbanter2_4", nil, MP1] spawn FoxClub_fnc_Conversation;    
        };
    };

    case "mpbanter2_4": {
        if (alive MP2) then {
        private _sound = _npc say3D "MPBanter1_4";
        _npc customChat [FOX_DialogueChannel, "I’ll take my chances. Had enough C-rations to last me a lifetime."];
        _npc setRandomLip true;
        waitUntil {isNull _sound};
        _npc setRandomLip false;    
        };
    };

// MP Banter 3
    case "mpbanter3_1": {
        if (alive MP1) then {
        private _sound = _npc say3D "MPBanter1_1";
        _npc customChat [FOX_DialogueChannel, "We just chased down an escaped prisoner!"];
        _npc setRandomLip true;
        waitUntil {isNull _sound};
        _npc setRandomLip false;
        ["mpbanter3_2", nil, MP1] spawn FoxClub_fnc_Conversation;    
        };
    };

    case "mpbanter3_2": {
        if (alive MP2) then {
        private _sound = _npc say3D "MPBanter1_2";
        _npc customChat [FOX_DialogueChannel, "No way! How'd that go down?"];
        _npc setRandomLip true;
        waitUntil {isNull _sound};
        _npc setRandomLip false;
        ["mpbanter3_3", nil, MP2] spawn FoxClub_fnc_Conversation;    
        };
    };

    case "mpbanter3_3": {
        if (alive MP1) then {
        private _sound = _npc say3D "MPBanter1_3";
        _npc customChat [FOX_DialogueChannel, "We tracked him for half a klick through the jungle. Finally caught him trying to hide up a damn palm tree."];
        _npc setRandomLip true;
        waitUntil {isNull _sound};
        _npc setRandomLip false;
        ["mpbanter3_4", nil, MP1] spawn FoxClub_fnc_Conversation;    
        };
    };

    case "mpbanter3_4": {
        if (alive MP2) then {
        private _sound = _npc say3D "MPBanter1_4";
        _npc customChat [FOX_DialogueChannel, "Sounds like a real mess. Just another day in paradise, right?"];
        _npc setRandomLip true;
        waitUntil {isNull _sound};
        _npc setRandomLip false;    
        };
    };

// MP Banter 4
    case "mpbanter4_1": {
        if (alive MP3) then {
        private _sound = _npc say3D "MPBanter1_1";
        _npc customChat [FOX_DialogueChannel, "What’s this? You two lounging around while you’re supposed to be on patrol?"];
        _npc setRandomLip true;
        waitUntil {isNull _sound};
        _npc setRandomLip false;
        ["mpbanter4_2", nil, MP3] spawn FoxClub_fnc_Conversation;    
        };
    };

    case "mpbanter4_2": {
        if (alive MP2) then {
        private _sound = _npc say3D "MPBanter1_2";
        _npc customChat [FOX_DialogueChannel, "Just catching a break. Did you read the Stripes yesterday? Westmoreland thinks we've almost licked the VC!"];
        _npc setRandomLip true;
        waitUntil {isNull _sound};
        _npc setRandomLip false;
        ["mpbanter4_3", nil, MP2] spawn FoxClub_fnc_Conversation;    
        };
    };

    case "mpbanter4_3": {
        if (alive MP3) then {
        private _sound = _npc say3D "MPBanter1_3";
        _npc customChat [FOX_DialogueChannel, "Well, until we have you're still on patrol."];
        _npc setRandomLip true;
        waitUntil {isNull _sound};
        _npc setRandomLip false;
        ["mpbanter4_4", nil, MP3] spawn FoxClub_fnc_Conversation;    
        };
    };

    case "mpbanter4_4": {
        if (alive MP2) then {
        private _sound = _npc say3D "MPBanter1_4";
        _npc customChat [FOX_DialogueChannel, "Understood. Come on, Anderson. Let's go."];
        _npc setRandomLip true;
        waitUntil {isNull _sound};
        _npc setRandomLip false;    
        };
    };

// MP Banter 5
    case "mpbanter5_1": {
        if (alive MP3) then {
        private _sound = _npc say3D "MPBanter1_1";
        _npc customChat [FOX_DialogueChannel, "Big stuff must be going down. Hope you boys come back in one piece!"];
        _npc setRandomLip true;
        waitUntil {isNull _sound};
        _npc setRandomLip false;
        };
    };

    case "mpbanter5_2": {
        if (alive MP2) then {
        private _sound = _npc say3D "MPBanter1_2";
        _npc customChat [FOX_DialogueChannel, "Looks like yall're in for a wild ride. Keep your heads down!"];
        _npc setRandomLip true;
        waitUntil {isNull _sound};
        _npc setRandomLip false;
        };
    };

    case "mpbanter5_3": {
        if (alive MP3) then {
        private _sound = _npc say3D "MPBanter1_3";
        _npc customChat [FOX_DialogueChannel, "Damn, something serious is happening. Give 'em hell!"];
        _npc setRandomLip true;
        waitUntil {isNull _sound};
        _npc setRandomLip false;
        };
    };

// Marcinko Question 1
    case "question1": {
        private _sound = _player say3D "question1";
        _player customChat [FOX_DialogueChannel, "Could this be a trap?"];
        _player setRandomLip true;
        waitUntil {isNull _sound};
        _player setRandomLip false;
        ["answer1", _player, Marcinko] spawn FoxClub_fnc_Conversation;
    };

    case "answer1": {
        private _sound = _npc say3D "answer1";
        _npc customChat [FOX_DialogueChannel, "It’s possible. But if the guys at the farm gave it the green light, they must believe it’s legitimate. Otherwise, we wouldn’t be getting orders from higher-ups."];
        _npc setRandomLip true;
        waitUntil {isNull _sound};
        _npc setRandomLip false;
        missionNamespace setVariable ["AllowActionTalk", true, true]; //enables remaining addactions now that convo is over
    };

// Marcinko Question 2
    case "question2": {
        private _sound = _player say3D "question1";
        _player customChat [FOX_DialogueChannel, "Do we really need a Kit Carson? How can we trust him?"];
        _player setRandomLip true;
        waitUntil {isNull _sound};
        _player setRandomLip false;
        ["answer2", _player, Marcinko] spawn FoxClub_fnc_Conversation;
    };

    case "answer2": {
        private _sound = _npc say3D "answer1";
        _npc customChat [FOX_DialogueChannel, "As I mentioned in the briefing, he’s been vetted by the Marines. He’s seen combat and performed better than some of our own. If you have concerns, go talk to him yourself."];
        _npc setRandomLip true;
        waitUntil {isNull _sound};
        _npc setRandomLip false;
        missionNamespace setVariable ["AllowActionTalk", true, true];
	    missionNamespace setVariable ["ActionTalkToCarson", true, true];
    };

// Marcinko Question 3
    case "question3": {
        private _sound = _player say3D "question1";
        _player customChat [FOX_DialogueChannel, "If this General is in Lumphat right, why don’t we just blow the place to pieces with an Arclight?"];
        _player setRandomLip true;
        waitUntil {isNull _sound};
        _player setRandomLip false;
        ["answer3", _player, Marcinko] spawn FoxClub_fnc_Conversation;
    };

    case "answer3": {
        private _sound = _npc say3D "answer1";
        _npc customChat [FOX_DialogueChannel, "We can’t be certain he’s there. We need to confirm his location and get a solid kill before taking any action. Besides, it’s illegal to use an Arclight in Cambodia. Higher-ups fear escalation."];
        _npc setRandomLip true;
        waitUntil {isNull _sound};
        _npc setRandomLip false;
        ["question3_1", _player] spawn FoxClub_fnc_Conversation;
    };

    case "question3_1": {
        private _sound = _player say3D "question1";
        _player customChat [FOX_DialogueChannel, "Hell, it ain’t legal for us to be there either!"];
        _player setRandomLip true;
        waitUntil {isNull _sound};
        _player setRandomLip false;
        ["answer3_1", _player, Marcinko] spawn FoxClub_fnc_Conversation;
    };

    case "answer3_1": {
        private _sound = _npc say3D "answer1";
        _npc customChat [FOX_DialogueChannel, "Exactly. That’s why you need to make damn sure to destroy the STAB, P.O."];
        _npc setRandomLip true;
        waitUntil {isNull _sound};
        _npc setRandomLip false;
        missionNamespace setVariable ["AllowActionTalk", true, true];
    };

// Marcinko Question 4
    case "question4": {
        private _sound = _player say3D "question1";
        _player customChat [FOX_DialogueChannel, "I’m curious—why can’t we insert with a bird if we’re extracting with one?"];
        _player setRandomLip true;
        waitUntil {isNull _sound};
        _player setRandomLip false;
        ["answer4", _player, Marcinko] spawn FoxClub_fnc_Conversation;
    };

    case "answer4": {
        private _sound = _npc say3D "answer1";
        _npc customChat [FOX_DialogueChannel, "There are a few reasons. First, helicopters are noisy and could blow our cover. Second, what if it gets shot down on the way in—"];
        _npc setRandomLip true;
        waitUntil {isNull _sound};
        _npc setRandomLip false;
        ["question4_1", _player] spawn FoxClub_fnc_Conversation;
    };

    case "question4_1": {
        private _sound = _player say3D "question1";
        _player customChat [FOX_DialogueChannel, "What if it gets shot down on the way out?"];
        _player setRandomLip true;
        waitUntil {isNull _sound};
        _player setRandomLip false;
        ["answer4_1", _player, Marcinko] spawn FoxClub_fnc_Conversation;
    };

    case "answer4_1": {
        private _sound = _npc say3D "answer1";
        _npc customChat [FOX_DialogueChannel, "Everything is a calculated risk. The operation planners have weighed these risks carefully and done what they can to minimize them."];
        _npc setRandomLip true;
        waitUntil {isNull _sound};
        _npc setRandomLip false;
        missionNamespace setVariable ["AllowActionTalk", true, true];
    };

// Marcinko Question 5
    case "question5": {
        private _sound = _player say3D "question1";
        _player customChat [FOX_DialogueChannel, "Can you tell me more about General Tan?"];
        _player setRandomLip true;
        waitUntil {isNull _sound};
        _player setRandomLip false;
        ["answer5", _player, Marcinko] spawn FoxClub_fnc_Conversation;
    };

    case "answer5": {
        private _sound = _npc say3D "answer1";
        _npc customChat [FOX_DialogueChannel, "General Tan has been a key figure with the PAVN for quite a while—longer than we’ve been in Vietnam. He fought against the French before us and has played a crucial role in building and maintaining the Ho Chi Minh Trail. That’s likely why he’s there now—ensuring everything on the trail is running smoothly."];
        _npc setRandomLip true;
        waitUntil {isNull _sound};
        _npc setRandomLip false;
        missionNamespace setVariable ["AllowActionTalk", true, true];
    };

// Marcinko Question 6
    case "question6": {
        private _sound = _player say3D "question1";
        _player customChat [FOX_DialogueChannel, "If we get the chance, should we try to capture him? A goddamn General is worth more alive than dead!"];
        _player setRandomLip true;
        waitUntil {isNull _sound};
        _player setRandomLip false;
        ["answer6", _player, Marcinko] spawn FoxClub_fnc_Conversation;
    };

    case "answer6": {
        private _sound = _npc say3D "answer1";
        _npc customChat [FOX_DialogueChannel, "Don’t even think about it. Look, P.O., he’s a fanatic. He’s fully committed to this communist bullshit. He’s not going to surrender easily. This guy will either put a bullet in you or take one himself. Understand?"];
        _npc setRandomLip true;
        waitUntil {isNull _sound};
        _npc setRandomLip false;
        ["question6_1", _player] spawn FoxClub_fnc_Conversation;
    };

    case "question6_1": {
        private _sound = _player say3D "question1";
        _player customChat [FOX_DialogueChannel, "Fuckin’ rat commies."];
        _player setRandomLip true;
        waitUntil {isNull _sound};
        _player setRandomLip false;
        ["answer6_1", _player, Marcinko] spawn FoxClub_fnc_Conversation;
    };

    case "answer6_1": {
        private _sound = _npc say3D "answer1";
        _npc customChat [FOX_DialogueChannel, "Fuckin’ rat commies, indeed."];
        _npc setRandomLip true;
        waitUntil {isNull _sound};
        _npc setRandomLip false;
        missionNamespace setVariable ["AllowActionTalk", true, true];
    };

// Marcinko Question 7
    case "question7": {
        private _sound = _player say3D "question1";
        _player customChat [FOX_DialogueChannel, "How reliable is this intel?"];
        _player setRandomLip true;
        waitUntil {isNull _sound};
        _player setRandomLip false;
        ["answer7", _player, Marcinko] spawn FoxClub_fnc_Conversation;
    };

    case "answer7": {
        private _sound = _npc say3D "answer1";
        _npc customChat [FOX_DialogueChannel, "The prisoner who provided it is locked up in the prison just North of us. It’s solid and credible, or the top brass wouldn’t have signed off on the mission."];
        _npc setRandomLip true;
        waitUntil {isNull _sound};
        _npc setRandomLip false;
        missionNamespace setVariable ["AllowActionTalk", true, true];
    };

// Marcinko Question 8
	case "question8": {
        private _sound = _player say3D "question1";
        _player customChat [FOX_DialogueChannel, "What’s your story, pal?"];
        _player setRandomLip true;
        waitUntil {isNull _sound};
        _player setRandomLip false;
        ["answer8", _player, scout] spawn FoxClub_fnc_Conversation;
    };

    case "answer8": {
        private _sound = _npc say3D "answer1";
        _npc customChat [FOX_DialogueChannel, "I come from 2nd Battalion, 9th Marine Regiment, 3rd Marine Division. Fight many battles, hills and more. I know combat very well. I fight in tough places and make many missions. I here to do job and help you. You need anything, I can do."];
        _npc setRandomLip true;
        waitUntil {isNull _sound};
        _npc setRandomLip false;
        ["question8_1", _player, _npc] spawn FoxClub_fnc_Conversation;
    };

    case "question8_1": {
        private _sound = _player say3D "question1";
        _player customChat [FOX_DialogueChannel, "You talk the talk. Let's see if you can walk the walk."];
        _player setRandomLip true;
        waitUntil {isNull _sound};
        _player setRandomLip false;
        ["answer8_1", _player, _npc] spawn FoxClub_fnc_Conversation;
    };

    case "answer8_1": {
        private _sound = _npc say3D "answer1";
        _npc customChat [FOX_DialogueChannel, "You think I just talk big? I show you. Back in hills, I save many. Not just talk, I do. You see."];
        _npc setRandomLip true;
        waitUntil {isNull _sound};
        _npc setRandomLip false;
        ["question8_2", _player, _npc] spawn FoxClub_fnc_Conversation;
    };
    
    case "question8_2": {
        private _sound = _player say3D "question1";
        _player customChat [FOX_DialogueChannel, "Alright, Carson. Let’s see what you’ve got."];
        _player setRandomLip true;
        waitUntil {isNull _sound};
        _player setRandomLip false;
        missionNamespace setVariable ["AllowActionTalk", true, true];
    };

// Players Arrive at Recon Spot
    case "radiohq1": {
        private _sound = _player say3D "wait1";
        private _sound2 = playsound "wait1";
        _player sideChat "Rankin, Hawk. We’re set and ready for the show. Over.";
        _player setRandomLip true;
        waitUntil {isNull _sound};
        _player setRandomLip false;
        ["hqresponse1"] spawn FoxClub_fnc_Conversation;
    };

    case "hqresponse1": {
        private _sound = playsound "wait2";
        HQRadio sideChat "Hawk, Rankin. Roger that. Heads up, weather should be moving in shortly. Out.";
        waitUntil {isNull _sound};
        execVM "scripts\RadioHQ.sqf";
    };

// Players leave the HQ Area
    case "looksharp": {
        private _sound = _player say3D "wait1";
        _player customChat [FOX_DialogueChannel, "Look sharp, idiots."];
        _player setRandomLip true;
        waitUntil {isNull _sound};
        _player setRandomLip false;
    };
};

