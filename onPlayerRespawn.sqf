//wait for naval patrol hold action. old one below was in trigger on activation
//player addAction ["<t color='#FFFF00'>Radio Headquarters</t>", {GlobalRadioHQ = false; publicVariable "GlobalRadioHQ"; ["scripts\RadioHQ.sqf"] remoteExec ["execVM", 0];}, nil, 8, false, true, "", "isNil 'GlobalRadioHQ'"];
[
	player,
	"<t color='#FFFF00'>Radio Headquarters</t>",
	"a3\missions_f_oldman\data\img\holdactions\holdaction_talk_ca.paa", //idle icon 
	"a3\missions_f_oldman\data\img\holdactions\holdaction_talk_ca.paa", //progress icon
	"ActionCallHQ", //condition
	"true", //condition progress
	{}, //code on start
	{}, // code every tick
	{
		missionNamespace setVariable ["ActionCallHQ", false, true];  
		["scripts\RadioHQ.sqf"] remoteExec ["execVM", 0];
	}, // code on finish
	{}, // code on interuption
	[], //arguements
	3, //duration
	8, //order from top
	true, //remove on finish
	false, //show if unconcious
	false //show in middle of screen
] call BIS_fnc_holdActionAdd;

// calls POW to surface
player addAction [
    "<t color='#FFFF00'>Call POW</t>", 
    { 
    missionNamespace setVariable ["ActionCallPOW", false, true];
	[player, "Alright buddy. Come on up."] remoteExec ["sideChat"];
	sleep 5;
	[POW, "Be right there."] remoteExec ["sideChat"];
	sleep 5;
	POW setPosATL (getPosATL ExitSpot);
	sleep 1;
	[POW] join (group player);
	sleep 1; //needed for setcaptive
	POW setCaptive false;
	POW enableai "PATH";
	sleep 2;
	[POW, "Lead the way boss."] remoteExec ["sideChat"];
    }, 
    nil, 
    8, 
    false, 
    true, 
    "", 
    "_this distance fieldtelephone < 4 && ActionCallPOW && alive pow"
];

//extract action
player addAction [
    "<t color='#FFFF00'>Radio for Extraction</t>", 
    { 
	{[_x,"ALL"] remoteExec ["disableAI",0,true];} forEach crew samlauncher;
	missionNamespace setVariable ["ExtractAction", false, true];
    missionNamespace setVariable ["ChopperLZ", true, true];
    missionNamespace setVariable ["RTBAction", true, true];
	[player, "Rankin, Covey. Requesting exfil. Over."] remoteExec ["sideChat"];
	sleep 5;
	[covey, "Covey, Rankin. Air inbound one mike, over."] remoteExec ["sideChat"];
    }, 
    nil, 
    8, 
    false, 
    true, 
    "", 
    "ExtractAction"
];

// confirm smoke convo
player addAction [
    "<t color='#FFFF00'>Confirm Smoke Color</t>", 
    { 
    missionNamespace setVariable ["ActionConfirmSmoke", false, true];
	[player, "Rankin, Ranger. Affirmative, you are cleared for touchdown. Over."] remoteExec ["sideChat"];
	sleep 5;
	[Ranger, "Ranger, Rankin. Copy. Let's do this one quick-like. Over."] remoteExec ["sideChat"];
    }, 
    nil, 
    8, 
    false, 
    true, 
    "", 
    "ActionConfirmSmoke"
];


//bomb for weapon cache. Although normally you dont want non player object addactions here in OPR, this is needed because if a player uses the hold action
//it is removed from their action menu. If they die it will remember they used the hold action and wouldnt be able to use it again. Changing the remove
//action to repeat wont work cause there is an addaction nested in the hold action and they could repeatedly add the addaction to the obhect. Thus if we 
//place the hold action in OPR then the player will get the option to use it again regardless of death. And because of the remove action command in init
//duplicates of the hold action wont be a problem.
if (!isNil "weaponcache") then {
[
	weaponcache,
	"<t color='#FFFF00'>Place C-4 Plastic Explosive</t>",
	"a3\ui_f_oldman\data\igui\cfg\holdactions\destroy_ca.paa", //idle icon 
	"a3\ui_f_oldman\data\igui\cfg\holdactions\destroy_ca.paa", //progress icon
	"_this distance _target < 3", //condition
	"true", //condition progress
	{}, //code on start
	{}, // code every tick
	{
			player addAction [
			"<t color='#FF0000'>Detonate Weapons Cache</t>", 
			{
			"M_Mo_82mm_AT_LG" createVehicle (getPos weaponcache);
			sleep 1;
			deletevehicle weaponcache;
			deletevehicle ammo_crate2;
			deletevehicle ammo_crate3;
			deletevehicle shelter1;
			}, 
			nil, 
			8, 
			false, 
			true,
			"",
			"_this distance weaponcache < 30"
			];

	}, // code on finish
	{}, // code on interuption
	[], //arguements
	3, //duration
	8, //order from top
	true, //remove on finish
	false, //show if unconcious
	false //show in middle of screen
] call BIS_fnc_holdActionAdd;
};

//bomb for food cache
if (!isNil "foodcache") then {
[
	foodcache,
	"<t color='#FFFF00'>Place C-4 Plastic Explosive</t>",
	"a3\ui_f_oldman\data\igui\cfg\holdactions\destroy_ca.paa", //idle icon 
	"a3\ui_f_oldman\data\igui\cfg\holdactions\destroy_ca.paa", //progress icon
	"_this distance _target < 3", //condition
	"true", //condition progress
	{}, //code on start
	{}, // code every tick
	{
		player addAction [
			"<t color='#FF0000'>Detonate Food Cache</t>", 
			{ 
			"M_Mo_82mm_AT_LG" createVehicle (getPos foodcache);
			sleep 1;
			deletevehicle foodcache;
			deletevehicle food1;
			deletevehicle food4;
			deletevehicle food5;
			deletevehicle food6;
			deletevehicle food7;
			deletevehicle food8;
			deletevehicle food9;
			deletevehicle food10;
			}, 
			nil, 
			8, 
			false, 
			true,
			"",
			"_this distance foodcache < 30"
			];
		
	}, // code on finish
	{}, // code on interuption
	[], //arguements
	3, //duration
	8, //order from top
	true, //remove on finish
	false, //show if unconcious
	false //show in middle of screen
] call BIS_fnc_holdActionAdd;
};
