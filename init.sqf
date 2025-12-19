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

if ( isMultiplayer ) then {
	private _respawn_tickets = paramsArray param [1];
	private _respawn_mode = paramsArray param [2];
	if ( _respawn_mode == 0 ) then {
		[player, _respawn_tickets] call BIS_fnc_respawnTickets;
		//["Respawn Ticket Mode: Per Player."] remoteExec ["systemChat", 0];
	};
};

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
//          CONVOS FOR CONVO FUNCTION           //
//                                              //
//////////////////////////////////////////////////
// numbered lines are mandatory convos
// 111 optional lines. 126 mandatory lines. 237 total.

foxclub_var_conversations = createHashMapFromArray [
	["intro1", // 1 done
		[
			[0, "Good morning gentlemen. There's an arsenal right there if you want to adjust your equipment. I'll be over here if you have any last minute questions.", "answer"]
		]
	],
	["intro2", // 2 d
		[
			[0,"What's on your mind P.O.?", "answer"]
		]
	],
	["heal_blu_blu", 
		[
			[0,"Hold still, I got you. Pressure on that, don’t move.", "answer"],
			[1,"I’m good, I’m good—keep me in the fight.", "answer"]
		]
	],
	["heal_blu_scout", 
		[
			[0,"Easy, Kit. Stay with me, I’ve got you.", "answer"],
			[1,"I stay. I’m good. Just finish fast.", "answer"]
		]
	],
	["heal_scout_blu", 
		[
			[0,"Hey, stay awake. I fix you.", "answer"],
			[1,"Just patch it and I’ll move.”", "answer"]
		]
	],
	["revive_blu_blu", 
		[
			[0,"You’re patched. Try not to leak again till we’re done.", "answer"],
			[1,"“No promises. Let’s move.", "answer"]	
		]
	],
	["revive_blu_scout", 
		[
			[0,"Bandage holds. Don’t push it too hard.", "answer"],
			[1,"I only push to kill enemy. No more.", "answer"]	
		]
	],
	["revive_scout_blu",
		[
			[0,"I fix. You move now.", "answer"],
			[1,"Thanks Kit. Let's hit it.", "answer"]
		]
	],
	["revive_blu_blu_start_1", 
		[
			[0,"Hold still, I got you. Pressure on that, don’t move.", "answer"]
		]
	],
	["revive_start_blu_blu_1", 
		[
			[0,"“Easy, Kit. I’m right here. Don’t drift.", "answer"]
		]
	],
	["revive_start_blu_blu_2", 
		[
			[0,"Stay with me, Kit. Keep your eyes open.", "answer"]
		]
	],
	["revive_start_blu_blu_3", 
		[
			[0,"Breathe, Kit. Nice and slow. I’ve got you.", "answer"]
		]
	],
	["revive_start_blu_blu_4", 
		[
			[0,"Steady, Kit. I’m not letting you go down.", "answer"]
		]
	],
	["revive_start_blu_blu_5", 
		[
			[0,"Focus up, Kit. Look at me. That’s it.", "answer"]
		]
	],
	["revive_start_blu_blu_6", 
		[
			[0,"Don’t fade, Kit. I’m here. You’re fine.", "answer"]
		]
	],
	["revive_scout_blu_start_1",
		[
			[0,"Hey, stay awake. I fix you.", "answer"]
		]
	],
	["revive_blu_blu_finish_1", 
		[
			[0,"You’re patched. Try not to leak again till we’re done.", "answer"]
		]
	],
	["revive_blu_scout_finish_1", 
		[
			[0,"I stay. I’m good. Just finish fast.", "answer"]
		]
	],
	["revive_scout_blu_finish_1",
		[
			[0,"I fix. You move now.", "answer"]
		]
	],
	["drag_player", 
		[
			[0,"drag_player", "answer"],
			[1,"Thanks for the revive revived.", "answer"]
		]
	],
	["undrag_player", 
		[
			[0,"undrag_player", "answer"],
			[1,"Thanks for the revive revived.", "answer"]
		]
	],
	["pickup_player", // 2 d
		[
			[0,"pickup_player", "answer"],
			[1,"Thanks for the revive revived.", "answer"]
		]
	],
	["drop_player", // 2 d
		[
			[0,"drop_player", "answer"],
			[1,"Thanks for the revive revived.", "answer"]
		]
	],
	["carried", // 2 d
		[
			[0,"carried", "answer"],
			[1,"Thanks for the revive revived.", "answer"]
		]
	],
	["dragged", // 2 d
		[
			[0,"dragged", "answer"],
			[1,"Thanks for the revive revived.", "answer"]
		]
	],
	["general", // 2 d
		[
			[0,"general", "answer"],
			[1,"Thanks for the revive revived.", "answer"]
		]
	],
	["mpbanter1", // 3 d
		[
			[0,"Hop in, Lee.", "answer"],
			[1,"Thank God. Get me to the latrine. That chow's tearing me up!", "answer"],
			[0,"Jesus, just don't mess up the damn jeep.", "answer"],
			[1,"No promises, Byrd. Step on it.", "answer"]
		]
	],
	["mpbanter2", // 4 d
		[
			[0,"You wouldn’t believe it. I caught a rat in the mess hall.", "answer"],
			[1,"Seriously? I thought they’d fixed that problem.", "answer"],
			[0,"Yeah, and if you look at the chow it's suspiciously rodent-like.", "answer"],
			[1,"I’ll take my chances. Had enough C-rations to last me a lifetime.", "answer"]
		]
	],
	["mpbanter3", // 5 d
		[
			[0,"We just chased down an escaped prisoner!", "answer"],
			[1,"No way! How'd that go down?", "answer"],
			[0,"We tracked him for half a klick through the jungle. Finally caught him trying to hide up a damn palm tree.", "answer"],
			[1,"Sounds like a real mess. Just another day in paradise, right?", "answer"]
		]
	],
	["mpbanter4", // 6 d
		[
			[0,"What’s this? You two lounging around while you’re supposed to be on patrol?", "answer"],
			[1,"Just catching a break. Did you read the Stripes yesterday? Westmoreland thinks we've almost licked the VC!", "answer"],
			[0,"Well, until we have you're still on patrol.", "answer"],
			[1,"Understood. Come on, Anderson. Let's go.", "answer"]
		]
	],
	["mpbanter5_1", // 7 d
		[
			[0,"Big stuff must be going down. Hope you boys come back in one piece!", "answer"]
		]
	],
	["mpbanter5_2", // 8 d
		[
			[0,"Looks like yall're in for a wild ride. Keep your heads down!", "answer"]
		]
	],
	["mpbanter5_3", // 9 d
		[
			[0,"Damn, something serious is happening. Give 'em hell!", "answer"]
		]
	],
	["takingCommand", 
		[
			[0,"I'm in command now!", "answer"]
		]
	],
	["takingCommandScout",  
		[
			[0,"I command now!", "answer"]
		]
	],
	["minimizeChatter", 
		[
			[0,"Keep it tight. Not a sound.", "answer"]
		]
	],
	["minimizeChatterScout", 
		[
			[0,"Quiet like the grave.", "answer"]
		]
	],
	["restoreChatter", 
		[
			[0,"Back to normal ops. Keep comms light.", "answer"]
		]
	],
	["restoreChatterScout", 
		[
			[0,"No more ghost.", "answer"]
		]
	],
	["question1", // 16 d
		[
			[0,"Could this be a trap?", "question"],
			[1,"It’s possible. But if the guys at the farm gave it the green light, they must believe it’s legitimate. Otherwise, we wouldn’t be getting orders from higher-ups.", "answer"]
		]
	],
	["question2", // 17 d
		[
			[0,"Do we really need a Kit Carson? How can we trust him?", "question"],
			[1,"As I mentioned in the briefing, he’s been vetted by the Marines. He’s seen combat and performed better than some of our own. If you have concerns, go talk to him yourself.", "answer"]
		]
	],
	["question3", // 18 d
		[
			[0,"If this General is in Lumphat right, why don’t we just blow the place to pieces with an Arclight?", "question"],
			[1,"We can’t be certain he’s there. We need to confirm his location and get a solid kill before taking any action. Besides, it’s illegal to use an Arclight in Cambodia. Higher-ups fear escalation.", "answer"],
			[0,"Hell, it ain’t legal for us to be there either!", "question"],
			[1,"Exactly. That’s why you need to make damn sure to destroy the STAB, P.O.", "answer"]
		]
	],
	["question4", // 19 d 
		[
			[0,"I’m curious—why can’t we insert with a bird if we’re extracting with one?", "question"],
			[1,"There are a few reasons. First, helicopters are noisy and could blow our cover. Second, what if it gets shot down on the way in—", "answer"],
			[0,"What if it gets shot down on the way out?", "question"],
			[1,"Everything is a calculated risk. The operation planners have weighed these risks carefully and done what they can to minimize them.", "answer"]
		]
	],
	["question5", // 20 d 
		[
			[0,"Can you tell me more about General Tan?", "question"],
			[1,"General Tan has been a key figure with the PAVN for quite a while—longer than we’ve been in Vietnam. He fought against the French before us and has played a crucial role in building and maintaining the Ho Chi Minh Trail. That’s likely why he’s there now—ensuring everything on the trail is running smoothly.", "answer"]
		]
	],
	["question6", // 21 d 
		[
			[0,"If we get the chance, should we try to capture him? A goddamn General is worth more alive than dead!", "question"],
			[1,"Don’t even think about it. Look, P.O., he’s a fanatic. He’s fully committed to this communist bullshit. He’s not going to surrender easily. This guy will either put a bullet in you or take one himself. Understand?", "answer"],
			[0,"Fuckin’ rat commies.", "question"],
			[1,"Fuckin’ rat commies, indeed.", "answer"]
		]
	],
	["question7", // 22 d 
		[
			[0,"How reliable is this intel?", "question"],
			[1,"The prisoner who provided it is locked up in the prison just North of us. It’s solid and credible, or the top brass wouldn’t have signed off on the mission.", "answer"]
		]
	],
	["question8", // 23 d 
		[
			[0,"What’s your story, pal?", "question"],
			[1,"I come from 2nd Battalion, 9th Marine Regiment, 3rd Marine Division. Fight many battles, hills and more. I know combat very well. I fight in tough places and make many missions. I here to do job and help you. You need anything, I can do.", "answer"],
			[0,"You talk the talk. Let's see if you can walk the walk.", "question"],
			[1,"You think I just talk big? I show you. Back in hills, I save many. Not just talk, I do. You see.", "answer"],
			[0,"Alright, Carson. Let’s see what you’ve got.", "question"]
		]
	],
	["question9", // 24 d 
		[
			[0,"New soldier but same jungle. Maybe this time all come back.", "question"],
			[1,"You've been vetted Thay, we're glad to have you.", "answer"]
		]
	],
	["salute", // 25 d 
		[
			[0, "You know the drill. In and out, quiet and quick. Good luck boys.", "answer"],
			[1, "Luck’s for the green, Captain. We’ve got training.", "answer"]
		]
	],
	["saluteScout", // 26 d 
		[
			[0, "You know the drill. In and out, quiet and quick. Good luck boys.", "answer"],
			[1, "I know jugle boss, I am hunter.", "answer"]
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
	["radiohq1", // 27 d 
		[
			[0, "", "answer", 0, { 
				if (player != (_this#0)) then { playsound "talkradio"; }; 
				_this#0 sideChat "Rankin, Hawk. We’re set and ready for the show. Over."; 
				}
			],
			[1, "", "talkradio", 0, { 
				playsound "talkradio"; 
				HQRadio sideChat "Hawk, Rankin. Roger that. Heads up, weather should be moving in shortly. Out.";
				sleep 3; 
				missionNamespace setVariable ["radiohqpass", true, true];
				//sleep 4; // lets task complete before fade out
				//execVM "scripts\RadioHQ.sqf";
				//call FoxClub_fnc_cove_scene_transition;
				}
			]
		]
	],
	["radiohqScout", // 28 d 
		[
			[0, "", "answer", 0, { 
				if (player != (_this#0)) then { playsound "talkradio"; }; 
				_this#0 sideChat "Rankin, Hawk. We here. Over."; 
				}
			],
			[1, "", "talkradio", 0, { 
				playsound "talkradio"; 
				HQRadio sideChat "Hawk, Rankin. Roger that. Heads up, weather should be moving in shortly. Out.";
				sleep 3;
				missionNamespace setVariable ["radiohqpass", true, true];
				//sleep 4;
				//execVM "scripts\RadioHQ.sqf";
				//call FoxClub_fnc_cove_scene_transition;
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
	["infill", // 29 d 
		[
			[0, "", "answer", 0, { 
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
	["generalfled", // 30 d 
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
	["speakers1", // 31 d 
		[
			[0, "American soldier, you far from home. No one come to save you. Commander leave you to die in jungle. Surrender now, we treat you good. Fight, and you die.", "answer", 0, { 
				speakers say3D ["answer", 200]; 
				}
			]
		]
	],
	["speakers2", // 32 d 
		[
			[0, "Your friend already dead. You surrounded, no hope. Why fight for lost cause? War already lost. Your leader lie to you. Drop weapon, you live.", "answer", 0, { 
				speakers say3D ["answer", 200];  
				}
			]
		]
	],
	["speakers3", // 33 d 
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
	["bingo", // 34 d 
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
	["bingoScout", // 35 d 
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
	["hvtExploded",
		[
			[0, "Goddamnit, the general's I.D. went up in that fireball. Now we gotta leave empty handed.", "answer"]
		]
	],
	["hvtExplodedScout",
		[
			[0, "We need intel but it on fire now.", "answer"]
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
	["meet", // 36 d 
		[
			[0,"Friendly! Friendly! Over here! Where are we?", "answer"],
			[1,"You’re smack in the middle of bumfuck Cambodia.", "answer"],
			[0,"Cambodia?! This is a hell of a situation to be in.", "answer"],
			[1,"Stay sharp and follow my lead.", "answer"]
		]
	],
	["meetScout", // 37 d 
		[
			[0,"Holy shit, I thought you were one of them! I almost put you down! Where are we?", "answer"],
			[1,"We in Cambodia.", "answer"],
			[0,"Cambodia?! This is a hell of a situation to be in.", "answer"],
			[1,"Danger here. You follow now.", "answer"]
		]
	],
	["askpilot1", // 38 d 
		[
			[0,"Who are you, airman?", "question"],
			[1,"I'm Captain Mike Reynolds. I'm with the 615th Tactical Fighter Squadron. And I'm glad as hell to see you. Was starting to think I was a dead man.", "answer"]
		]
	],
	["askpilot2", // 39 d 
		[
			[0,"How’s your condition, Captain? Any injuries we need to address right now?", "question"],
			[1,"My back feels funny but it's not painful—damndest thing. Let's just get the hell out of here, I'll worry about the rest later.", "answer"]
		]
	],
	["askpilot3", // 40 d 
		[
			[0,"What was your mission?", "question"],
			[1,"I was on a CAS run, hitting enemy positions for our ground guys. Took fire, probably a ZPU, and turned back. Nav gear and radio were knocked out, so I had to go visual. Spotted the SAM trail just in time.", "answer"]
		]
	],
	["askpilot1Scout", // 41 d 
		[
			[0,"Say name, G.I.", "question"],
			[1,"I'm Captain Mike Reynolds. I'm with the 615th Tactical Fighter Squadron. And I'm glad as hell to see you. Was starting to think I was a dead man.", "answer"]
		]
	],
	["askpilot2Scout", // 42 d 
		[
			[0,"Condition what? You bleed?", "question"],
			[1,"My back feels funny but it's not painful—damndest thing. Let's just get the hell out of here, I'll worry about the rest later.", "answer"]
		]
	],
	["askpilot3Scout", // 43 d 
		[
			[0,"You fly for what?", "question"],
			[1,"I was on a CAS run, hitting enemy positions for our ground guys. Took fire, probably a ZPU, and turned back. Nav gear and radio were knocked out, so I had to go visual. Spotted the SAM trail just in time.", "answer"]
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
	["seespow", // 44 d 
		[
			[0,"Hey! Over here! Please help me.", "answer"],
			[1,"Jesus, you got it pal. Hold tight.", "answer"]
		]
	],
	["scoutseespow", // 45 d 
		[
			[0,"Hey! Over here! Please help me.", "answer"],
			[1,"I help. You quiet now.", "answer"]
		]
	],
	["untiepow", // 46 d 
		[
			[1,"Goddamn, your leg’s messed up... Here hold still, I’ll get those off you. Think you can walk on your own?", "answer"],
			[0,"I think so but I can't move very fast.", "answer"],
			[1,"Okay, stay put while I clear the rest of this tunnel. See that field phone on the desk over there? When it’s safe, I'm gonna call you on that from the topside.", "answer"],
			[0,"Sure thing, please hurry. They're everywhere.", "answer"]
		]
	],
	["scoutuntiepow", // 47 d 
		[
			[1,"You be still. I help. You stay here. No move at all.", "answer"],
			[0,"Who are you?", "answer"],
			[1,"I save you. You welcome. No more talk.", "answer"]
		]
	],
	["askpow1", // 48 d 
		[
			[0,"Who are you? What's your name, buddy?", "answer"],
			[1,"Mark Davis, Specialist Fourth Class. I run supplies.", "answer"]
		]
	],
	["askpow2", // 49 d 
		[
			[0,"How did you end up in this hellhole?", "answer"],
			[1,"We were on a supply run when we were ambushed. My unit was overrun, and I got captured. They dragged me here and kept me underground, barely fed.", "answer"]
		]
	],
	["askpow3", // 50 d 
		[
			[0,"How long have you been held here, and what have they been doing to you?", "answer"],
			[1,"I'm not sure how long but it feels like months. They interrogate me sometimes, trying to get information on us. The rest of the time, they keep me in chains and in the dark.", "answer"]
		]
	],
	["askpow4", // 51 d 
		[
			[0,"Have they been treating you alright? Any other prisoners here?", "answer"],
			[1,"They’ve been rough. Not much food or water. I’m not sure if there are others. They kept me isolated most of the time. Sometimes I hear other voices, but never see anyone.", "answer"]
		]
	],
	["askpow5", // 52 d 
		[
			[0,"How'd you get that leg wound? Looks like it's been giving you trouble for a while.", "answer"],
			[1,"I picked it up three weeks back, trying to escape. Stepped on a punji stick and punctured my leg bad. They just patched me up quick, no real treatment. It's been aching and swollen ever since. I can barely limp along and it just keeps getting worse.", "answer"]
		]
	],
	["askpow1Scout", // 53 d 
		[
			[0,"Say name G.I.", "answer"],
			[1,"Mark Davis, Specialist Fourth Class. I run supplies.", "answer"]
		]
	],
	["askpow2Scout", // 54 d 
		[
			[0,"How you get here?", "answer"],
			[1,"We were on a supply run when we were ambushed. My unit was overrun, and I got captured. They dragged me here and kept me underground, barely fed.", "answer"]
		]
	],
	["askpow3Scout", // 55 d 
		[
			[0,"How long you here?", "answer"],
			[1,"I'm not sure how long but it feels like months. They interrogate me sometimes, trying to get information on us. The rest of the time, they keep me in chains and in the dark.", "answer"]
		]
	],
	["askpow4Scout", // 56 d 
		[
			[0,"More G.I. here?", "answer"],
			[1,"I’m not sure if there are others. They kept me isolated most of the time. Sometimes I hear other voices, but never see anyone.", "answer"]
		]
	],
	["askpow5Scout", // 57 d 
		[
			[0,"You leg very bad.", "answer"],
			[1,"I picked it up three weeks back, trying to escape. Stepped on a punji stick and punctured my leg bad. They just patched me up quick, no real treatment. It's been aching and swollen ever since. I can barely limp along and it just keeps getting worse.", "answer"]
		]
	],
	["callPOW", // 58 d 
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
	["POWexits", // 59 d 
		[
			[1,"Goddamn it, my eyes. Gimmie a second, it hurts.", "answer"],
			[0,"We gotta get you out of here ASAP and into some real medical care. Stay close, follow my lead.", "answer"]
		]
	],
	["scoutcallPOW", // 60 d 
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
	["scoutPOWexits", // 61 d 
		[
			[1,"Goddamn my eyes. Gimmie a second, it hurts.", "answer"],
			[0,"Don't be baby. I know pain, no more complain. You follow.", "answer"]
		]
	],
	["heal1", // 62 d 
		[
			[0,"Forget it, man. My leg’s shot! Let’s just get the hell outta here!", "answer"]
		]
	],
	["heal2", // 63 d 
		[
			[0,"Damn it, man, I told you—forget it! We don’t have time for this!", "answer"]
		]
	],
	["heal3", // 64 d 
		[
			[0,"I said leave it! You’re wasting time! We need to move—NOW!", "answer"]
		]
	],
	["heal4", // 65 d 
		[
			[0,"Fuck you, man...", "answer"]
		]
	],
	["pow1", // 66 d 
		[
			[0,"Damn, this leg is killing me. How much farther to the pickup point?", "answer"]
		]
	],
	["pow2", // 67 d 
		[
			[0,"I didn’t think I’d make it this far. Guess slow and steady wins the race.", "answer"]
		]
	],
	["pow3", // 68 d 
		[
			[0,"Every step is agony. I don’t know how much longer I can keep this up.", "answer"]
		]
	],
	["extract", // 69 d 
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
	["scoutextract", // 70 d 
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
	["smoke", // 71 d 
		[
			[0,"", "answer", 0, { 
				playsound "talkradio"; 
				ranger sideChat "Ranger, Rankin. Requesting smoke pop. Over.";
				}
			]
		]
	],
	["pilotSeesHeli", // 72 d 
		[
			[0,"Hell yes! Get me on that bird!", "answer"]
		]
	],
	["powSeesHeli", // 73 d 
		[
			[0,"Thank God for that beautiful bird... Please let it be real.", "answer"]
		]
	],
	["smokegrape", // 74 d 
		[
			[0,"", "answer", 0, { 
				playsound "talkradio"; 
				ranger sideChat "Ranger, Rankin. I see grape smoke please confirm, over.";
				}
			]
		]
	],
	["smokecherry", // 75 d 
		[
			[0,"", "answer", 0, { 
				playsound "talkradio"; 
				ranger sideChat "Ranger, Rankin. I see cherry smoke please confirm, over.";
				}
			]
		]
	],
	["smokelemon", // 76 d 
		[
			[0,"", "answer", 0, { 
				playsound "talkradio"; 
				ranger sideChat "Ranger, Rankin. I see lemon smoke please confirm, over.";
				}
			]
		]
	],
	["smokelime", // 77 d 
		[
			[0,"", "answer", 0, { 
				playsound "talkradio"; 
				ranger sideChat "Ranger, Rankin. I see lime smoke please confirm, over.";
				}
			]
		]
	],
	["smokecream", // 78 d 
		[
			[0,"", "answer", 0, { 
				playsound "talkradio"; 
				ranger sideChat "Ranger, Rankin. I see cream smoke please confirm, over.";
				}
			]
		]
	],
	["smokeconfirm", // 79 d 
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
	["scoutsmokeconfirm", // 80 d 
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
	["smokeRequest2", // 81 d 
		[
			[0,"", "answer", 0, { 
				playsound "talkradio"; 
				ranger sideChat "Ranger, Rankin. We don't see any smoke. Is this you? I think we have visual.";
				}
			]
		]
	],
	["smokedeny", // 82 d 
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
	["scoutsmokedeny", // 83 d 
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
	["lzBlocked", // 84 d 
		[
			[0,"", "answer", 0, { 
				playsound "talkradio"; 
				ranger sideChat "Ranger, Rankin. I repeat, clear the LZ so we can touch down!";
				}
			]
		]
	],
	["lzNoLongerBlocked", // 85 d 
		[
			[0,"", "answer", 0, { 
				playsound "talkradio"; 
				ranger sideChat "Ranger, Rankin. Coming in hot, stand clear.";
				}
			]
		]
	],
	["goGoGo", // 86 d 
		[
			[0,"Ranger, Get us the hell out of here!", "answer"],
			[1,"My pleasure.", "answer"]
		]
	],
	["goGoGoScout", // 87 d 
		[
			[0,"Ranger, go fast!", "answer"],
			[1,"My pleasure.", "answer"]
		]
	],
	["extractpass", // 88 d 
		[
			[0, "Ranger, we have everyone accounted for!", "answer"],
			[1, "Copy that, Rankin.", "answer"],
			[1,"", "answer", 0, { 
				playsound "talkradio";  
        		ranger sideChat "Ranger, Hawk. Rankin has been extracted. We are RTB. Over."; 
				}
			],
			[2,"", "answer", 0, { 
				playsound "talkradio"; 
        		HQRadio sideChat "Hawk, Ranger. Copy that. Safe return.";
				}
			]
		]
	],
	["extractpassScout", // 89 d 
		[
			[0, "Pilot, all here!", "answer"],
			[1, "Copy that, Rankin.", "answer"],
			[1,"", "answer", 0, { 
				playsound "talkradio";  
        		ranger sideChat "Ranger, Hawk. Rankin has been extracted. We are RTB. Over."; 
				}
			],
			[2,"", "answer", 0, { 
				playsound "talkradio"; 
        		HQRadio sideChat "Hawk, Ranger. Copy that. Safe return.";
				}
			]
		]
	],
	["menLeftBehind", // 90 d 
		[
			[0,"God fucking damnit! We left men behind...", "answer", 3],
			[0,"Ranger, we have friendlies still in the AO. Relay to HQ.", "answer"],
			[1,"You got it.", "answer"],
			[1,"", "answer", 0, { 
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
	["menLeftBehindScout", // 91 d 
		[
			[0,"Brothers still down there...", "answer", 3],
			[0,"Pilot, men still out there. You tell HQ.", "answer"],
			[1,"You got it.", "answer"],
			[1,"", "answer", 0, { 
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
	["powpassconvo", // 92 d 
		[
			[0,"Ranger, we've a wounded POW on board. Need medical ASAP.", "answer"],
			[1,"You got it.", "answer"],
			[1,"", "answer", 0, { 
				playsound "talkradio"; 
				ranger sideChat "Ranger, Hawk. We've got a wounded POW on board needing immediate medical attention. Over.";
				}
			],
			[2,"", "answer", 0, { 
				playsound "talkradio"; 
				HQRadio sideChat "Hawk, Ranger. Copy that. Medical team is on standby, ready for your arrival. Out.";
				}
			],
			[3,"Thank ya'll so much. I didn’t think I’d make it out. You’ve done more for me than I can ever repay.", "answer"],
			[0,"Don't mention it. We’re all on the same team. Rest up and take care.", "answer"]
		]
	],
	["powpassconvoScout", // 93 d 
		[
			[0,"Pilot, we need doctor soon for him.", "answer"],
			[1,"You got it.", "answer"],
			[1,"", "answer", 0, { 
				playsound "talkradio"; 
				ranger sideChat "Ranger, Hawk. We've got a wounded POW on board needing immediate medical attention. Over.";
				}
			],
			[2,"", "answer", 0, { 
				playsound "talkradio"; 
				HQRadio sideChat "Hawk, Ranger. Copy that. Medical team is on standby, ready for your arrival. Out.";
				}
			],
			[3,"Thank ya'll so much. I didn’t think I’d make it out. You’ve done more for me than I can ever repay.", "answer"],
			[0,"You welcome, we on same team.", "answer"]
		]
	],
	["pilotpassconvo", // 94 d 
		[
			[3,"Warrant Officer, I'm Captain Mike Reynolds, can you notify the 615th Tactical Fighter Squadron of my status?", "answer"],
			[1,"Roger that, Captain.", "answer"],
			[1,"", "answer", 0, { 
				playsound "talkradio"; 
				ranger sideChat "Ranger, Hawk. I have a Captain Mike Reynolds onboard. He wishes the 615th Tactical Fighter Squadron be updated on his status. Over.";
				}
			],
			[2,"", "answer", 0, { 
				playsound "talkradio"; 
				HQRadio sideChat "Hawk, Ranger. Copy, We'll inform the 615th. Out.";
				}
			],
			[3,"Thank God for y'all. The guys on the ground are counting on me for support. Now I can get back up there and do my job.", "answer"],
			[0,"You just got shot down and you’re already itching to get back up there?! Damn, you’re a certifiable badass.", "answer"]
		]
	],
	["pilotpassconvoScout", // 95 d 
		[
			[3,"Warrant Officer, I'm Captain Mike Reynolds, can you notify the 615th Tactical Fighter Squadron of my status?", "answer"],
			[1,"Roger that, Captain.", "answer"],
			[1,"", "answer", 0, { 
				playsound "talkradio"; 
				ranger sideChat "Ranger, Hawk. I have a Captain Mike Reynolds onboard. He wishes the 615th Tactical Fighter Squadron be updated on his status. Over.";
				}
			],
			[2,"", "answer", 0, { 
				playsound "talkradio"; 
				HQRadio sideChat "Hawk, Ranger. Copy, We'll inform the 615th. Out.";
				}
			],
			[3,"Thank God for y'all. The guys on the ground are counting on me for support. Now I can get back up there and do my job.", "answer"],
			[0,"You number one brave man!", "answer"]
		]
	],
	["powAndPilot", // 96 d 
		[
			[0,"Ranger, we picked up two survivors in the AO. Have medical ready.", "answer"],
			[1,"You got it.", "answer"],
			[1,"", "answer", 0, { 
				playsound "talkradio"; 
				ranger sideChat "Ranger, Hawk. We've two pickups on board needing immediate medical attention. Over.";
				}
			],
			[2,"", "answer", 0, { 
				playsound "talkradio"; 
				HQRadio sideChat "Hawk, Ranger. Copy that. Medical team is on standby, ready for your arrival. Out.";
				}
			],
			[3,"Thank ya'll so much. I didn’t think I’d make it out. You’ve done more for me than I can ever repay.", "answer"],
			[4,"Thank God for y'all. The guys on the ground are counting on me for support. Now I can get back up there and do my job.", "answer"],
			[0,"Don't mention it. We’re all on the same team. Rest up and take care.", "answer"]
		]
	],
	["powAndPilotScout", // 97 d 
		[
			[0,"Pilot, we have two more soldier. Need doctor.", "answer"],
			[1,"You got it.", "answer"],
			[1,"", "answer", 0, { 
				playsound "talkradio"; 
				ranger sideChat "Ranger, Hawk. We've two pickups on board needing immediate medical attention. Over.";
				}
			],
			[2,"", "answer", 0, { 
				playsound "talkradio"; 
				HQRadio sideChat "Hawk, Ranger. Copy that. Medical team is on standby, ready for your arrival. Out.";
				}
			],
			[3,"Thank ya'll so much. I didn’t think I’d make it out. You’ve done more for me than I can ever repay.", "answer"],
			[4,"Thank God for y'all. The guys on the ground are counting on me for support. Now I can get back up there and do my job.", "answer"],
			[0,"You welcome, we on same team.", "answer"]
		]
	],
	["seePrisonDefault", // 98 d 
		[
			[0,"Look off the starboard side, boys. You can see Phu Quoc Prison. Hell of a sight from the air.", "answer"],
			[1,"The place is huge. Must hold hundreds of prisoners.", "answer"]
		]
	],
	["seePrisonDefaultScout", // 99 d 
		[
			[0,"Look off the starboard side, boys. You can see Phu Quoc Prison. Hell of a sight from the air.", "answer"],
			[1,"This is very sad place. Stay far away.", "answer"]
		]
	],
	["seePrison", // 100 d 
		[
			[0,"Look off the starboard side, boys. You can see Phu Quoc Prison. Hell of a sight from the air.", "answer"],
			[1,"The place is huge. Must hold hundreds of prisoners.", "answer"],
			[2,"This is very sad place. Stay far away.", "answer"]
		]
	],
	["seePrisonScout", // 101 d 
		[
			[0,"Look off the starboard side, boys. You can see Phu Quoc Prison. Hell of a sight from the air.", "answer"],
			[1,"This is very sad place. Stay far away.", "answer"],
			[2,"The place is huge. Must hold hundreds of prisoners.", "answer"]
		]
	],
	["seePrisonPOW", // 102 d 
		[
			[0,"Look off the starboard side, boys. You can see Phu Quoc Prison. Hell of a sight from the air.", "answer"],
			[1,"The place is huge. Must hold hundreds of prisoners.", "answer"],
			[2,"For how they treated me, I don't give a fuck... Hell, I hope it's worse than the shit they put me through.", "answer"],
			[3,"Many there not belong. I know. You suffer one person. They suffer thousands.", "answer"]
		]
	],
	["seePrisonScoutPOW", // 103 d 
		[
			[0,"Look off the starboard side, boys. You can see Phu Quoc Prison. Hell of a sight from the air.", "answer"],
			[1,"The place is huge. Must hold hundreds of prisoners.", "answer"],
			[2,"For how they treated me, I don't give a fuck... Hell, I hope it's worse than the shit they put me through.", "answer"],
			[3,"Many there not belong. I know. You suffer one person. They suffer thousands.", "answer"]
		]
	],
	["heliAtBaseAmbulance",
		[
			[0,"Anyone recovered needing transport or medical attention, get in the ambulance right over there and they will get you taken care of.", "answer"]
		]
	],
	["heliAtBase",
		[
			[0,"Alright boys, last stop. Head to the beach and let's debrief with the Captain.", "answer"]
		]
	],
	["heliAtBaseScout",
		[
			[0,"We back. Now talk to Captain.", "answer"]
		]
	],
	["debriefArea", // 104 d 
		[
			[0,"Hey, Captain!", "answer"],
			[1,"Welcome back, gentlemen.", "answer"]
		]
	],
	["powDead",
		[
			[0,"Goddammit, the POW is down!", "answer"]
		]
	],
	["powDeadScout",
		[
			[0,"We loose POW!", "answer"]
		]
	],
	["pilotDead",
		[
			[0,"Goddammit, the pilot is down!", "answer"]
		]
	],
	["pilotDeadScout",
		[
			[0,"We loose pilot!", "answer"]
		]
	],
	["debrief", // 
		[
			[0,"Ready for debrief, sir.", "answer"],
			[1,"Aright, lets hear it.", "answer", 0, {
				marcinko switchMove ["HubBriefing_loop", 0, 0];
				missionNamespace setVariable ["startBoat", true, true];
			}]
		]
	],
	["debriefScout", // 
		[
			[0,"Ready for debrief, sir.", "answer"],
			[1,"Aright, lets hear it.", "answer", 0, {
				marcinko switchMove ["HubBriefing_loop", 0, 0];
				missionNamespace setVariable ["startBoat", true, true];
			}]
		]
	],
	["hvtPass", // 
		[
			[0,"We got the bastard, Captain! Here are his credentials!", "answer"],
			[1,"Hot damn! You got that commie rat bastard! Outstanding job!", "answer"],
			[1,"And what about the STAB? Did you cover your tracks?", "answer"]
		]
	],
	["hvtMid", // 
		[
			[0,"The general is dead, but any proof of the deed went up in flames.", "answer"],
			[1,"Well this isn't the best outcome but this is surley a blow to the enemy none the less.", "answer"],
			[1,"And what about the STAB? Did you cover your tracks?", "answer"]
		]
	],
	["hvtFailed", // 
		[
			[0,"Well, as you know. The slippery bastard got away.", "answer"],
			[1,"I feared as much. We'll nab the son of a bitch next time. Well, if there is a next time...", "answer"],
			[1,"And what about the STAB? Did you cover your tracks?", "answer"]
		]
	],
	["hvtPassScout", // 
		[
			[0,"We kill General! Here, take papers.", "answer"],
			[1,"Hot damn! You got that commie rat bastard! Outstanding job!", "answer"],
			[1,"And what about the STAB? Did you cover your tracks?", "answer"]
		]
	],
	["hvtMidScout", // 
		[
			[0,"We kill General but no papers.", "answer"],
			[1,"Well this isn't the best outcome but this is surley a blow to the enemy none the less.", "answer"],
			[1,"And what about the STAB? Did you cover your tracks?", "answer"]
		]
	],
	["hvtFailedScout", // 
		[
			[0,"General run away.", "answer"],
			[1,"I feared as much. We'll nab the son of a bitch next time. Well, if there is a next time...", "answer"],
			[1,"And what about the STAB? Did you cover your tracks?", "answer"]
		]
	],
	["stabFailed", // 
		[
			[0,"Unfortunantley, no. We take full responsibility, sir.", "answer"],
			[1,"Truly unfortunante, now we no longer have plausible deniability. Let's hope this doesn't cause and international incident.", "answer"],
			[1,"Were you able to take a look around in Lumphat?", "answer"]
		]
	],
	["stabPassed", // 
		[
			[0,"We wiped clean any involvment of ourselfs. Zero traces, noboby will know we we're ever there.", "answer"],
			[1,"Textbook, I knew you would. We're you able to search Lumphat, as well?", "answer"]
		]
	],
	["stabFailedScout", // 
		[
			[0,"STAB no destroy. We make big mistake.", "answer"],
			[1,"Truly unfortunante indeed, now we no longer have plausible deniability. Let's hope this doesn't cause and international incident.", "answer"],
			[1,"Were you able to take a look around in Lumphat?", "answer"]
		]
	],
	["stabPassedScout", // 
		[
			[0,"STAB destroy. We ghost.", "answer"],
			[1,"Textbook, I knew you would. We're you able to search Lumphat, as well?", "answer"]
		]
	],
	["allSec", // 
		[
			[0,"Yes sir! We found some intel there that lead to multiple targets. We hit them like hell! The enemy will be reeling for weeks.", "answer"],
			[1,"Fantastic!", "answer"]
		]
	],
	["someSec", // 
		[
			[0,"Yes sir. After we left Lumphat, we we're able to hit some additonal targets in the AO.", "answer"],
			[1,"Nicely done.", "answer"]
		]
	],
	["noSec", // 
		[
			[0,"We tried but didn't get a chance to accomplish anything else in the AO.", "answer"],
			[1,"I guess we can't have our cake and eat it too, huh?", "answer"]
		]
	],
	["allSecScout", // 
		[
			[0,"Yes sir! We destroy many target. Enemy very afraid, now.", "answer"],
			[1,"Fantastic!", "answer"]
		]
	],
	["someSecScout", // 
		[
			[0,"Yes sir, we destroy some target.", "answer"],
			[1,"Nicely done.", "answer"]
		]
	],
	["noSecScout", // 
		[
			[0,"No other target this time.", "answer"],
			[1,"I guess we can't have our cake and eat it too, huh?", "answer"]
		]
	],
	["powDied", // 
		[
			[0,"There's more, we seached a rat-hole and found a POW. But... recovery wasn’t possible.", "answer"],
			[1,"Use that to fuel your fury.", "answer"]
		]
	],
	["powRescued", // 
		[
			[0,"There's more, we found a rat-hole in the AO and wouldn't you believe it, a POW. We saw him to the ambulance for his wounds.", "answer"],
			[1,"Now there's lucky bastard that needs to play the lotto.", "answer"]
		]
	],
	["pilotDied", // 
		[
			[0,"There's more, we came across a down pilot, an American. But... recovery wasn’t possible.", "answer"],
			[1,"That's a damn shame.", "answer"]
		]
	],
	["pilotRescued", // 
		[
			[0,"There's more, we brought back a down pilot, an American. We saw him off to the ambulance.", "answer"],
			[1,"What are the chances that you all were in the same place at the same time? He's a lucky son of a bitch.", "answer"]
		]
	],
	["pilotAndPowDied", // 
		[
			[0,"There's more, we found two friendlies from the AO, but recovery wasn’t possible...", "answer"],
			[1,"That's a goddamn shame. I'll notify the family.", "answer"]
		]
	],
	["pilotAndPowRescued", // 
		[
			[0,"There's more, we brought back two extra friendlies from the AO! They are getting checked over now.", "answer"],
			[1,"These men and their families will be ever thankfull for this.", "answer"]
		]
	],
	["powDiedScout", // 
		[
			[0,"We find POW in rat-hole. But he not here, so sorry.", "answer"],
			[1,"Use it to fuel your fury.", "answer"]
		]
	],
	["powRescuedScout", // 
		[
			[0,"We find POW in rat-hole. He alive in base now.", "answer"],
			[1,"Now there's lucky bastard that needs to play the lotto.", "answer"]
		]
	],
	["pilotDiedScout", // 
		[
			[0,"We find American pilot. But he not here, so sorry.", "answer"],
			[1,"That's a damn shame.", "answer"]
		]
	],
	["pilotRescuedScout", // 
		[
			[0,"We find American pilot. He alive in base now.", "answer"],
			[1,"What are the chances that you all were in the same place at the same time? He's a lucky son of a bitch.", "answer"]
		]
	],
	["pilotAndPowDiedScout", // 
		[
			[0,"We find two Americans but they not here, so sorry.", "answer"],
			[1,"That's a goddamn shame. God rest their souls. I'll notify the family.", "answer"]
		]
	],
	["pilotAndPowRescuedScout", // 
		[
			[0,"We find two Americans. They alive in base now.", "answer"],
			[1,"These men and their families will be ever thankfull for this.", "answer"]
		]
	],
	["extractFailed", // 
		[
			[0,"Captain... I'm ashamed to say, not everyone made it back...", "answer"],
			[1,"Yeah, I heard Ranger call it in, we're already prepping a rescue effort. God help them.", "answer"]
		]
	],
	["extractPassed", // 
		[
			[0,"And here we are, sir, every man accounted for.", "answer"]
		]
	],
	["extractFailedScout", // 
		[
			[0,"Captain... everybody no here...", "answer"],
			[1,"Yeah, I heard Ranger call it in, we're already prepping a rescue effort. God help them.", "answer"]
		]
	],
	["extractPassedScout", // 
		[
			[0,"Now, we here, sir. We have all soldier.", "answer"]
		]
	],
	["summaryBest", // players complete all major tasks and all side tasks plus at least one rescue
		[
			[1,"Exemplary performance, gentlemen! You all have truly earned the title of warriors. Effective immediately you're on R and R. Go bang boom-boom girls in Saigon 'till the cows come home! Dismissed!", "answer"],
			[0,"Thank you, Sir!", "answer", 0, {
				missionNamespace setVariable ["foxClub_var_showAchievements", true, true];
				sleep 5;
				//["1", true , true, true, true] remoteExec ["VN_fnc_endMission"];
				["1", true, true, true, true] call VN_fnc_endMission;
			}]
		]
	],
	["summaryBetter", // players complete all major tasks and all side tasks. disregards whether or not a rescue was made. 
		[
			[1,"Outstanding performance, gentlemen! Your country owes you a great deal! There will be a victory celebration at the bar tonight with drinks on the Navy! Dismissed!", "answer"],
			[0,"Thank you, Sir!", "answer", 0, {
				missionNamespace setVariable ["foxClub_var_showAchievements", true, true];
				sleep 5;
				//["2", true , true, true, true] remoteExec ["VN_fnc_endMission"];
				["2", true, true, true, true] call VN_fnc_endMission;
			}]
		]
	],
	["summaryGood", // players complete all major tasks and some or not of side tasks. disregards whether or not a rescue was made
		[
			[1,"Amazing performance, gentlemen! Damn fine work out there! You held your own in a tough AO and came through solid. Command will be pleased, and so am I. Get some rest, you earned it!", "answer"],
			[0,"Thank you, Sir!", "answer", 0, {
				missionNamespace setVariable ["foxClub_var_showAchievements", true, true];
				sleep 5;
				//["3", true , true, true, true] remoteExec ["VN_fnc_endMission"];
				["3", true, true, true, true] call VN_fnc_endMission;
			}]
		]
	],
	["summaryDefault", // players fail at least one but not all major tasks. disregards whether or not a rescue was made 
		[
			[1,"Great work today even though not everything went our way. That's just how it goes. Hit the head and get cleaned up, I'll see you at chow. Dismissed!", "answer"],
			[0,"Thank you, Sir!", "answer", 0, {
				missionNamespace setVariable ["foxClub_var_showAchievements", true, true];
				sleep 5;
				//["4", false , true, true, true] remoteExec ["VN_fnc_endMission"];
				["4", false, true, true, true] call VN_fnc_endMission;
			}]
		]
	],
	["summaryPoor", // players fail all major tasks. this is the worst case. disregards whether or not a rescue was made
		[
			[1,"Well, I've heard enough. Gentlemen, that was quite the shit show! I'm at a loss for words. I thought you were professionals. We obviously need to step up our training regimine. What a disaster. You are dismissed.", "answer", 1],
			[0,"Aye aye, Sir.", "answer", 0, {
				missionNamespace setVariable ["foxClub_var_completeAchievementWorst", true, true];
				sleep 5;
				//["6", false , true, true, true] remoteExec ["VN_fnc_endMission"];
				["6", false, true, true, true] call VN_fnc_endMission;
			}]
		]
	],
	["summaryLessPoor", // players fail both hvt and stab tasks
		[
			[1,"Tough operation, gentlemen. The jungle had other plans today. What matters is you’re still standing. Clean up, get some chow, and we’ll sort this out in the morning. Dismissed.", "answer", 1],
			[0,"Aye aye, Sir.", "answer", 0, {
				missionNamespace setVariable ["foxClub_var_showAchievements", true, true];
				sleep 5;
				//["5", false , true, true, true] remoteExec ["VN_fnc_endMission"];
				["5", false, true, true, true] call VN_fnc_endMission;
			}]
		]
	],
	["summaryBestScout", // players complete all major tasks and all side tasks plus at least one rescue
		[
			[1,"Exemplary performance, gentlemen! You all have truly earned the title of warriors. Effective immediately you're on R and R. Go bang boom-boom girls in Saigon 'till the cows come home! Dismissed!", "answer"],
			[0,"Thank you, Sir!", "answer", 0, {
				missionNamespace setVariable ["foxClub_var_showAchievements", true, true];
				sleep 5;
				//["1", true , true, true, true] remoteExec ["VN_fnc_endMission"];
				["1", true, true, true, true] call VN_fnc_endMission;

			}]
		]
	],
	["summaryBetterScout", // players complete all major tasks and all side tasks. disregards whether or not a rescue was made. 
		[
			[1,"Outstanding performance, gentlemen! Your country owes you a great deal! There will be a victory celebration at the bar tonight with drinks on the Navy! Dismissed!", "answer"],
			[0,"Thank you, Sir!", "answer", 0, {
				missionNamespace setVariable ["foxClub_var_showAchievements", true, true];
				sleep 5;
				//["2", true , true, true, true] remoteExec ["VN_fnc_endMission"];
				["2", true, true, true, true] call VN_fnc_endMission;
			}]
		]
	],
	["summaryGoodScout", // players complete all major tasks and some or not of side tasks. disregards whether or not a rescue was made
		[
			[1,"Amazing performance, gentlemen! Damn fine work out there! You held your own in a tough AO and came through solid. Command will be pleased, and so am I. Get some rest, you earned it!", "answer"],
			[0,"Thank you, Sir!", "answer", 0, {
				missionNamespace setVariable ["foxClub_var_showAchievements", true, true];
				sleep 5;
				//["3", true , true, true, true] remoteExec ["VN_fnc_endMission"];
				["3", true, true, true, true] call VN_fnc_endMission;
			}]
		]
	],
	["summaryDefaultScout", // players fail at least one but not all major tasks. disregards whether or not a rescue was made 
		[
			[1,"Great work today even though not everything went our way. That's just how it goes. Hit the head and get cleaned up, I'll see you at chow. Dismissed!", "answer"],
			[0,"Thank you, Sir!", "answer", 0, {
				missionNamespace setVariable ["foxClub_var_showAchievements", true, true];
				sleep 5;
				//["4", false , true, true, true] remoteExec ["VN_fnc_endMission"];
				["4", false, true, true, true] call VN_fnc_endMission;
			}]
		]
	],
	["summaryPoorScout", // players fail all major tasks. this is the worst case. disregards whether or not a rescue was made
		[
			[1,"Well, I've heard enough. Gentlemen, that was quite the shit show! I'm at a loss for words. I thought you were professionals. We obviously need to step up our training regimine. What a disaster. You are dismissed.", "answer", 1],
			[0,"Yes, Sir.", "answer", 0, {
				missionNamespace setVariable ["foxClub_var_completeAchievementWorst", true, true];
				sleep 5;
				//["6", false , true, true, true] remoteExec ["VN_fnc_endMission"];
				["6", false, true, true, true] call VN_fnc_endMission;
			}]
		]
	],
	["summaryLessPoorScout", // players fail both hvt and stab tasks
		[
			[1,"Tough operation, gentlemen. The jungle had other plans today. What matters is you’re still standing. Clean up, get some chow, and we’ll sort this out in the morning. Dismissed.", "answer", 1],
			[0,"Yes, Sir.", "answer", 0, {
				missionNamespace setVariable ["foxClub_var_showAchievements", true, true];
				sleep 5;
				//["5", false , true, true, true] remoteExec ["VN_fnc_endMission"];
				["5", false, true, true, true] call VN_fnc_endMission;
			}]
		]
	]
];



