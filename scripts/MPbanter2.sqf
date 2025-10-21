/*
    File: MPbanter2.sqf
    Author: FoxClubNiner
    Description:
        NPC convo at the start of the mission. Jeep berates loitering MPs.
*/

["mpbanter4", [MP2, MP3]] remoteExec [
	"FoxClub_fnc_Conversation", 
	allPlayers select {_x distance MP2 <= 50}
];
