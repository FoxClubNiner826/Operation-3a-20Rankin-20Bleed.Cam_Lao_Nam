// Define the random code blocks
MPBanter1 = {

    ["MPBanter", "StagingArea", ["MPBanter1_1", "MPBanter1_1"], "DIRECT"] spawn BIS_fnc_kbTell;
    [MP2, ["MPBanter1_1",100]] remoteExec ["say3D"]; //plays sound file from NPC
	[MP2, true] remoteExec ["setRandomLip"]; //NPC lips move
	sleep 1; //waits for sound file to finish
	[MP2, false] remoteExec ["setRandomLip"]; //NPC lips stop
    
    sleep 1;
    ["MPBanter", "StagingArea", ["MPBanter1_2", "MPBanter1_2"], "DIRECT"] spawn BIS_fnc_kbTell;
    [MP1, ["MPBanter1_2",100]] remoteExec ["say3D"]; //plays sound file from NPC
	[MP1, true] remoteExec ["setRandomLip"]; //NPC lips move
	sleep 4; //waits for sound file to finish
	[MP1, false] remoteExec ["setRandomLip"]; //NPC lips stop
    
    ["MPBanter", "StagingArea", ["MPBanter1_3", "MPBanter1_3"], "DIRECT"] spawn BIS_fnc_kbTell;
    [MP2, ["MPBanter1_3",100]] remoteExec ["say3D"]; //plays sound file from NPC
	[MP2, true] remoteExec ["setRandomLip"]; //NPC lips move
	sleep 3; //waits for sound file to finish
	[MP2, false] remoteExec ["setRandomLip"]; //NPC lips stop
    
    ["MPBanter", "StagingArea", ["MPBanter1_4", "MPBanter1_4"], "DIRECT"] spawn BIS_fnc_kbTell;
    [MP1, ["MPBanter1_4",100]] remoteExec ["say3D"]; //plays sound file from NPC
	[MP1, true] remoteExec ["setRandomLip"]; //NPC lips move
	sleep 2; //waits for sound file to finish
	[MP1, false] remoteExec ["setRandomLip"]; //NPC lips stop
};

MPBanter2 = {
    
    hint "Executing MPBanter2";
    ["MPBanter", "StagingArea", ["MPBanter1_1", "MPBanter1_1"], "DIRECT"] spawn BIS_fnc_kbTell;
    [MP2, ["question1",100]] remoteExec ["say3D"]; //plays sound file from NPC
	[MP2, true] remoteExec ["setRandomLip"]; //NPC lips move
	sleep 6; //waits for sound file to finish
	[MP2, false] remoteExec ["setRandomLip"]; //NPC lips stop
    
    ["MPBanter", "StagingArea", ["MPBanter1_2", "MPBanter1_2"], "DIRECT"] spawn BIS_fnc_kbTell;
    [MP1, ["answer1",100]] remoteExec ["say3D"]; //plays sound file from NPC
	[MP1, true] remoteExec ["setRandomLip"]; //NPC lips move
	sleep 6; //waits for sound file to finish
	[MP1, false] remoteExec ["setRandomLip"]; //NPC lips stop
    
    ["MPBanter", "StagingArea", ["MPBanter1_3", "MPBanter1_3"], "DIRECT"] spawn BIS_fnc_kbTell;
    [MP2, ["question1",100]] remoteExec ["say3D"]; //plays sound file from NPC
	[MP2, true] remoteExec ["setRandomLip"]; //NPC lips move
	sleep 6; //waits for sound file to finish
	[MP2, false] remoteExec ["setRandomLip"]; //NPC lips stop
    
    ["MPBanter", "StagingArea", ["MPBanter1_4", "MPBanter1_4"], "DIRECT"] spawn BIS_fnc_kbTell;
    [MP1, ["answer1",100]] remoteExec ["say3D"]; //plays sound file from NPC
	[MP1, true] remoteExec ["setRandomLip"]; //NPC lips move
	sleep 6; //waits for sound file to finish
	[MP1, false] remoteExec ["setRandomLip"]; //NPC lips stop
};

MPBanter3 = {
    
    hint "Executing MPBanter3";
    ["MPBanter", "StagingArea", ["MPBanter1_1", "MPBanter1_1"], "DIRECT"] spawn BIS_fnc_kbTell;
    [MP2, ["question1",100]] remoteExec ["say3D"]; //plays sound file from NPC
	[MP2, true] remoteExec ["setRandomLip"]; //NPC lips move
	sleep 6; //waits for sound file to finish
	[MP2, false] remoteExec ["setRandomLip"]; //NPC lips stop
    
    ["MPBanter", "StagingArea", ["MPBanter1_2", "MPBanter1_2"], "DIRECT"] spawn BIS_fnc_kbTell;
    [MP1, ["answer1",100]] remoteExec ["say3D"]; //plays sound file from NPC
	[MP1, true] remoteExec ["setRandomLip"]; //NPC lips move
	sleep 6; //waits for sound file to finish
	[MP1, false] remoteExec ["setRandomLip"]; //NPC lips stop
    
    ["MPBanter", "StagingArea", ["MPBanter1_3", "MPBanter1_3"], "DIRECT"] spawn BIS_fnc_kbTell;
    [MP2, ["question1",100]] remoteExec ["say3D"]; //plays sound file from NPC
	[MP2, true] remoteExec ["setRandomLip"]; //NPC lips move
	sleep 6; //waits for sound file to finish
	[MP2, false] remoteExec ["setRandomLip"]; //NPC lips stop
    
    ["MPBanter", "StagingArea", ["MPBanter1_4", "MPBanter1_4"], "DIRECT"] spawn BIS_fnc_kbTell;
    [MP1, ["answer1",100]] remoteExec ["say3D"]; //plays sound file from NPC
	[MP1, true] remoteExec ["setRandomLip"]; //NPC lips move
	sleep 6; //waits for sound file to finish
	[MP1, false] remoteExec ["setRandomLip"]; //NPC lips stop
};

// Store the code blocks in an array
_banterArray = [MPBanter1, MPBanter2, MPBanter3];

// Select a random code block
_randomBanter = selectRandom _banterArray;

// Execute the selected random code block
call MPBanter1;


/* Can't do it like this because the audio file lowered when they are in the car.

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



