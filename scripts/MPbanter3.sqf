// Define the random code blocks
MPBanter1 = { 
	
	["mpbanter5_1", MP3] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance MP3 <= 100}]; 
	
};

MPBanter2 = {
    
    ["mpbanter5_2", MP3] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance MP3 <= 100}];

};

MPBanter3 = {
    
    ["mpbanter5_3", MP3] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance MP3 <= 100}];

};

// Store the code blocks in an array
_banterArray = [MPBanter1, MPBanter2, MPBanter3];

// Select a random code block
_randomBanter = selectRandom _banterArray;

// Execute the selected random code block
call _randomBanter; //_randomBanter

/* Define the random code blocks
MPBanter1 = {

    ["MPBanter3", "StagingArea", ["MPBanter5_1", "MPBanter5_1"], "DIRECT"] spawn BIS_fnc_kbTell;
    [MP3, ["MPBanter5_1",100]] remoteExec ["say3D"]; //plays sound file from NPC
	[MP3, true] remoteExec ["setRandomLip"]; //NPC lips move
	sleep 1; //waits for sound file to finish
	[MP3, false] remoteExec ["setRandomLip"]; //NPC lips stop
    
};

MPBanter2 = {
    
    ["MPBanter3", "StagingArea", ["MPBanter5_2", "MPBanter5_2"], "DIRECT"] spawn BIS_fnc_kbTell;
    [MP3, ["MPBanter5_2",100]] remoteExec ["say3D"]; //plays sound file from NPC
	[MP3, true] remoteExec ["setRandomLip"]; //NPC lips move
	sleep 1; //waits for sound file to finish
	[MP3, false] remoteExec ["setRandomLip"]; //NPC lips stop

};

MPBanter3 = {
    
    ["MPBanter3", "StagingArea", ["MPBanter5_3", "MPBanter5_3"], "DIRECT"] spawn BIS_fnc_kbTell;
    [MP3, ["MPBanter5_3",100]] remoteExec ["say3D"]; //plays sound file from NPC
	[MP3, true] remoteExec ["setRandomLip"]; //NPC lips move
	sleep 1; //waits for sound file to finish
	[MP3, false] remoteExec ["setRandomLip"]; //NPC lips stop

};

// Store the code blocks in an array
_banterArray = [MPBanter1, MPBanter2, MPBanter3];

// Select a random code block
_randomBanter = selectRandom _banterArray;

// Execute the selected random code block
call _randomBanter; 
