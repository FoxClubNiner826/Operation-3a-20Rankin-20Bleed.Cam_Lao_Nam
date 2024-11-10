["mpbanter4", [MP2, MP3]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance MP2 <= 100}];

/*
    ["MPBanter2", "StagingArea", ["MPBanter4_1", "MPBanter4_1"], "DIRECT"] spawn BIS_fnc_kbTell;
    [MP2, ["MPBanter4_1",100]] remoteExec ["say3D"]; //plays sound file from NPC
	[MP2, true] remoteExec ["setRandomLip"]; //NPC lips move
	sleep 1; //waits for sound file to finish
	[MP2, false] remoteExec ["setRandomLip"]; //NPC lips stop
    
    ["MPBanter2", "StagingArea", ["MPBanter4_2", "MPBanter4_2"], "DIRECT"] spawn BIS_fnc_kbTell;
    [MP3, ["MPBanter4_2",100]] remoteExec ["say3D"]; //plays sound file from NPC
	[MP3, true] remoteExec ["setRandomLip"]; //NPC lips move
	sleep 4; //waits for sound file to finish
	[MP3, false] remoteExec ["setRandomLip"]; //NPC lips stop
    
    ["MPBanter2", "StagingArea", ["MPBanter4_3", "MPBanter4_3"], "DIRECT"] spawn BIS_fnc_kbTell;
    [MP2, ["MPBanter4_3",100]] remoteExec ["say3D"]; //plays sound file from NPC
	[MP2, true] remoteExec ["setRandomLip"]; //NPC lips move
	sleep 3; //waits for sound file to finish
	[MP2, false] remoteExec ["setRandomLip"]; //NPC lips stop
    
    ["MPBanter2", "StagingArea", ["MPBanter4_4", "MPBanter4_4"], "DIRECT"] spawn BIS_fnc_kbTell;
    [MP3, ["MPBanter4_4",100]] remoteExec ["say3D"]; //plays sound file from NPC
	[MP3, true] remoteExec ["setRandomLip"]; //NPC lips move
	sleep 2; //waits for sound file to finish
	[MP3, false] remoteExec ["setRandomLip"]; //NPC lips stop
