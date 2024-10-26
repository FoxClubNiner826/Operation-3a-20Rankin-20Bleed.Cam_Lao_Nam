// Define the random code blocks
MPBanter1 = { 
	
	["mpbanter1_1", MP2] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance MP2 <= 100}]; 
	
};

MPBanter2 = {
    
    ["mpbanter2_1", MP2] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance MP2 <= 100}];

};

MPBanter3 = {
    
    ["mpbanter3_1", MP2] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance MP2 <= 100}];

};

// Store the code blocks in an array
_banterArray = [MPBanter1, MPBanter2, MPBanter3];

// Select a random code block
_randomBanter = selectRandom _banterArray;

// Execute the selected random code block
call _randomBanter; //_randomBanter


/* Can't do it like this with the KBTell function because the audio file lowered when they are in the car.

Array of conversations that can be chosen
_MPBanter = [
    ["MPBanter", "StagingArea", ["MPBanter1_1", "MPBanter1_4"]],
    ["MPBanter", "StagingArea", ["MPBanter2_1", "MPBanter2_4"]],
    ["MPBanter", "StagingArea", ["MPBanter3_1", "MPBanter3_5"]]
];

// Randomly select a conversation and spawn it using BIS_fnc_kbTell
_selectedBanter = selectRandom _MPBanter; // Define variable
_selectedBanter params ["_topic", "_container", "_section"]; // Use params to extract the elements of the array into variables
[_topic, _container, _section, "DIRECT"] spawn BIS_fnc_kbTell; // Now the function is more readable

/* This is the same as above functionally but less readable without the params.
_MPBanter = [
    ["MPBanter", "StagingArea", ["MPBanter1_1", "MPBanter1_4"]],
    ["MPBanter", "StagingArea", ["MPBanter2_1", "MPBanter2_4"]],
    ["MPBanter", "StagingArea", ["MPBanter3_1", "MPBanter3_5"]]
];

// Randomly select a conversation and spawn it using BIS_fnc_kbTell
_selectedBanter = selectRandom _MPBanter;
[_selectedBanter select 0, _selectedBanter select 1, _selectedBanter select 2, "DIRECT"] spawn BIS_fnc_kbTell;



