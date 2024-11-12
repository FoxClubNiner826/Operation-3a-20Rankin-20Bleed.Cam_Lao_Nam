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

foxclub_var_conversations = createHashMapFromArray [
	["intro1",
		[
			[0, "Good morning gentlemen. There's an arsenal right there if you want to adjust your equipment. I'll be over here if you have any last minute questions.", "answer"]
		]
	],
	["intro2",
		[
			[0,"What's on your mind P.O.?", "answer"]
		]
	],
	["mpbanter1",
		[
			[0,"Hop in, Lee.", "answer"],
			[1,"Thank God. Get me to the latrine. That chow's tearing me up!", "answer"],
			[0,"Jesus, just don't mess up the damn jeep.", "answer"],
			[1,"No promises, Byrd. Step on it.", "answer"]
		]
	],
	["mpbanter2",
		[
			[0,"You wouldn’t believe it. I caught a rat in the mess hall.", "answer"],
			[1,"Seriously? I thought they’d fixed that problem.", "answer"],
			[0,"Yeah, and if you look at the chow it's suspiciously rodent-like.", "answer"],
			[1,"I’ll take my chances. Had enough C-rations to last me a lifetime.", "answer"]
		]
	],
	["mpbanter3",
		[
			[0,"We just chased down an escaped prisoner!", "answer"],
			[1,"No way! How'd that go down?", "answer"],
			[0,"We tracked him for half a klick through the jungle. Finally caught him trying to hide up a damn palm tree.", "answer"],
			[1,"Sounds like a real mess. Just another day in paradise, right?", "answer"]
		]
	],
	["mpbanter4",
		[
			[0,"What’s this? You two lounging around while you’re supposed to be on patrol?", "answer"],
			[1,"Just catching a break. Did you read the Stripes yesterday? Westmoreland thinks we've almost licked the VC!", "answer"],
			[0,"Well, until we have you're still on patrol.", "answer"],
			[1,"Understood. Come on, Anderson. Let's go.", "answer"]
		]
	],
	["mpbanter5_1",
		[
			[0,"Big stuff must be going down. Hope you boys come back in one piece!", "answer"]
		]
	],
	["mpbanter5_2",
		[
			[0,"Looks like yall're in for a wild ride. Keep your heads down!", "answer"]
		]
	],
	["mpbanter5_3",
		[
			[0,"Damn, something serious is happening. Give 'em hell!", "answer"]
		]
	],
	["question1",
		[
			[0,"Could this be a trap?", "question"],
			[1,"It’s possible. But if the guys at the farm gave it the green light, they must believe it’s legitimate. Otherwise, we wouldn’t be getting orders from higher-ups.", "answer"]
		]
	],
	["question2",
		[
			[0,"Do we really need a Kit Carson? How can we trust him?", "question"],
			[1,"As I mentioned in the briefing, he’s been vetted by the Marines. He’s seen combat and performed better than some of our own. If you have concerns, go talk to him yourself.", "answer"]
		]
	],
	["question3",
		[
			[0,"If this General is in Lumphat right, why don’t we just blow the place to pieces with an Arclight?", "question"],
			[1,"We can’t be certain he’s there. We need to confirm his location and get a solid kill before taking any action. Besides, it’s illegal to use an Arclight in Cambodia. Higher-ups fear escalation.", "answer"],
			[0,"Hell, it ain’t legal for us to be there either!", "question"],
			[1,"Exactly. That’s why you need to make damn sure to destroy the STAB, P.O.", "answer"]
		]
	],
	["question4",
		[
			[0,"I’m curious—why can’t we insert with a bird if we’re extracting with one?", "question"],
			[1,"There are a few reasons. First, helicopters are noisy and could blow our cover. Second, what if it gets shot down on the way in—", "answer"],
			[0,"What if it gets shot down on the way out?", "question"],
			[1,"Everything is a calculated risk. The operation planners have weighed these risks carefully and done what they can to minimize them.", "answer"]
		]
	],
	["question5",
		[
			[0,"Can you tell me more about General Tan?", "question"],
			[1,"General Tan has been a key figure with the PAVN for quite a while—longer than we’ve been in Vietnam. He fought against the French before us and has played a crucial role in building and maintaining the Ho Chi Minh Trail. That’s likely why he’s there now—ensuring everything on the trail is running smoothly.", "answer"]
		]
	],
	["question6",
		[
			[0,"If we get the chance, should we try to capture him? A goddamn General is worth more alive than dead!", "question"],
			[1,"Don’t even think about it. Look, P.O., he’s a fanatic. He’s fully committed to this communist bullshit. He’s not going to surrender easily. This guy will either put a bullet in you or take one himself. Understand?", "answer"],
			[0,"Fuckin’ rat commies.", "question"],
			[1,"Fuckin’ rat commies, indeed.", "answer"]
		]
	],
	["question7",
		[
			[0,"How reliable is this intel?", "question"],
			[1,"The prisoner who provided it is locked up in the prison just North of us. It’s solid and credible, or the top brass wouldn’t have signed off on the mission.", "answer"]
		]
	],
	["question8",
		[
			[0,"What’s your story, pal?", "question"],
			[1,"I come from 2nd Battalion, 9th Marine Regiment, 3rd Marine Division. Fight many battles, hills and more. I know combat very well. I fight in tough places and make many missions. I here to do job and help you. You need anything, I can do.", "answer"],
			[0,"You talk the talk. Let's see if you can walk the walk.", "question"],
			[1,"You think I just talk big? I show you. Back in hills, I save many. Not just talk, I do. You see.", "answer"],
			[0,"Alright, Carson. Let’s see what you’ve got.", "question"]
		]
	],
	["radiohq1",
		[
			[2, "", "", 5, { 
				playsound "answer"; 
				leader player sideChat "Rankin, Hawk. We’re set and ready for the show. Over."; 
				}
			],
			[1, "", "answer", 0, { 
				playsound "answer"; 
				HQRadio sideChat "Hawk, Rankin. Roger that. Heads up, weather should be moving in shortly. Out.";
				sleep 6;
				execVM "scripts\RadioHQ.sqf";
				}
			]
		]
	],
	["looksharp1",
		[
			[0, "Secure your gear and get serious. Time to focus, everyone.", "answer"]
		]
	],
	["looksharp2",
		[
			[0, "Pack it up and stay sharp. We’re going into the real deal.", "answer"]
		]
	],
	["looksharp3",
		[
			[0, "Lock down your gear. It’s game time, so stay on point.", "answer"]
		]
	],
	["patrolbegins",
		[
			[0, "The patrol should be coming through soon. Keep your eyes open and let it pass.", "answer"]
		]
	],
	["patrolspotted",
		[
			[0, "Hit the deck, we've been spotted!", "answer"]
		]
	],
	["patroldead",
		[
			[0, "Let’s hope that didn't fuck up the mission.", "answer"]
		]
	],
	["patrolleaves",
		[
			[0, "They’ve left the area. Get your SCUBA gear on—we’ve got mines to deal with.", "answer"]
		]
	],
	["scubatime1",
		[
			[0, "Run silent, run deep.", "answer"]
		]
	],
	["scubatime2",
		[
			[0, "Below the surface, beneath the radar.", "answer"]
		]
	],
	["scubatime3",
		[
			[0, "Eyes on the mission, breath by breath.", "answer"]
		]
	],
	["gearup1",
		[
			[0, "The only easy day was yesterday.", "answer"]
		]
	],
	["gearup2",
		[
			[0, "Front sight, steady hand, and a quiet heart.", "answer"]
		]
	],
	["gearup3",
		[
			[0, "Slow is smooth; smooth is fast.", "answer"]
		]
	],
	["upriver",
		[
			[0, "Keep your eyes peeled. We’ve got no idea what’s ahead.", "answer"]
		]
	],
	["infill",
		[
			[0, "", "answer", 5, { 
				playsound "answer"; 
				leader player sideChat "*three squelches* pause *two squelches* (code for successful insertion)."; 
				}
			],
			[1,"", "answer", 0, { 
				playsound "answer"; 
				HQRadio sideChat "*three squelches* pause *two squelches* (code for acknowledged).";
				}
			]
		]
	],
	["bomb15",
		[
			[0, "Charge set for 15 minutes. Move out!", "answer"]
		]
	],
	["bomb30",
		[
			[0, "Charge set for 30 minutes. Move out!", "answer"]
		]
	],
	["bomb45",
		[
			[0, "Charge set for 45 minutes. Move out!", "answer"]
		]
	],
	["playersspotted1",
		[
			[0, "", "answer", 0, { 
				playsound "answer"; 
				leader player sideChat "Our cover's blown. move to the target AO, now!"; 
				}
			]
		]
	],
	["playersspotted2",
		[
			[0, "", "answer", 0, { 
				playsound "answer"; 
				leader player sideChat "Shit! Haul ass to the target AO!"; 
				}
			]
		]
	],
	["playersspotted3",
		[
			[0, "", "answer", 0, { 
				playsound "answer"; 
				leader player sideChat "Keep moving! Don't stop till we get to the target AO!"; 
				}
			]
		]
	],
	["generalfled",
		[
			[0, "", "answer", 5, {
				playsound "answer";
				HQRadio sideChat "HQ, Rankin we’re picking up on enemy comms. The general’s been evacuated. If you can, check out Lumphat for any intel. Otherwise, get the hell out of there!";
				}
			],
			[1, "", "answer", 0, {
				playsound "answer";
				leader player sideChat "Rankin, HQ, solid copy. Out.";
				}
			]
		]
	],
	["speakers1",
		[
			[0, "American soldier, you far from home. No one come to save you. Commander leave you to die in jungle. Surrender now, we treat you good. Fight, and you die.", "answer", 0, { 
				speakers say3D ["answer", 200]; 
				}
			]
		]
	],
	["speakers2",
		[
			[0, "Your friend already dead. You surrounded, no hope. Why fight for lost cause? War already lost. Your leader lie to you. Drop weapon, you live.", "answer", 0, { 
				speakers say3D ["answer", 200];  
				}
			]
		]
	],
	["speakers3",
		[
			[0, "American, listen good. Jungle belong to us. We watch every step, see every move. You not safe here. Surrender now, or you family cry for you forever.", "answer", 0, { 
				speakers say3D ["answer", 200]; 
				}
			]
		]
	]
];

/* ===============================================================
// in action
["convo_8", [_caller, _target]] remoteExec ["foxclub_fnc_conversation"];

["convo_10", [_sally, _jim, _annoyingOrange]] remoteExec ["foxclub_fnc_conversation"];


// ===============================================================
// FOR YOUR REFERENCE ONLY, NOT VALID CODE
// CONVERSATION FORMAT
["keyword reference",
	[
		[_speakerIndex, "text", "soundClass", _delayAfter, { hint "custom code!" }],
		[_speakerIndex, "text2", "soundClass2"]
	]
]

// The array of speakers is passed to the custom code when it's executed, contained in variable _this

// CALL FORMAT
["keyword reference",[_speakerUnit0, _speakerUnit1, _speakerUnit2]]