/*
    File: init.sqf
    Author: FoxClubNiner
    Description:
        Runs at mission start.
*/

//////////////////////////////////////////////////
//                                              //
//              MISSION INTRO TEXT              //
//                                              //
//////////////////////////////////////////////////

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


//////////////////////////////////////////////////
//                                              //
//               MISSION SETTINGS               //
//                                              //
//////////////////////////////////////////////////

//enableRadio false; //disables side caht too. dont use
//enableSentences false; //turns off audio but you can still see it in systemchat log
[] call VN_fnc_QOL_earplugs; // addAction for earplugs

// disable sam launchers at start so they dont target players before shooting down the pilot
{
  _x disableAI "ALL";
} forEach crew samlauncher;

{
  _x disableAI "ALL";
} forEach crew samradar;


//////////////////////////////////////////////////
//                                              //
//   STOP FLOATING OBJECTS ON DESTROYED HUTS    //
//                                              //
//////////////////////////////////////////////////
/*
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
		deleteVehicle hut_trash1;
		//hint "hut 1 deleted"; // put your deleteVehicle commands here
    };
	if (_from isEqualTo myBuilding2) then
    {
        deleteVehicle hut_table2;
		deleteVehicle hut_bench;
		deleteVehicle hut2_chair1;
		deleteVehicle hut2_table2;
		deleteVehicle hut2_bed1;
		deleteVehicle hut2_bedroll1;
		//hint "hut 2 deleted"; // put your deleteVehicle commands here
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
		//hint "hut 3 deleted"; // put your deleteVehicle commands here
    };
	if (_from isEqualTo myBuildgunboat1) then
    {
        deleteVehicle gunboattask;
		deleteVehicle gunboat_file;
		//hint "boat file deleted"; // put your deleteVehicle commands here
    };
	if (_from isEqualTo myBuildgunboat2) then
    {
        deleteVehicle gunboattask;
		deleteVehicle gunboat_file;
		//hint "boat file deleted"; // put your deleteVehicle commands here
    };
	if (_from isEqualTo myBuildgunboat3) then
    {
        deleteVehicle gunboattask;
		deleteVehicle gunboat_file;
		//hint "boat file deleted"; // put your deleteVehicle commands here
    };
	if (_from isEqualTo myBuildcache1) then
    {
        deleteVehicle photo;
		deleteVehicle cachetask;
		//hint "cache file deleted"; // put your deleteVehicle commands here
    };
	if (_from isEqualTo myBuildcache2) then
    {
        deleteVehicle photo;
		deleteVehicle cachetask;
		//hint "cache file deleted"; // put your deleteVehicle commands here
    };
	if (_from isEqualTo myBuildcache3) then
    {
        deleteVehicle photo;
		deleteVehicle cachetask;
		//hint "cache file deleted"; // put your deleteVehicle commands here
    };
	if (_from isEqualTo myBuildsam1) then
    {
        deleteVehicle samsite_file;
		deleteVehicle samtask;
		//hint "samsite file deleted"; // put your deleteVehicle commands here
    };
	if (_from isEqualTo myBuildsam2) then
    {
        deleteVehicle samsite_file;
		deleteVehicle samtask;
		//hint "samsite file deleted"; // put your deleteVehicle commands here
    };
	if (_from isEqualTo myBuildsam3) then
    {
        deleteVehicle samsite_file;
		deleteVehicle samtask;
		//hint "samsite file deleted"; // put your deleteVehicle commands here
    };
}];
*/

