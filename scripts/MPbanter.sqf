/*
    File: MPbanter.sqf
    Author: FoxClubNiner
    Description:
        Randomized NPC convo at the start of the mission. Jeep picks up a passenger.
*/

// Define the random code blocks
MPBanter1 = { 
	["mpbanter1", [MP2, MP1]] remoteExec [
        "FoxClub_fnc_Conversation", 
        allPlayers select {_x distance MP2 <= 100}
    ]; 	
};

MPBanter2 = {
    ["mpbanter2", [MP2, MP1]] remoteExec [
        "FoxClub_fnc_Conversation", 
        allPlayers select {_x distance MP2 <= 100}
    ];
};

MPBanter3 = {
    ["mpbanter3", [MP2, MP1]] remoteExec [
        "FoxClub_fnc_Conversation", 
        allPlayers select {_x distance MP2 <= 100}
    ];
};

// Store the code blocks in an array
_banterArray = [MPBanter1, MPBanter2, MPBanter3];

// Select a random code block
_randomBanter = selectRandom _banterArray;

// Execute the selected random code block
call _randomBanter; //_randomBanter



