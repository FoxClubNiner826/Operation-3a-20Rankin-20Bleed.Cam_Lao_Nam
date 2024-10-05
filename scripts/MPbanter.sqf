// Array of conversations that can be chosen
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



