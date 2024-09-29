/* Define the array with your audio tracks
_MP1Tracks = [
    ["MP1_1", 75],  // First track and its volume
    ["MP1_2", 75],
	["MP1_3", 75]// Second track and its volume
];

// Randomly select an audio track from the array
_selectedTrack = selectRandom _MP1Tracks;

// Play the selected audio track
MP1 setRandomLip true;
MP1 say3D [_selectedTrack select 0, _selectedTrack select 1];
MP1 setRandomLip false;


sleep 5; // lets track finsish playing

// Define the array with your audio tracks
_MP2Tracks = [
    ["MP2_1", 100],  // First track and its volume
    ["MP2_2", 100],
	["MP2_3", 100]// Second track and its volume
];

// Randomly select an audio track from the array
_selectedTrack = selectRandom _MP2Tracks;

// Play the selected audio track
MP2 setRandomLip true;
MP2 say3D [_selectedTrack select 0, _selectedTrack select 1];
MP2 setRandomLip false;

/* Building the Final Convo.
_Convo1 = 
JeepDriver say3D "JeepDriver1_1";
JeepDriver setRandomLip true;
sleep 5;
JeepDriver setRandomLip false;

["MPBanter", "StagingArea", ["MPBanter1_1", "MPBanter1_4"]] spawn BIS_fnc_kbTell;

["MPBanter", "StagingArea", ["MPBanter2_1", "MPBanter2_4"]] spawn BIS_fnc_kbTell;

["MPBanter", "StagingArea", ["MPBanter3_1", "MPBanter3_5"]] spawn BIS_fnc_kbTell;

selectRandom _MPBanter;


_MPBanter = [
    ["MPBanter", "StagingArea", ["MPBanter1_1", "MPBanter1_4"]] spawn BIS_fnc_kbTell;,
    ["MPBanter", "StagingArea", ["MPBanter2_1", "MPBanter2_4"]] spawn BIS_fnc_kbTell;,
    ["MPBanter", "StagingArea", ["MPBanter3_1", "MPBanter3_5"]] spawn BIS_fnc_kbTell;
];

selectRandom _MPBanter;
*/

_MPBanter = [
    ["MPBanter", "StagingArea", ["MPBanter1_1", "MPBanter1_4"]],
    ["MPBanter", "StagingArea", ["MPBanter2_1", "MPBanter2_4"]],
    ["MPBanter", "StagingArea", ["MPBanter3_1", "MPBanter3_5"]]
];

// Randomly select a conversation and spawn it using BIS_fnc_kbTell
_selectedBanter = selectRandom _MPBanter;
[_selectedBanter select 0, _selectedBanter select 1, _selectedBanter select 2, "DIRECT"] spawn BIS_fnc_kbTell;



