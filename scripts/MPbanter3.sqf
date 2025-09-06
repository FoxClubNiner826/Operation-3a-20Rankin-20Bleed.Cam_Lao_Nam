/*
    File: MPbanter3.sqf
    Author: FoxClubNiner
    Description:
        NPC convo on beach upon seeing players.
*/

// Define the random code blocks
MPBanter1 = { 
	["mpbanter5_1", [MP3]] remoteExec [
		"FoxClub_fnc_Conversation", 
		allPlayers select {_x distance MP3 <= 100}
	]; 
};

MPBanter2 = {
    ["mpbanter5_2", [MP3]] remoteExec [
		"FoxClub_fnc_Conversation", 
		allPlayers select {_x distance MP3 <= 100}
	];
};

MPBanter3 = {
    ["mpbanter5_3", [MP3]] remoteExec [
		"FoxClub_fnc_Conversation", 
		allPlayers select {_x distance MP3 <= 100}
	];
};

// Store the code blocks in an array
_banterArray = [MPBanter1, MPBanter2, MPBanter3];

// Select a random code block
_randomBanter = selectRandom _banterArray;

// Execute the selected random code block
call _randomBanter; //_randomBanter
