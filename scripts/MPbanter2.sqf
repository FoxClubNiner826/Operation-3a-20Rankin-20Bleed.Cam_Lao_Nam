
_MPBanter = [
    ["MPBanter2", "StagingArea", ["MPBanter1_1", "MPBanter1_5"]],
    ["MPBanter2", "StagingArea", ["MPBanter2_1", "MPBanter2_5"]],
    ["MPBanter2", "StagingArea", ["MPBanter3_1", "MPBanter3_5"]]
];

// Randomly select a conversation and spawn it using BIS_fnc_kbTell
_selectedBanter = selectRandom _MPBanter;
[_selectedBanter select 0, _selectedBanter select 1, _selectedBanter select 2, "DIRECT"] spawn BIS_fnc_kbTell;

