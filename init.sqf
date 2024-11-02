/*
if (hasInterface && !(missionNamespace getVariable ["MissionIntro", false])) then {
 0 fadeSound 0; //starts with sound off
cuttext ["", "BLACK FADED", 60]; //starts with black screen
sleep 3; //pause before starting typetext
1 fadeSound 1; //turn sounds on
sleep 1; //let sound fade in all the way before typetext
[  
 [  
  ["Phú Quoc Prison", "<t align = 'center' shadow = '1' size = '1.5' font='tt2020style_e_vn_bold'>%1</t><br/>"], 
  ["Staging Area", "<t align = 'center' shadow = '1' size = '1.0'>%1</t><br/>"], 
  ["March 31st, 1967", "<t align = 'center' shadow = '1' size = '1.0'>%1</t><br/>"],  
  ["0010h", "<t align = 'center' shadow = '1' size = '1.0'>%1</t><br/>", 20]  
 ]  
] spawn vn_ms_fnc_sfx_typeText; //message
sleep 17; //pause to finish message while screen is black
cuttext ["", "BLACK IN", 5]; //fades in from black
};
*/

/* jonnyboys no ambient audio script. not working so far
override_vn_sam_masteraudioarray = compile preprocessFileLineNumbers "override_vn_sam_masteraudioarray.sqf";
[] spawn
{
    sleep 90; // wait 90 seconds before overriding to allow time for Prairie Fire to init the audio array.
    [] call override_vn_sam_masteraudioarray;
};
[] call override_vn_sam_masteraudioarray;
*/

//enableRadio false; //disables side caht too. dont use
enableSentences false; //turns off audio but you can still see it in systemchat log
[] call VN_fnc_QOL_earplugs;

// removes addaction from dead bodies. this makes sure there are no duplicate addactions on players too
player addEventHandler ["Killed", {
    removeAllActions (_this select 0); //not removing detonate addaction. maybe cause its nested in hold action? intermittant
	removeAllActions weaponcache;
	removeAllActions foodcache;
}];


myBuilding = ((nearestObjects [getpos chair1,["Land_vn_hut_02"],20])#0);
myBuilding2 = ((nearestObjects [getpos hut_table2,["Land_vn_hut_07"],20])#0);
myBuilding3 = ((nearestObjects [getpos hut3_wire1,["Land_vn_hut_06"],20])#0);
myBuildgunboat1 = ((nearestObjects [getpos gunboat_file,["Land_vn_hut_02"],20])#0);
myBuildgunboat2 = ((nearestObjects [getpos gunboat_file,["Land_vn_hut_01"],20])#0);
myBuildgunboat3 = ((nearestObjects [getpos gunboat_file,["Land_vn_hut_07"],20])#0);
myBuildcache1 = ((nearestObjects [getpos photo,["Land_vn_hut_02"],20])#0);
myBuildcache2 = ((nearestObjects [getpos photo,["Land_vn_hut_02"],20])#0);
myBuildcache2 = ((nearestObjects [getpos photo,["Land_vn_hut_01"],20])#0);
myBuildsam1 = ((nearestObjects [getpos samsite_file,["Land_vn_hut_07"],20])#0);
myBuildsam2 = ((nearestObjects [getpos samsite_file,["Land_vn_c_prop_car_01"],20])#0);
myBuildsam3 = ((nearestObjects [getpos samsite_file,["Land_vn_hut_07"],20])#0);

addMissionEventHandler ["BuildingChanged", {
    params ["_from", "_to", "_isRuin"];
    if (_from isEqualTo myBuilding) then
    {
        deleteVehicle chair1;
		deleteVehicle desk1;
		deleteVehicle radio_hut1;
		deleteVehicle hut_cup1;
		deleteVehicle hut_cup2;
		deleteVehicle hut_cup3;
		deleteVehicle hut_file1;
		deleteVehicle hut_file2;
		deleteVehicle hut_trash1;
		deleteVehicle hut_cupboard1;
		hint "hut 1 deleted"; // put your deleteVehicle commands here
    };
	if (_from isEqualTo myBuilding2) then
    {
        deleteVehicle hut_table2;
		deleteVehicle hut_bench;
		deleteVehicle hut2_chair1;
		deleteVehicle hut2_table2;
		deleteVehicle hut2_bed1;
		deleteVehicle hut2_bedroll1;
		hint "hut 2 deleted"; // put your deleteVehicle commands here
    };
	if (_from isEqualTo myBuilding3) then
    {
        deleteVehicle hut3_wire1;
		deleteVehicle hut3_table1;
		deleteVehicle hut3_chair1;
		deleteVehicle hut3_stool1;
		deleteVehicle hut3_bench1;
		deleteVehicle cachetask;
		deleteVehicle photo;
		hint "hut 3 deleted"; // put your deleteVehicle commands here
    };
	if (_from isEqualTo myBuildgunboat1) then
    {
        deleteVehicle gunboattask;
		deleteVehicle gunboat_file;
		hint "boat file deleted"; // put your deleteVehicle commands here
    };
	if (_from isEqualTo myBuildgunboat2) then
    {
        deleteVehicle gunboattask;
		deleteVehicle gunboat_file;
		hint "boat file deleted"; // put your deleteVehicle commands here
    };
	if (_from isEqualTo myBuildgunboat3) then
    {
        deleteVehicle gunboattask;
		deleteVehicle gunboat_file;
		hint "boat file deleted"; // put your deleteVehicle commands here
    };
	if (_from isEqualTo myBuildcache1) then
    {
        deleteVehicle photo;
		deleteVehicle cachetask;
		hint "cache file deleted"; // put your deleteVehicle commands here
    };
	if (_from isEqualTo myBuildcache2) then
    {
        deleteVehicle photo;
		deleteVehicle cachetask;
		hint "cache file deleted"; // put your deleteVehicle commands here
    };
	if (_from isEqualTo myBuildcache3) then
    {
        deleteVehicle photo;
		deleteVehicle cachetask;
		hint "cache file deleted"; // put your deleteVehicle commands here
    };
	if (_from isEqualTo myBuildsam1) then
    {
        deleteVehicle samsite_file;
		deleteVehicle samtask;
		hint "samsite file deleted"; // put your deleteVehicle commands here
    };
	if (_from isEqualTo myBuildsam2) then
    {
        deleteVehicle samsite_file;
		deleteVehicle samtask;
		hint "samsite file deleted"; // put your deleteVehicle commands here
    };
	if (_from isEqualTo myBuildsam3) then
    {
        deleteVehicle samsite_file;
		deleteVehicle samtask;
		hint "samsite file deleted"; // put your deleteVehicle commands here
    };
}];

// From Nikko
foxclub_var_conversations = createHashMapFromArray [
	["convo_8",
		[
			[0, "I'm a question!", "intro1", 3],
			[1, "I'm an answer!", "intro1", 2.5]
		]
	],
	["convo_9",
		[
			[0,"I'm another question!", "foxclub_sound3", 2],
			[1,"I'm another answer!", "foxclub_sound4", 4],
			[1, "Answer 2 part 2!","foxclub_sound6"]
		]
	]
];

/*
// CONVERSATION FORMAT
["keyword reference",
	[
		[_speakerIndex, "text", "soundClass"],
		[_speakerIndex, "text2", "soundClass2"]
	]
]

// CALL FORMAT
["keyword reference",[_speakerUnit0, _speakerUnit1, _speakerUnit2]] remoteExec ["foxclub_fnc_conversation"];