//////////////////////////////////////////////////
//                                              //
//          CONVOS FOR CONVO FUNCTION           //
//                                              //
//////////////////////////////////////////////////

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
	["looksharp1",
		[
			[0, "Secure your gear and get serious. Time to focus, everyone.", "answer"],
			[1, "We go deep. Many enemy.", "answer"]
		]
	],
	["looksharp2",
		[
			[0, "Pack it up and stay sharp. We’re going into the real deal.", "answer"],
			[1, "Real fight now. No play.", "answer"]
		]
	],
	["looksharp3",
		[
			[0, "Lock down your gear. It’s game time, so stay on point.", "answer"],
			[1, "No mistake now. We serious.", "answer"]
		]
	],
	["looksharpScout",
		[
			[0, "We go deep. Danger waiting.", "answer"],
			[1, "You said it Thay. Glad to have you with us.", "answer"]
		]
	],
	["wentPastInfil",
		[
			[0, "Ah shit, I think we missed our infil spot. Lemme check the map.", "answer"]
		]
	],
	["wrongWayCove",
		[
			[0, "This doesn't look right to me. Let's check the map.", "answer"]
		]
	],
	["wentPastInfilScout",
		[
			[0, "I know area. We go too far.", "answer"]
		]
	],
	["wrongWayCoveScout",
		[
			[0, "We go to cove. You go wrong way.", "answer"]
		]
	],
	["arrivedAtCove",
		[
			[0, "Nicely done boys. Grab some lights outta the STAB and set up a recon position.", "answer"],
			[1, "I know spot. We watch there.", "answer"]
		]
	],
	["arrivedAtCoveScout",
		[
			[0, "Okay. Take light, watch ground.", "answer"],
			[1, "You got it Thay.", "answer"]
		]
	],
	["radiohq1",
		[
			[0, "", "answer", 3, { 
				if (player != (_this#0)) then { playsound "talkradio"; }; 
				_this#0 sideChat "Rankin, Hawk. We’re set and ready for the show. Over."; 
				}
			],
			[1, "", "talkradio", 0, { 
				playsound "talkradio"; 
				HQRadio sideChat "Hawk, Rankin. Roger that. Heads up, weather should be moving in shortly. Out.";
				sleep 3;
				missionNamespace setVariable ["radiohqpass", true, true];
				sleep 7; // lets task complete before fade out
				execVM "scripts\RadioHQ.sqf";
				}
			]
		]
	],
	["radiohqScout",
		[
			[0, "", "answer", 3, { 
				if (player != (_this#0)) then { playsound "talkradio"; }; 
				_this#0 sideChat "Rankin, Hawk. We here. Over."; 
				}
			],
			[1, "", "talkradio", 0, { 
				playsound "talkradio"; 
				HQRadio sideChat "Hawk, Rankin. Roger that. Heads up, weather should be moving in shortly. Out.";
				sleep 3;
				missionNamespace setVariable ["radiohqpass", true, true];
				sleep 7;
				execVM "scripts\RadioHQ.sqf";
				}
			]
		]
	],
	["patrolbegins",
		[
			[0, "The patrol should be coming through soon. Keep your eyes open and let it pass.", "answer"],
			[1, "No talk. No Move.", "answer", 0, {
				missionNamespace setVariable ["proceedPass", true, true];
			}
			]
		]
	],
	["patrolbeginsScout",
		[
			[0, "Here comes boat. No talk. No Move.", "answer"],
			[1, "Copy Thay.", "answer", 0, {
				missionNamespace setVariable ["proceedPass", true, true];
			}
			]
		]
	],
	["patrolspotted",
		[
			[0, "Hit the deck, we've been spotted!", "answer"],
			[1, "(Fuck! They saw us!)", "answer"] //Địt mẹ! Họ thấy rồi! 
		]
	],
	["patrolspottedScout",
		[
			[0, "(Fuck! They saw us!)", "answer"], //Địt mẹ! Họ thấy rồi! 
			[1, "Hit the deck, we've been spotted!", "answer"]
		]
	],
	["patroldead",
		[
			[0, "Let’s hope that didn't fuck up the mission.", "answer"],
			[1, "This very bad for quiet mission.", "answer"]
		]
	],
	["patroldeadScout",
		[
			[0, "This very bad for quiet mission.", "answer"],
			[1, "Let’s hope that didn't fuck up the mission.", "answer"]
		]
	],
	["patrolleaves",
		[
			[0, "Area is clear. Get your SCUBA gear on, we’ve got mines to deal with.", "answer"],
			[1, "Okay, I ready. We clear mine.", "answer"]
		]
	],
	["patrolleavesScout",
		[
			[0, "Time for SCUBA. Danger, mines.", "answer"],
			[1, "On it.", "answer"]
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
	["scubatimeScout",
		[
			[0, "SCUBA on. Ready for water.", "answer"]
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
	["gearupScout",
		[
			[0, "No more dive. I ready rifle.", "answer"]
		]
	],
	["upriver",
		[
			[0, "Stay sharp. Keeps eyes out for our infil spot.", "answer"],
			[1, "I watch close. No miss.", "answer"]
		]
	],
	["upriverScout",
		[
			[0, "Look close now. Infil place near.", "answer"],
			[1, "Sharp and ready.", "answer"]
		]
	],
	["infill",
		[
			[0, "", "answer", 5, { 
				if (player != (_this#0)) then { playsound "talkradio"; }; 
				_this#0 sideChat "*three squelches* pause *two squelches* (code for successful insertion)."; 
				}
			],
			[1,"", "answer", 0, { 
				playsound "talkradio"; 
				HQRadio sideChat "*three squelches* pause *two squelches* (code for acknowledged).";
				}
			]
		]
	],
	["bomb15",
		[
			[0, "Setting charge for 15 minutes.", "answer"]
		]
	],
	["bomb15Scout",
		[
			[0, "I make boom, 15 minutes.", "answer"]
		]
	],
	["bomb30",
		[
			[0, "Setting charge for 30 minutes.", "answer"]
		]
	],
	["bomb30Scout",
		[
			[0, "I make boom, 30 minutes.", "answer"]
		]
	],
	["bomb45",
		[
			[0, "Setting charge for 45 minutes.", "answer"]
		]
	],
	["bomb45Scout",
		[
			[0, "I make boom, 45 minutes.", "answer"]
		]
	],
	["bombplanted",
		[
			[0, "Move out!", "answer"]
		]
	],
	["bombplantedScout",
		[
			[0, "We move, now!", "answer"]
		]
	],
	["playersspotted",
		[
			[0, "Shit! Haul ass to the target, now!", "answer"]
		]
	],
	["playersspotted2",
		[
			[0, "Moving now!", "answer"]
		]
	],
	["playersspottedScout",
		[
			[0, "Shit! Move fast, go target now!", "answer"]
		]
	],
	["playersspottedScout2",
		[
			[0, "I go now!", "answer"]
		]
	],
	["generalAlive",
		[
			[0, "Fuck! Take out the target now!", "answer"]
		]
	],
	["generalDead",
		[
			[0, "Fuck! Put these bastards in the ground, quick!", "answer"]
		]
	],
	["generalAliveScout",
		[
			[0, "Shit! Kill target fast!", "answer"]
		]
	],
	["generalDeadScout",
		[
			[0, "Shit! Kill enemy fast!", "answer"]
		]
	],
	["generalfled",
		[
			[0, "", "answer", 3, {
				playsound "talkradio";
				HQRadio sideChat "Hawk, Rankin. We’re picking up on enemy comms. The general’s been evacuated. If you can, search Lumphat for any intel. Otherwise, get the hell out of there!";
				}
			],
			[1, "", "answer", 0, {
				if (player != (_this#1)) then { playsound "talkradio"; }; 
				_this#1 sideChat "Rankin, Hawk. We’re set and ready for the show. Over."; 
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
	],
	["papers1",
		[
			[0, "Hey asshole, papers please.", "answer"]
		]
	],
	["papers2",
		[
			[0, "Let's see what you’re hiding, pal.", "answer"]
		]
	],
	["papers3",
		[
			[0, "Time to find out if you were worth all this trouble.", "answer"]
		]
	],
	["papersScout",
		[
			[0, "You choose wrong side. Now you die here.", "answer"]
		]
	],
	["bingo",
		[
			[0, "Bingo!", "answer", 1],
			[0, "", "answer", 3, { 
				if (player != (_this#0)) then { playsound "talkradio"; };  
				_this#0 sideChat "Rankin, Covey. Touchdown. I repeat, touchdown. Get our bird in the air, over!"; 
				}
			],
			[1,"", "answer", 0, { 
				playsound "talkradio"; 
				covey sideChat "Covey, Rankin. Solid copy. Bird is on standyby. Out.";
				}
			]
		]
	],
	["bingoScout",
		[
			[0, "Voilà!", "answer", 1],
			[0, "", "answer", 3, { 
				if (player != (_this#0)) then { playsound "talkradio"; };  
				_this#0 sideChat "Rankin, Covey. We finish! Get bird, over!"; 
				}
			],
			[1,"", "answer", 0, { 
				playsound "talkradio"; 
				covey sideChat "Covey, Rankin. Solid copy. Bird is on standyby. Out.";
				}
			]
		]
	],
	["search1",
		[
			[0, "Let’s see what Uncle Ho left us.", "answer"]
		]
	],
	["search2",
		[
			[0, "Let’s crack this open and see if it sings.", "answer"]
		]
	],
	["search3",
		[
			[0, "This better not be a wild goose chase.", "answer"]
		]
	],
	["found1",
		[
			[0, "Jackpot. Looks like we just got a golden ticket.", "answer"]
		]
	],
	["found2",
		[
			[0, "Well, well, looks like Charlie’s been writing love letters.", "answer"]
		]
	],
	["found3",
		[
			[0, "Bingo. Somebody's about to have a real bad day.", "answer"]
		]
	],
	["notfound1",
		[
			[0, "Humph, guess Charlie ain't much for record-keeping.", "answer"]
		]
	],
	["notfound2",
		[
			[0, "Figures. Just a whole lotta squat.", "answer"]
		]
	],
	["notfound3",
		[
			[0, "Damn. Nothing but rice receipts.", "answer"]
		]
	],
	["scoutsearch1",
		[
			[0, "Could be nothing, but I check anyway.", "answer"]
		]
	],
	["scoutsearch2",
		[
			[0, "I search good, maybe find something.", "answer"]
		]
	],
	["scoutsearch3",
		[
			[0, "Maybe luck on our side.", "answer"]
		]
	],
	["scoutfound1",
		[
			[0, "Enemy not careful. Bad for them, good for us.", "answer"]
		]
	],
	["scoutfound2",
		[
			[0, "We take this, make them regret.", "answer"]
		]
	],
	["scoutfound3",
		[
			[0, "They not hide good enough.", "answer"]
		]
	],
	["scoutnotfound1",
		[
			[0, "Bah, waste of time.", "answer"]
		]
	],
	["scoutnotfound2",
		[
			[0, "Bad luck, maybe next one better.", "answer"]
		]
	],
	["scoutnotfound3",
		[
			[0, "Nothing here. Only junk.", "answer"]
		]
	],
	["LumphatSearched",
		[
			[0, "Time to pack it in, this place is tapped. Move out!", "answer"]
		]
	],
	["scoutLumphatSearched",
		[
			[0, "This place empty, like old rice bowl.", "answer"]
		]
	],
	["foundDone1",
		[
			[0, "One step ahead of you, Charlie.", "answer"]
		]
	],
	["foundDone2",
		[
			[0, "Hell, we beat ’em to the punch.", "answer"]
		]
	],
	["foundDone3",
		[
			[0, "They’re planning for a fight that’s already over.", "answer"]
		]
	],
	["scoutfounddone1",
		[
			[0, "They make map. We walk it yesterday.", "answer"]
		]
	],
	["scoutfounddone2",
		[
			[0, "They late. We done already.", "answer"]
		]
	],
	["scoutfounddone3",
		[
			[0, "They write paper, we already kill.", "answer"]
		]
	],
	["commsSeen",
		[
			[0, "There’s their comms. Tower and juice box.", "answer"]
		]
	],
	["commsSeenScout",
		[
			[0, "This voice for Hanoi. I cut now.", "answer"]
		]
	],
	["commsdestroy",
		[
			[0, "Kill their voice, kill their fight.", "answer"]
		]
	],
	["commsdestroyScout",
		[
			[0, "No voice, no help come.", "answer"]
		]
	],
	["commsoff",
		[
			[0, "Silent airwaves. Let’s move.", "answer"]
		]
	],
	["commsoffScout",
		[
			[0, "Radio dead. Enemy scared now.", "answer"]
		]
	],
	["pilotdown",
		[
			[0, "That pilot’s in serious trouble without our help.", "answer"],
			[1, "I see pilot! We go now!", "answer"]
		]
	],
	["pilotdownScout",
		[
			[0, "I see pilot! We go now!", "answer"],
			[1, "That pilot’s in serious trouble without our help.", "answer"]
		]
	],
	["meet",
		[
			[0,"Friendly! Friendly! Over here! Where are we?", "answer"],
			[1,"You’re smack in the middle of bumfuck Cambodia.", "answer"],
			[0,"Cambodia?! This is a hell of a situation to be in.", "answer"],
			[1,"Stay sharp and follow my lead.", "answer"]
		]
	],
	["meetScout",
		[
			[0,"Holy shit, I thought you were one of them! I almost put you dowm! Where are we?", "answer"],
			[1,"We in Cambodia.", "answer"],
			[0,"Cambodia?! This is a hell of a situation to be in.", "answer"],
			[1,"Danger here. You follow now.", "answer"]
		]
	],
	["askpilot1",
		[
			[0,"Who are you, airman?", "question"],
			[1,"I'm Captain Mike Reynolds. I'm with the 615th Tactical Fighter Squadron. And I'm glad as hell to see you. Was starting to think I was a dead man.", "answer"]
		]
	],
	["askpilot2",
		[
			[0,"How’s your condition, Captain? Any injuries we need to address right now?", "question"],
			[1,"My back feels funny but it's not painful—damndest thing. Let's just get the hell out of here, I'll worry about the rest later.", "answer"]
		]
	],
	["askpilot3",
		[
			[0,"What was your mission?", "question"],
			[1,"I was on a CAS run, hitting enemy positions for our ground guys. Took fire, probably a ZPU, and turned back. Nav gear and radio were knocked out, so I had to go visual. Spotted the SAM trail just in time.", "answer"]
		]
	],
	["askpilot1Scout",
		[
			[0,"Say name, G.I.", "question"],
			[1,"I'm Captain Mike Reynolds. I'm with the 615th Tactical Fighter Squadron. And I'm glad as hell to see you. Was starting to think I was a dead man.", "answer"]
		]
	],
	["askpilot2Scout",
		[
			[0,"Condition what? You bleed?", "question"],
			[1,"My back feels funny but it's not painful—damndest thing. Let's just get the hell out of here, I'll worry about the rest later.", "answer"]
		]
	],
	["askpilot3Scout",
		[
			[0,"You fly for what?", "question"],
			[1,"I was on a CAS run, hitting enemy positions for our ground guys. Took fire, probably a ZPU, and turned back. Nav gear and radio were knocked out, so I had to go visual. Spotted the SAM trail just in time.", "answer"]
		]
	],
	["pilotSeesHeli",
		[
			[0,"Hell yes! Get me on that bird!", "answer"]
		]
	],
	["powSeesHeli",
		[
			[0,"Thank God for that beautiful bird... Please let it be real.", "answer"]
		]
	],
	["pilotpassconvo",
		[
			[0,"Warrant Officer, I'm Captain Mike Reynolds, can you notify the 615th Tactical Fighter Squadron of my status?", "answer"],
			[1,"Roger that, Captain.", "answer", 0, {
				sleep 5;
				playsound "talkradio"; 
				ranger sideChat "Ranger, Hawk. I have a Captain Mike Reynolds onboard. He wishes the 615th Tactical Fighter Squadron be updated on his status. Over.";
				sleep 6;
				playsound "talkradio";
				HQRadio sideChat "Hawk, Ranger. Copy, We'll inform the 615th. Out.";
				}
			]
		]
	],
	["pilotpasstask",
		[
			[0,"Thank God for y'all. The guys on the ground are counting on me for support. Now I can get back up there and do my job.", "answer"],
			[1,"You just got shot down and you’re already itching to get back up there?! Damn, you’re a certifiable badass.", "answer"]
		]
	],
	["pilotpasstaskScout",
		[
			[0,"Thank God for y'all. The guys on the ground are counting on me for support. Now I can get back up there and do my job.", "answer"],
			[1,"You number one brave man!", "answer"]
		]
	],
	["gunboatpass",
		[
			[0,"Gunboat’s toast!", "answer"]
		]
	],
	["gunboatpassScout",
		[
			[0,"Gunboat finished!", "answer"]
		]
	],
	["cachebombPlace",
		[
			[0,"Placing charge!", "answer"]
		]
	],
	["cachebombPlaceScout",
		[
			[0,"I put charge now!", "answer"]
		]
	],
	["cachebombset",
		[
			[0,"Charge set!", "answer"]
		]
	],
	["cachebombsetScout",
		[
			[0,"Charge ready!", "answer"]
		]
	],
	["cachebombCount",
		[
			[0,"Three, two, one...", "answer"]
		]
	],
	["cachebombCountScout",
		[
			[0,"Ba, hai, một... (Three, two, one...)", "answer"]
		]
	],
	["cachepass",
		[
			[0,"Cache is history!", "answer"]
		]
	],
	["cachepassScout",
		[
			[0,"Cache finished!", "answer"]
		]
	],
	["sampass",
		[
			[0,"The SAM site has been neutralized!", "answer"]
		]
	],
	["sampassScout",
		[
			[0,"SAM finished!", "answer"]
		]
	],
	["seesWeaponCache",
		[
			[0,"Weapons cache over here! Take what you need then let's blow it!", "answer"]
		]
	],
	["seesWeaponCacheScout",
		[
			[0,"Many gun here. Maybe we use.", "answer"]
		]
	],
	["seesfoodCache",
		[
			[0,"Food cache over here! Cut their stomach, cut their fight.", "answer"]
		]
	],
	["seesfoodCacheScout",
		[
			[0,"We find food. No food, they weak.", "answer"]
		]
	],
	["seestunnel",
		[
			[0,"Hold up. I think I got something over here!", "answer"]
		]
	],
	["scoutseestunnel",
		[
			[0,"I see rat hole! Check trap or you be very sad.", "answer"]
		]
	],
	["entertunnel",
		[
			[0,"Oh shit... We've got a rat hole here. A big one too by the looks of it.", "answer"],
			[1,"Be quiet. Many enemy.", "answer"]
		]
	],
	["scoutentertunnel",
		[
			[0,"Big rat hole. Be quiet. Many enemy.", "answer"],
			[1,"Oh shit... A big one too by the looks of it.", "answer"]
		]
	],
	["seespow",
		[
			[0,"Hey! Over here! Please help me.", "answer"],
			[1,"Jesus, you got it pal. Hold tight.", "answer"]
		]
	],
	["scoutseespow",
		[
			[0,"Hey! Over here! Please help me.", "answer"],
			[1,"I help. You quiet now.", "answer"]
		]
	],
	["untiepow",
		[
			[1,"Goddamn, your leg’s messed up... Here hold still, I’ll get those off you. Think you can walk on your own?", "answer"],
			[0,"I think so but I can't move very fast.", "answer"],
			[1,"Okay, stay put while I clear the rest of this tunnel. See that field phone on the desk over there? When it’s safe, I'm gonna call you on that from the topside.", "answer"],
			[0,"Sure thing, please hurry. They're everywhere.", "answer"]
		]
	],
	["scoutuntiepow",
		[
			[1,"You be still. I help. You stay here. No move at all.", "answer"],
			[0,"Who are you?", "answer"],
			[1,"I save you. You welcome. No more talk.", "answer"]
		]
	],
	["askpow1",
		[
			[0,"Who are you? What's your name, buddy?", "answer"],
			[1,"Mark Davis, Specialist Fourth Class. I run supplies.", "answer"]
		]
	],
	["askpow2",
		[
			[0,"How did you end up in this hellhole?", "answer"],
			[1,"We were on a supply run when we were ambushed. My unit was overrun, and I got captured. They dragged me here and kept me underground, barely fed.", "answer"]
		]
	],
	["askpow3",
		[
			[0,"How long have you been held here, and what have they been doing to you?", "answer"],
			[1,"I'm not sure how long but it feels like months. They interrogate me sometimes, trying to get information on us. The rest of the time, they keep me in chains and in the dark.", "answer"]
		]
	],
	["askpow4",
		[
			[0,"Have they been treating you alright? Any other prisoners here?", "answer"],
			[1,"They’ve been rough. Not much food or water. I’m not sure if there are others. They kept me isolated most of the time. Sometimes I hear other voices, but never see anyone.", "answer"]
		]
	],
	["askpow5",
		[
			[0,"How'd you get that leg wound? Looks like it's been giving you trouble for a while.", "answer"],
			[1,"I picked it up three weeks back, trying to escape. Stepped on a punji stick and punctured my leg bad. They just patched me up quick, no real treatment. It's been aching and swollen ever since. I can barely limp along and it just keeps getting worse.", "answer"]
		]
	],
	["askpow1Scout",
		[
			[0,"Say name G.I.", "answer"],
			[1,"Mark Davis, Specialist Fourth Class. I run supplies.", "answer"]
		]
	],
	["askpow2Scout",
		[
			[0,"How you get here?", "answer"],
			[1,"We were on a supply run when we were ambushed. My unit was overrun, and I got captured. They dragged me here and kept me underground, barely fed.", "answer"]
		]
	],
	["askpow3Scout",
		[
			[0,"How long you here?", "answer"],
			[1,"I'm not sure how long but it feels like months. They interrogate me sometimes, trying to get information on us. The rest of the time, they keep me in chains and in the dark.", "answer"]
		]
	],
	["askpow4Scout",
		[
			[0,"More G.I. here?", "answer"],
			[1,"I’m not sure if there are others. They kept me isolated most of the time. Sometimes I hear other voices, but never see anyone.", "answer"]
		]
	],
	["askpow5Scout",
		[
			[0,"You leg very bad.", "answer"],
			[1,"I picked it up three weeks back, trying to escape. Stepped on a punji stick and punctured my leg bad. They just patched me up quick, no real treatment. It's been aching and swollen ever since. I can barely limp along and it just keeps getting worse.", "answer"]
		]
	],
	["callPOW",
		[
			[1,"..... Hello?", "answer", 0, { 
				fieldtelephone say3D ["talkradio", 100]; //crackle like its coming through phone
				}
			],
			[0,"It's alright, come on up, pal. Time to get you outta here.", "answer"],
			[1,"Thank God. I thought I was done for. I’ll be right up.", "answer", 0, { 
				fieldtelephone say3D ["talkradio", 100]; //crackle like its coming through phone
				}
			]
		]
	],
	["POWexits",
		[
			[1,"Goddamn it, my eyes. Gimmie a second, it hurts.", "answer"],
			[0,"We gotta get you out of here ASAP and into some real medical care. Stay close, follow my lead.", "answer"]
		]
	],
	["scoutcallPOW",
		[
			[1,"..... Hello?", "answer", 0, { 
				fieldtelephone say3D ["talkradio", 100]; //crackle like its coming through phone
				}
			],
			[0,"Okay G.I., you come up now.", "answer"],
			[1,"I'm coming right now. Don't leave without me.", "answer", 0, { 
				fieldtelephone say3D ["talkradio", 100]; //crackle like its coming through phone
				}
			]
		]
	],
	["scoutPOWexits",
		[
			[1,"Goddamn my eyes. Gimmie a second, it hurts.", "answer"],
			[0,"Don't be baby. I know pain, no more complain. You follow.", "answer"]
		]
	],
	["heal1",
		[
			[0,"Forget it, man. My leg’s shot! Let’s just get the hell outta here!", "answer"]
		]
	],
	["heal2",
		[
			[0,"Damn it, man, I told you—forget it! We don’t have time for this!", "answer"]
		]
	],
	["heal3",
		[
			[0,"I said leave it! You’re wasting time! We need to move—NOW!", "answer"]
		]
	],
	["heal4",
		[
			[0,"Fuck you, man...", "answer"]
		]
	],
	["pow1",
		[
			[0,"Damn, this leg is killing me. How much farther to the pickup point?", "answer"]
		]
	],
	["pow2",
		[
			[0,"I didn’t think I’d make it this far. Guess slow and steady wins the race.", "answer"]
		]
	],
	["pow3",
		[
			[0,"Every step is agony. I don’t know how much longer I can keep this up.", "answer"]
		]
	],
	["extract",
		[
			[0, "", "answer", 3, { 
				if (player != (_this#0)) then { playsound "talkradio"; };  
				_this#0 sideChat "Rankin, Covey. Requesting exfil. Over."; 
				}
			],
			[1,"", "answer", 0, { 
				playsound "talkradio"; 
				covey sideChat "Covey, Rankin. Air inbound two mikes, over.";
				}
			]
		]
	],
	["scoutextract",
		[
			[0, "", "answer", 3, { 
				if (player != (_this#0)) then { playsound "talkradio"; };  
				_this#0 sideChat "Rankin, Covey. We need bird. You come now!"; 
				}
			],
			[1,"", "answer", 0, { 
				playsound "talkradio"; 
				covey sideChat "Covey, Rankin. Air inbound two mikes, over.";
				}
			]
		]
	],
	["smokeconfirm",
		[
			[0, "", "answer", 0, { 
				if (player != (_this#0)) then { playsound "talkradio"; };  
				_this#0 sideChat "Rankin, Ranger. Affirmative, you are cleared for touchdown. Over."; 
				}
			],
			[1,"", "answer", 0, { 
				playsound "talkradio"; 
				covey sideChat "Ranger, Rankin. Copy. Clear the LZ, let's do this one quick-like. Over.";
				}
			]
		]
	],
	["scoutsmokeconfirm",
		[
			[0, "", "answer", 0, { 
				if (player != (_this#0)) then { playsound "talkradio"; };  
				_this#0 sideChat "Rankin, Covey. You see smoke. You land now!"; 
				}
			],
			[1,"", "answer", 0, { 
				playsound "talkradio"; 
				covey sideChat "Ranger, Rankin. Copy. Clear the LZ, let's do this one quick-like. Over.";
				}
			]
		]
	],
	["smokegrape",
		[
			[0,"", "answer", 0, { 
				playsound "talkradio"; 
				ranger sideChat "Ranger, Rankin. I see grape smoke please confirm, over.";
				}
			]
		]
	],
	["smokecherry",
		[
			[0,"", "answer", 0, { 
				playsound "talkradio"; 
				ranger sideChat "Ranger, Rankin. I see cherry smoke please confirm, over.";
				}
			]
		]
	],
	["smokelemon",
		[
			[0,"", "answer", 0, { 
				playsound "talkradio"; 
				ranger sideChat "Ranger, Rankin. I see lemon smoke please confirm, over.";
				}
			]
		]
	],
	["smokeglime",
		[
			[0,"", "answer", 0, { 
				playsound "talkradio"; 
				ranger sideChat "Ranger, Rankin. I see lime smoke please confirm, over.";
				}
			]
		]
	],
	["smokecream",
		[
			[0,"", "answer", 0, { 
				playsound "talkradio"; 
				ranger sideChat "Ranger, Rankin. I see cream smoke please confirm, over.";
				}
			]
		]
	],
	["smoke",
		[
			[0,"", "answer", 0, { 
				playsound "talkradio"; 
				ranger sideChat "Ranger, Rankin. Requesting smoke pop. Over.";
				}
			]
		]
	],
	["smokedeny",
		[
			[0, "", "answer", 0, { 
				if (player != (_this#0)) then { playsound "talkradio"; };  
				_this#0 sideChat "Rankin, Ranger. Affirmative, you are at the LZ with us. Over."; 
				}
			],
			[1,"", "answer", 0, { 
				playsound "talkradio"; 
				ranger sideChat "Ranger, Rankin. Copy. Stay clear for touchdown. Out.";
				}
			]
		]
	],
	["scoutsmokedeny",
		[
			[0, "", "answer", 0, { 
				if (player != (_this#0)) then { playsound "talkradio"; };  
				_this#0 sideChat "Ranger, we no have smoke. You land now."; 
				}
			],
			[1,"", "answer", 0, { 
				playsound "talkradio"; 
				ranger sideChat "Ranger, Rankin. Copy. Stay clear for touch down. Out.";
				}
			]
		]
	],
	["smokeRequest2",
		[
			[0,"", "answer", 0, { 
				playsound "talkradio"; 
				ranger sideChat "Ranger, Rankin. We don't see any smoke. Is this you? I think we have visual.";
				}
			]
		]
	],
	["lzBlocked",
		[
			[0,"", "answer", 0, { 
				playsound "talkradio"; 
				ranger sideChat "Ranger, Rankin. I repeat, clear the LZ so we can touch down!";
				}
			]
		]
	],
	["lzNoLongerBlocked",
		[
			[0,"", "answer", 0, { 
				playsound "talkradio"; 
				ranger sideChat "Ranger, Rankin. Coming in hot, stand clear.";
				}
			]
		]
	],
	["goGoGo",
		[
			[0,"All aboard Ranger. Get us the hell out of here.", "answer"]
		]
	],
	["goGoGoScout",
		[
			[0,"We all aboard. Go fast!", "answer"]
		]
	],
	["menLeftBehind",
		[
			[0,"God fucking damnit! We left them behind...", "answer", 3],
			[0,"Warrant Officer, we have friendlies still in the AO. Relay to HQ.", "answer"],
			[1,"You got it.", "answer"],
			[1,"", "answer", 3, { 
				playsound "talkradio"; 
				ranger sideChat "Ranger, Hawk. The ref has called overtime. Leaving the stadium. Over.";
				}
			],
			[2,"", "answer", 0, { 
				playsound "talkradio"; 
				HQRadio sideChat "Hawk, Ranger. Understood. Out.";
				}
			]
		]
	],
	["menLeftBehindScout",
		[
			[0,"Brothers still down there...", "answer", 3],
			[0,"Pilot, men still out there. You tell HQ.", "answer"],
			[1,"You got it.", "answer"],
			[1,"", "answer", 3, { 
				playsound "talkradio"; 
				ranger sideChat "Ranger, Hawk. The ref has called overtime. Leaving the stadium. Over.";
				}
			],
			[2,"", "answer", 0, { 
				playsound "talkradio"; 
				HQRadio sideChat "Hawk, Ranger. Understood. Out.";
				}
			]
		]
	],
	["leftbehind",
		[
			[0,"", "answer", 3, { 
				playsound "talkradio"; 
				ranger sideChat "Ranger, Hawk. The ref has called overtime. We must leave the stadium. Over. (Code for man left behind.)";
				}
			],
			[1,"", "answer", 0, { 
				playsound "talkradio"; 
				HQRadio sideChat "Hawk, Ranger. Understood. Out.";
				}
			]
		]
	],
	["leftbehindScout",
		[
			[0,"", "answer", 3, { 
				playsound "talkradio"; 
				ranger sideChat "Ranger, Hawk. Game still playing. We leave. Over. (Code for man left behind.)";
				}
			],
			[1,"", "answer", 0, { 
				playsound "talkradio"; 
				HQRadio sideChat "Hawk, Ranger. Understood. Out.";
				}
			]
		]
	],
	["extractpass",
		[
			[0,"", "answer", 3, { 
				playsound "talkradio";  
        		ranger sideChat "Ranger, Hawk. Rankin has been exfiltrated. We are RTB. Over."; 
				}
			],
			[1,"", "answer", 0, { 
				playsound "talkradio"; 
        		HQRadio sideChat "Hawk, Ranger. Copy that. Safe return.";
				}
			]
		]
	],
	["powpassconvo",
		[
			[0,"Warrant Officer, we've got wounded on board. Need medical ASAP.", "answer"],
			[1,"Certainly, P.O.", "answer", 0, {
				sleep 5;
				playsound "talkradio"; 
				ranger sideChat "Ranger, Hawk. We've got wounded on board, needing immediate medical attention. Over.";
				sleep 6;
				playsound "talkradio";
				HQRadio sideChat "Hawk, Ranger. Copy that. Medical team is on standby, ready for your arrival. Out.";
				}
			]
		]
	],
	["powpassconvo2",
		[
			[0,"Thank you so much. I didn’t think I’d make it out. You’ve done more for me than I can ever repay.", "answer"],
			[1,"Don't mention it, pal. We’re all on the same team. Rest up and take care.", "answer"]
		]
	],
	["playersseeprison",
		[
			[0,"Look off the starboard side, boys. You can see Phu Quoc Prison —hell of a sight from the air.", "answer"],
			[1,"It looks smaller from up here but somehow seems bigger. Must hold hundreds of prisoners.", "answer"]
		]
	],
	["scoutseesprison",
		[
			[0,"Look off the starboard side, boys. You can see Phu Quoc Prison —hell of a sight from the air.", "answer"],
			[1,"This is very sad place. I stay far away.", "answer"]
		]
	],
	["playersseeprisonPOW",
		[
			[0,"Look off the starboard side, boys. You can see Phu Quoc Prison —hell of a sight from the air.", "answer"],
			[1,"I can practically smell it from here. I wonder what it's like on the inside?", "answer"],
			[2,"For how they treated me, I don't give a fuck about them... I hope it's worse than the shit they put me through.", "answer"]
		]
	],
	["scoutseesprisonPOW",
		[
			[0,"Look off the starboard side, boys. You can see Phu Quoc Prison —hell of a sight from the air.", "answer"],
			[1,"Fuck every last one of them for what they did to me. For all I care they can go to hell.", "answer"],
			[2,"Many there not belong. I know this true. You suffer one person. They suffer thousands.", "answer"]
		]
	],
	["nosmokeconvo",
		[
			[0,"You boys were supposed to smoke the LZ! What happened? It’s a damn miracle I found it on the first pass!", "answer"],
			[1,"No excuse, Warrant Officer. We’ll lock it down next time.", "answer"]
		]
	],
	["debriefArea",
		[
			[0,"Welcome back, gentlemen.", "answer"]
		]
	],
	["10",
		[
			[0,"Ready for debrief, sir.", "answer"],
			[1,"You took out that filthy commie rat bastard son of a bitch! You destroyed all evidence of our involvement! You must have taken out every target of opportunity in the entire AO!", "answer"],
			[1,"You disrupted enemy operations so badly that they'll be reeling for months. You've all earned the title of true warriors! You're gonna be banging boom-boom girls on R&R till the cows come home! Outstanding job. Dismissed!", "answer", 0, {
				sleep 5;
				["10", true , true, true, true] remoteExec ["VN_fnc_endMission"];
				}
			]
		]
	],
	["9",
		[
			[0,"Ready for debrief, sir.", "answer"],
			[1,"You took out that commie rat bastard and covered our tracks like pros! On top of that, you managed to handle some additional objectives that weren’t even on the list. Outstanding work! Hit the showers, and I’ll catch you guys at the bar later. Dismissed!", "answer", 0, {
				sleep 5;
				["9", true , true, true, true] remoteExec ["VN_fnc_endMission"];
				}
			]
		]
	],
	["8",
		[
			[0,"Ready for debrief, sir.", "answer"],
			[1,"You took out that commie bastard and cleaned up all traces of our involvement. You nailed the primary mission objective, and that’s exactly what we needed. Well done, gentlemen. Your country owes you a great deal. Dismissed!", "answer", 0, {
				sleep 5;
				["8", true , true, true, true] remoteExec ["VN_fnc_endMission"];
				}
			]
		]
	],
	["7",
		[
			[0,"Ready for debrief, sir.", "answer"],
			[1,"You took out the bastard, and you did a solid job disrupting their operations by hitting some additional targets. However, leaving evidence of our involvement is a serious breach. It’s unacceptable, but I’ll see if I can work some magic with the top brass, considering the extra effort you put in. Dismissed!", "answer", 0, {
				sleep 5;
				["7", true , true, true, true] remoteExec ["VN_fnc_endMission"];
				}
			]
		]
	],
	["6",
		[
			[0,"Ready for debrief, sir.", "answer"],
			[1,"You took out the bastard, but unfortunately, you left evidence of our involvement behind. While eliminating the General was crucial, the fact that our tracks are exposed could spell trouble, especially if the enemy can prove our involvement. This isn’t going to sit well with the top brass. Dismissed!", "answer", 0, {
				sleep 5;
				["6", true , true, true, true] remoteExec ["VN_fnc_endMission"];
				}
			]
		]
	],
	["5",
		[
			[0,"Ready for debrief, sir.", "answer"],
			[1,"I'm sorry you couldn't nail the slippery bastard, but you did a solid job covering our tracks. Textbook work. On the bright side, you managed to disrupt enemy operations by hitting some additional targets, and that’s not going unnoticed. Good effort. Dismissed!", "answer", 0, {
				sleep 5;
				["5", true , true, true, true] remoteExec ["VN_fnc_endMission"];
				}
			]
		]
	],
	["4",
		[
			[0,"Ready for debrief, sir.", "answer"],
			[1,"I'm sorry you couldn't nail the slippery bastard. However, you did a commendable job covering our tracks. I’ll be hoping for better results on your next mission. Dismissed.", "answer", 0, {
				sleep 5;
				["4", true , true, true, true] remoteExec ["VN_fnc_endMission"];
				}
			]
		]
	],
	["3",
		[
			[0,"Ready for debrief, sir.", "answer"],
			[1,"It’s regrettable you missed the target, and worse, you left evidence of our involvement. What am I supposed to tell the top brass? The only small consolation is that you did manage to disrupt enemy operations. Get your shit squared away. Dismissed!", "answer", 0, {
				sleep 5;
				["3", false, true, true, true] remoteExec ["VN_fnc_endMission"];
				}
			]
		]
	],
	["2",
		[
			[0,"Ready for debrief, sir.", "answer"],
			[1,"Look, it’s regrettable enough that you missed the target, but what’s worse is you left evidence of our involvement. This mission is FUBAR because of you and your lack of discipline. Get out of my sight. Dismissed!", "answer", 0, {
				sleep 5;
				["2", false , true, true, true] remoteExec ["VN_fnc_endMission"];
				}
			]
		]
	],
	["1",
		[
			[0,"Ready for debrief, sir.", "answer"],
			[1,"You lost the target. You left evidence behind of our involvement. You got friendlies killed. I expected better from supposed professionals like you. This mission was a complete cluster-fuck and a critical failure. You should be ashamed. You’ll be cleaning latrines for the rest of your tour. Dismissed!", "answer", 0, {
				sleep 5;
				["1", false , true, true, true] remoteExec ["VN_fnc_endMission"];
				}
			]
		]
	],
	["0",
		[
			[0,"Ready for debrief, sir.", "answer"],
			[1,"You lost the target. You left evidence behind of our involvement. You got friendlies killed. And you left team members behind in the enemy AO. You might as well have signed their death warrants. Fully expect an immediate courtmartial. Surrender your gear right now. MPs, lock 'em up!", "answer", 0, {
				sleep 5;
				["0", false , true, true, true] remoteExec ["VN_fnc_endMission"];
				}
			]
		]
	],
	["scout10",
		[
			[0,"Ready for debrief, sir.", "answer"],
			[1,"You took out that filthy commie rat bastard son of a bitch! You destroyed all evidence of our involvement! You must have taken out every target of opportunity in the entire AO!", "answer"],
			[1,"You disrupted enemy operations so badly that they'll be reeling for months. You've all earned the title of true warriors! You're gonna be banging boom-boom girls on R&R till the cows come home! Outstanding job. Dismissed!", "answer", 0, {
				sleep 5;
				["10", true , true, true, true] remoteExec ["VN_fnc_endMission"];
				}
			]
		]
	],
	["scout9",
		[
			[0,"Ready for debrief, sir.", "answer"],
			[1,"You took out that commie rat bastard and covered our tracks like pros! On top of that, you managed to handle some additional objectives that weren’t even on the list. Outstanding work! Hit the showers, and I’ll catch you guys at the bar later. Dismissed!", "answer", 0, {
				sleep 5;
				["9", true , true, true, true] remoteExec ["VN_fnc_endMission"];
				}
			]
		]
	],
	["scout8",
		[
			[0,"Ready for debrief, sir.", "answer"],
			[1,"You took out that commie bastard and cleaned up all traces of our involvement. You nailed the primary mission objective, and that’s exactly what we needed. Well done, gentlemen. Your country owes you a great deal. Dismissed!", "answer", 0, {
				sleep 5;
				["8", true , true, true, true] remoteExec ["VN_fnc_endMission"];
				}
			]
		]
	],
	["scout7",
		[
			[0,"Ready for debrief, sir.", "answer"],
			[1,"You took out the bastard, and you did a solid job disrupting their operations by hitting some additional targets. However, leaving evidence of our involvement is a serious breach. It’s unacceptable, but I’ll see if I can work some magic with the top brass, considering the extra effort you put in. Dismissed!", "answer", 0, {
				sleep 5;
				["7", true , true, true, true] remoteExec ["VN_fnc_endMission"];
				}
			]
		]
	],
	["scout6",
		[
			[0,"Ready for debrief, sir.", "answer"],
			[1,"You took out the bastard, but unfortunately, you left evidence of our involvement behind. While eliminating the General was crucial, the fact that our tracks are exposed could spell trouble, especially if the enemy can prove our involvement. This isn’t going to sit well with the top brass. Dismissed!", "answer", 0, {
				sleep 5;
				["6", true , true, true, true] remoteExec ["VN_fnc_endMission"];
				}
			]
		]
	],
	["scout5",
		[
			[0,"Ready for debrief, sir.", "answer"],
			[1,"I'm sorry you couldn't nail the slippery bastard, but you did a solid job covering our tracks. Textbook work. On the bright side, you managed to disrupt enemy operations by hitting some additional targets, and that’s not going unnoticed. Good effort. Dismissed!", "answer", 0, {
				sleep 5;
				["5", true , true, true, true] remoteExec ["VN_fnc_endMission"];
				}
			]
		]
	],
	["scout4",
		[
			[0,"Ready for debrief, sir.", "answer"],
			[1,"I'm sorry you couldn't nail the slippery bastard. However, you did a commendable job covering our tracks. I’ll be hoping for better results on your next mission. Dismissed.", "answer", 0, {
				sleep 5;
				["4", true , true, true, true] remoteExec ["VN_fnc_endMission"];
				}
			]
		]
	],
	["scout3",
		[
			[0,"Ready for debrief, sir.", "answer"],
			[1,"It’s regrettable you missed the target, and worse, you left evidence of our involvement. What am I supposed to tell the top brass? The only small consolation is that you did manage to disrupt enemy operations. Get your shit squared away. Dismissed!", "answer", 0, {
				sleep 5;
				["3", false , true, true, true] remoteExec ["VN_fnc_endMission"];
				}
			]
		]
	],
	["scout2",
		[
			[0,"Ready for debrief, sir.", "answer"],
			[1,"Look, it’s regrettable enough that you missed the target, but what’s worse is you left evidence of our involvement. This mission is FUBAR because of you and your lack of discipline. Get out of my sight. Dismissed!", "answer", 0, {
				sleep 5;
				["2", false , true, true, true] remoteExec ["VN_fnc_endMission"];
				}
			]
		]
	],
	["scout1",
		[
			[0,"Ready for debrief, sir.", "answer"],
			[1,"You lost the target. You left evidence behind of our involvement. You got friendlies killed. I expected better from supposed professionals like you. This mission was a complete cluster-fuck and a critical failure. You should be ashamed. You’ll be cleaning latrines for the rest of your tour. Dismissed!", "answer", 0, {
				sleep 5;
				["1", false , true, true, true] remoteExec ["VN_fnc_endMission"];
				}
			]
		]
	],
	["scout0",
		[
			[0,"Ready for debrief, sir.", "answer"],
			[1,"You lost the target. You left evidence behind of our involvement. You got friendlies killed. And you left team members behind in the enemy AO. You might as well have signed their death warrants. Fully expect an immediate courtmartial. Surrender your gear right now. MPs, lock 'em up!", "answer", 0, {
				sleep 5;
				["0", false , true, true, true] remoteExec ["VN_fnc_endMission"];
				}
			]
		]
	]
];