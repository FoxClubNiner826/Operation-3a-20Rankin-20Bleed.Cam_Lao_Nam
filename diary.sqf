if (!hasInterface) exitWith {};
waitUntil {!isNull player};
/*
modifiers, links, and font options
<marker name='marker_name'>text with link</marker>
<img image='Image file name jpeg or paa' />
<font color='#FF0000' size='14' face='vbs2_digital'>Text you want in this font</font>
<br/> New Line

http://www.w3schools.com/colors/colors_picker.asp

https://community.bistudio.com/wikidata/images/archive/0/0e/20140217182059%21Arma3Fonts.png
*/

player createDiaryRecord ["Diary",["Glossary",
"
<font color='#FFFF00'>AO</font>: Area of Opperation.<br/>
<font color='#FFFF00'>Covey</font>: Forward Air Controller. Also destroys enemy units and their logistic support.<br/>
<font color='#FFFF00'>CMIC</font>: The Combined Military Interrogation Center. A joint U.S.-South Vietnamese interrogation operation designed to collect intelligence from captured soldiers.<br/>
<font color='#FFFF00'>Kit Carson</font>: Defected enemy combatants that are used as scouts.<br/>
<font color='#FFFF00'>Klick</font>: Kilometer.<br/>
<font color='#FFFF00'>LZ</font>: Landing Zone.<br/>
<font color='#FFFF00'>M2 STAB</font>: Seal Team Assault Boat. A fast and heavily armed riverine assault boat developed by the United States Navy.<br/>
<font color='#FFFF00'>MST</font>: Mobile Support Team. Supports SEAL operations.<br/>
<font color='#FFFF00'>P.O.</font>: A Petty Officer is a non-commissioned officer (NCO) in the U.S. Navy, typically responsible for leading small teams or sections.<br/>
<font color='#FFFF00'>NVA</font>: North Vietnamese Army. National military force of the Socialist Republic of Vietnam<br/>
<font color='#FFFF00'>ROE</font>: Rules of Engagement.<br/>
<font color='#FFFF00'>S4</font>: Responsible for logistics and supply chain management in the United States Navy.<br/>
<font color='#FFFF00'>The Farm</font>: The Central Intelligence Agency. A civilian foreign intelligence service of the federal government of the United States.<br/>
<font color='#FFFF00'>TOO</font>: Targets of Opportunity.<br/><br/>

"]];

player createDiaryRecord ["Diary",["Intelligence",
"
<font color='#FFFF00'>Enemy Presence:</font> Unknown Infantry, Armor, or Air.<br/>
<font color='#FFFF00'>Civilian Presence:</font> Highly Likely.<br/>
<font color='#FFFF00'>ROE:</font> Weapons Free but being covert will increase odds of mission success.<br/> 
<font color='#FFFF00'>TOO:</font> Complete optional objectives at your discretion but it is mission critical to kill the HVT.<br/>
<font color='#FFFF00'>Weather Forecast:</font> Fog and light rain at dawn, leading to clear skies by midday. High of 85°F and low of 75°F.<br/>
<font color='#FFFF00'>Armament:</font> Navy SEAL loadout. Recommend suppressed small arms.<br/> 
<font color='#FFFF00'>Supplies in STAB:</font> SCUBA gear, explosive satchels, and whatever you want to put in there.<br/>
<font color='#FFFF00'>HVT:</font> NVA General. Seen in photos wearing a green uniform, soft cover, bandana and pistol holster.<br/><br/>
<img image='pics\hvtbrief.jpg' /><br/><br/>
Above: HVT - General Tan.
"]];

player createDiaryRecord ["Diary",["Signal",
"
<font color='#FFFF00'>Eagle:</font> Captain Richard Marcinko - Commanding Officer<br/>
<font color='#FFFF00'>Hawk:</font> Chief Petty Officer James Harrison - Navy Radioman<br/>
<font color='#FFFF00'>Covey:</font> Major Tom Collins - Forward Air Controller<br/>
<font color='#FFFF00'>Ranger:</font> Chief Warrant Officer George Scott - Helicopter Pilot<br/>
<font color='#FFFF00'>Rankin:</font> SEAL Team One with Chong Thay - Kit Carson Scout<br/>
"]];

player createDiaryRecord ["Diary",["Execution",
"1. Insert with the STAB under cover of darkness and reach the <marker name='cove'>recon area</marker>.<br/>
2. Wait for the NVA naval patrol to leave the area.<br/>
3. Deactivate the <marker name='mines'>naval mines</marker> in order to reach the <marker name='ingress_point'>infiltration point</marker>.<br/>
4. Destroy the STAB.<br/>
5. Remain covert as you approach <marker name='lumphat'>Lumphat</marker> or risk mission failure.<br/>
6. Kill the HVT.<br/>
7. Complete optional mission objectives as your discretion.<br/>
8. Get to the <marker name='marker_64'>exfiltration point</marker> and call Covey to take you back to the 
mission <marker name='mission_start'>staging area</marker>.<br/><br/>

"]];

player createDiaryRecord ["Diary",["Mission",
"""Good afternoon, gentlemen. Welcome to Phú Quoc, the largest island in Vietnam. I’ll get straight to the point. This is a high-priority mission.<br/><br/>
 
CMIC has obtained credible intel from the prison here. Intel cross-checked by our boys at the farm by the way, that provides the location of one whooper of a HVT. 
Tommorrrow we hunt the biggest game of the war so far, a full-blown NVA General. His name is General Tan, and you are going to be 
the ones to put this commie bastard in the dirt. Congratulations.<br/><br/>

Zero-hour is scheduled for tomorrow at zero-hundred. We’ll prepare at the staging area by the docks. Logistics has allocated resources for your needs. Given the nature of this 
mission, I advise using suppressed weapons to maintain stealth. We’ve also received a STAB from MST, but they won’t be accompanying us since this is a one-way 
insertion for the boat. You will insert at the mouth of the Tonle Srepok River, establish a reconnaissance position, and monitor for a North Vietnamese naval 
patrol that typically passes through in the early morning hours..<br/><br/>

Once the patrol departs, you’ll need to navigate through a naval minefield to proceed upriver. After that, move to the designated infil point. It is imperative 
that you do not deviate from this route. Our aerial reconnaissance images are not as detailed as those in civilian publications, but they indicate a North Vietnamese 
naval yard further upstream. As we are operating illegally in Cambodia, you must scuttle the STAB to ensure no evidence of our presence remains in the AO. Understood?<br/><br/>

Proceed to Lumphat, where the target is located. It’s less than a klick northeast of the infil point. If you execute the mission properly, you should remain 
undetected. Move cautiously and avoid being seen, as detection could compromise the mission. The village contains both civilian and military personnel. Establish 
a secure observation point and positively identify General Tan. Once confirmed, eliminate him. If you haven’t caused too much commotion, gather any useful intelligence 
before withdrawing. Your exfiltration point will be Hill 156, a short distance southeast of Lumphat. Upon arrival at the LZ, contact Covey for exfil.<br/><br/>

Despite the several moving parts, the mission is straightforward: infiltrate, eliminate, and exfiltrate. Successfully completing this mission will earn you lasting 
recognition and rewards. You could find yourself celebrated in Saigon, featured in military publications, or even meeting high-profile figures. One last thing, I will 
be assigning a Kit Carson to your squad. This individual has been vetted by the 9th Marines, is familiar with the area, the language, and has proven his reliability. 
Utilize his expertise to your advantage.<br/><br/> 

If you have any questions, you can ask me at the staging area tommorrow. 
See you at the ass-crack of dawn! Dismissed."" - Captain Marcinko<br/><br/>

<img image='pics\boss.jpg' /><br/><br/>

Above: Captain Marcinko.

"]];

player createDiaryRecord ["Diary",["Situation",
"June 23, 1967, South Vietnam.<br/><br/> 

The United States is engaged in a steadily expanding, air and ground war in Southeast Asia. 
More than 380,000 American troops are in country. Operation Rolling Thunder, the bombing campaign against North Vietnam, 
has proved ineffective at hindering the insurgency in South Vietnam. Enemy troops and equipment continue to flow along the 
Ho Chi Minh Trail, a network of roads and trails that runs from North to South Vietnam through the Kingdoms of Laos and Cambodia. 
The trail operates both day and night, with no end in sight.<br/><br/>

<img image='pics\map.jpg' /><br/><br/>

Above: Ho Chi Minh Trail flows through Laos and Cambodia into South Vietnam.
"]];

player createDiarySubject ["Historical","Mission Codex"];

player createDiarySubject ["Parameters","Mission Options"];

player createDiaryRecord ["Parameters", ["Achievements", 
"<br/>
Achievements are disabled by default.<br/><br/>
It’s recommended to play with them off for your first run, as many achievements contain spoilers. 
Their titles are intentionally vague to reduce this, but some hints still remain. Completed achievements will be shown at the end of the mission.<br/><br/>
You can enable achievements by interacting with the map board next to the arsenal.<br/><br/>
This is a global effect, meaning it applies to all players in the mission.
" ]];

player createDiaryRecord ["Parameters", ["Navigation Aid", 
"<br/>
3D task markers are disabled by default.<br/><br/>
This mission was designed to encourage players to use their orientation skills. By default, Arma 3 places 3D task markers in both the world and the map.  
Although the game difficulty option Waypoints can disable markers in the world, it does not affect the map. 
This means objectives that are meant to be searched for are still revealed, which undermines the challenge.<br/><br/>  
If you don’t want to focus on orientation skills, you can enable 3D task markers to make objectives easy to find.<br/><br/>

You can enable them by interacting with the map board next to the arsenal.<br/><br/>

This is a global effect, meaning the setting will apply to every player in the mission.

" ]];

player createDiaryRecord ["Parameters", ["Subtitles", 
"<br/>
Subtitles are enabled by default.<br/><br/>
You can disable them by interacting with the map board next to the arsenal.<br/><br/>
This is a local effect, meaning subtitles are only disabled for the player who chooses to do so.
" ]];

player createDiaryRecord ["Parameters", ["Squad Banter", 
"<br/>
Squad Banter is enabled by default.<br/><br/>

You can turn it off by interacting with the map board next to the arsenal.<br/><br/>

It’s recommended to keep it on for your first playthrough. The option to turn it off exists mainly for multiplayer,
where a player may prefer to hear information from another player instead of their character.
For example, a player might report a sighting at the same time their character does, resulting in redundant information.<br/><br/>

This is a local effect, meaning banter is only minimized for the player who chooses to do so.
" ]];

player createDiaryRecord ["Parameters", ["Skipping Ahead", 
"<br/>
Skipping Ahead is disabled by default.<br/><br/>
The beginning portion off the mission can be skipped which will reduce playtime by about 30 minutes. You will placed next to 
the infiltration point.<br/><br/>
You can enable this option by interacting with the map stand next to the arsenal. 
Select the 'Enable Skip to Infil' option. Once enabled, you can execute this option from within the STAB after all human players are aboard.
" ]];

player createDiaryRecord ["Parameters", ["Group Leader", 
"<br/>
Multiplayer only:<br/><br/>
The default group leader (the player who controls the AI) is the Commander slot.<br/><br/>
You can change the group leader by interacting with the map stand next to the arsenal.<br/><br/>
You can also choose to play without AI by disabling them in the lobby.
" ]];

player createDiaryRecord ["Parameters", ["Game Master", 
"<br/>Game Master (Zeus) is available in singleplayer and multiplayer.<br/><br/>
In multiplayer, you can:<br/>
- Select the Virtual Entity slot in the lobby to play as a dedicated Game Master.<br/>
- Select a playable unit and log in as server admin to be Zeus while commanding that unit.
" ]];

player createDiaryRecord ["Historical", ["Phu Quoc Prison", 
"<br/>Phu Quoc POW camp, known as Phu Quoc Prison or Coconut Tree Prison, was the largest POW camp in South Vietnam during the Vietnam War. 
Located on Phu Quoc Island in the Gulf of Thailand, the camp housed tens of thousands of North Vietnamese soldiers and Viet Cong fighters under 
harsh conditions, including overcrowding, poor sanitation, and inadequate medical care.<br/><br/>

Interrogations were a key aspect of the camp, with prisoners subjected to intense questioning to extract intelligence. This information was 
often shared with the Combined Military Interrogation Center (CMIC) in Saigon, where it was used to support military operations and disrupt 
Viet Cong activities. The remote location of Phu Quoc made it an ideal site for secure detention and interrogation.<br/><br/>

Despite its notoriety for brutal treatment, the camp played a crucial role in the war effort. Today, it stands as a historical site, reminding 
visitors of the severe conditions and suffering experienced by those held there.<br/><br/>

<img image='pics\powcamp.jpg'/><br/><br/>

Above: Camp barracks in November, 1968.<br/><br/>
" ]];

player createDiaryRecord ["Historical", ["CMIC", 
"<br/>The Combined Military Interrogation Center (CMIC) was a critical facility during the Vietnam War, where U.S. and South Vietnamese 
forces interrogated captured Viet Cong and North Vietnamese soldiers. Located primarily in Saigon, CMIC played a vital role in gathering 
and processing intelligence to support military operations.<br/><br/>

Interrogation techniques at CMIC ranged from psychological tactics to more coercive methods, leading to controversial reports of abuse. 
The intelligence gathered was meticulously processed, analyzed, and then used to plan military operations, disrupt enemy networks, and 
target key figures. CMIC's role in processing this information was essential, as it ensured that actionable intelligence was effectively 
disseminated to units in the field, often coordinating with efforts like the Phoenix Program. Despite its strategic importance, CMIC's 
legacy is marred by allegations of human rights abuses and the ethical complexities of its methods.<br/><br/>

<img image='pics\CMIC1.jpg'/><br/><br/>

Above: CMIC organization flow chart.<br/><br/>

<img image='pics\CMIC2.jpg'/><br/><br/>

Above: CMIC translators processing intelligence.
" ]];

player createDiaryRecord ["Historical", ["Colored Smoke", 
"<br/>During the Vietnam War, colored smoke was essential for marking landing zones (LZs) due to the dense jungle and difficult terrain. This tactic 
provided pilots with clear visual cues to safely identify and land in designated areas while avoiding potential obstacles and enemy positions. 
Coordinating with ground troops, the smoke ensured that LZs were secure, which was crucial for preventing ambushes and ensuring the safety of 
operations.<br/><br/>

To prevent deception by enemy forces, who could monitor U.S. radio traffic, specific smoke colors were assigned for various purposes, such as 
marking safe landing areas or identifying targets. Pilots confirmed the smoke color over the radio to ensure it matched pre-established signals, 
reducing the risk of misleading markers. This strategy was crucial in avoiding confusion and ensuring that the smoke signals were reliable, 
thereby improving the accuracy of landings and extractions and contributing to the overall safety and effectiveness of helicopter operations 
in the challenging Vietnam environment.<br/><br/>

<img image='pics\smoke.jpg'/><br/><br/>

Above: LZ with colored smoke.<br/><br/>

<img image='pics\smoke2.jpg'/><br/><br/>

Above: 30 Apr 1968, South Vietnam - Smoke marks the landing spot for an evacuation helicopter coming in to take out U.S. calvarymen 
wounded in the battle for control of the vital A Shau Valley.
" ]];

player createDiaryRecord ["Historical", ["SCUBA Operations", 
"<br/>Navy SEAL scuba operations during the Vietnam War were crucial for their specialized missions, leveraging underwater capabilities for various 
tactical objectives. SEALs used scuba gear for clandestine operations in rivers, lakes, and coastal areas, conducting underwater reconnaissance, 
sabotage, and insertion/extraction missions with minimal detection. They performed underwater demolition, targeting enemy infrastructure such as 
bridges and supply lines, and used covert insertions and extractions to approach targets via underwater routes.<br/><br/>

A significant aspect of their scuba operations included the deactivation of naval mines. SEALs utilized their diving skills and specialized 
equipment to locate, identify, and neutralize mines, which posed a substantial threat to maritime operations. Their expertise in underwater 
demolition and mine clearance made them a formidable force in both aquatic and coastal environments, contributing significantly to their 
effectiveness in unconventional warfare during the Vietnam War.<br/><br/>

<img image='pics\scubaseals.jpg'/><br/><br/>

Above: Seals in SCUBA gear.
" ]];

player createDiaryRecord ["Historical", ["M2 STAB", 
"<br/>The M2 STAB (Strike Assault Boat) was a crucial asset for U.S. forces during the Vietnam War, particularly in the riverine operations of the Mekong 
Delta. Designed for high-speed and aggressive maneuvers, the STAB was heavily armed with machine guns, grenade launchers, and sometimes recoilless 
rifles, making it highly effective in narrow rivers and shallow waters.<br/><br/>

Used by the U.S. Navy’s Mobile Riverine Force, the STAB played a key role in search and destroy missions, ambushes, and patrols. Its speed and 
firepower allowed it to disrupt Viet Cong supply lines, provide fire support, and rapidly deploy troops in challenging environments.<br/><br/>

The M2 STAB's agility and effectiveness in riverine warfare provided U.S. forces with a significant tactical advantage and influenced future designs 
for military riverine craft. Its legacy lies in demonstrating the importance of mobility and firepower in counter-guerrilla operations.<br/><br/>

<img image='pics\STAB3.jpg'/><br/><br/>

Above: SEALs with a Kit Carson (left) aboard a M2 STAB (1967). <br/><br/>

<img image='pics\STAB4.jpg'/><br/><br/>

Above: SEALs en route with a pair of STABs.
" ]];

player createDiaryRecord ["Historical", ["Suppressed Weapons", 
"<br/>During the Vietnam War, Navy SEALs relied on various suppressed weapons to enhance stealth and effectiveness in covert operations.<br/><br/> 

The MAC-10 submachine gun, with its compact design and high rate of fire, was used with a suppressor for close-quarters combat and ambushes, 
providing effective firepower while minimizing noise. Similarly, the suppressed Uzi was valued for its durability and rapid fire, making it 
a useful tool for stealthy engagements in tight situations.<br/><br/>

The M14 and M16 rifles, when fitted with suppressors, offered improved accuracy and reduced noise for both long-range and close-quarters 
engagements. These rifles were adapted for various combat scenarios, ensuring that SEALs could operate quietly and effectively across different 
environments.<br/><br/>

Silenced .45 ACP pistols provided reliable stopping power with minimal sound, suitable for close-range encounters where stealth was essential. 
The Model 10 revolver, also used with a suppressor, offered a low-noise option for situations requiring precision and discretion.<br/><br/>

Overall, these suppressed weapons allowed Navy SEALs to conduct their missions with enhanced stealth and operational effectiveness, crucial for 
the success of their covert operations in Vietnam.<br/><br/>

<img image='pics\guns.jpg'/><br/><br/>

Above: Swedish K SMG (M/45).<br/><br/>

<img image='pics\guns3.jpg'/><br/><br/>

Above: M3A1 Grease Gun.
" ]];

player createDiaryRecord ["Historical", ["Camouflage", 
"<br/>During the Vietnam War, effective camouflage was crucial for U.S. and allied forces operating in the dense jungle terrain. Elite units like U.S. 
Special Forces and the South Vietnamese Army (ARVN) often wore the Tiger Stripe pattern, known for its bold green, brown, and black stripes, 
which provided excellent concealment in the jungle. The U.S. Army developed the ERDL pattern, featuring a mix of green, brown, black, and light 
green shapes. This pattern came in ""lowland"" (more green) and ""highland"" (more brown) versions, widely used by Marines and Army personnel.<br/><br/>

Initially, U.S. forces wore plain olive drab uniforms, which, while not true camouflage, offered better concealment than traditional uniforms. 
These were later replaced by jungle fatigues, lightweight and more suited to the environment. Navy SEALs, known for their unconventional approach, 
often wore blue jeans during operations. The jeans were durable, comfortable in the jungle, and allowed SEALs to blend in with civilians during 
covert missions.<br/><br/>

These camouflage patterns, along with practical choices like blue jeans, significantly enhanced the ability of U.S. and allied troops to operate 
stealthily in Vietnam's challenging environment and influenced the design of military uniforms for years to come.<br/><br/>

<img image='pics\ERDL3.jpg' /><br/><br/>

Above: SEALs wearing ERDL with Kit Carson in background.<br/><br/>

<img image='pics\tigerstripe.jpg' /><br/><br/>

Above: SEALs wearing a mix of Tiger Stripe and ERDL.<br/><br/>

<img image='pics\bluejeans.jpg' /><br/><br/>

Above: SEALs wearing a mix of ERDL and blue jeans.
" ]];

player createDiaryRecord ["Historical", ["Kit Carson", 
"<br/>During the Vietnam War, the ""Kit Carson"" role was pivotal in enhancing U.S. military operations. Named after the frontiersman Kit Carson, 
this role involved former Viet Cong or North Vietnamese Army (NVA) soldiers who, after defecting or being captured, were recruited to assist 
U.S. forces.<br/><br/>

These Kit Carson Scouts provided valuable intelligence on enemy tactics, terrain, and logistics, significantly improving the effectiveness of 
U.S. operations. They helped with translation and interrogation, offering crucial insights into enemy plans. Additionally, they supported U.S. 
patrols and missions by guiding operations, identifying threats, and navigating the jungle terrain. Their presence also had a psychological 
impact, demonstrating that defectors could become valuable allies and disrupting Viet Cong morale.<br/><br/>

Overall, the Kit Carson Scouts played a key role in shaping U.S. strategies and enhancing operational effectiveness throughout the war.<br/><br/>

<img image='pics\kitcarson.jpg' /><br/><br/>

Above: Kit Carson standing with a M60 machine gun.
" ]];

player createDiaryRecord ["Historical", ["Navy SEALs", 
"<br/>Navy SEALs played a crucial role in the Vietnam War, marking one of their first major combat engagements. Initially deployed in 1962, SEAL Teams One 
and Two began by advising South Vietnamese forces but quickly expanded their role to direct combat missions.<br/><br/>

Known as the ""Men with Green Faces"" due to their use of camouflage paint, SEALs conducted high-risk operations deep behind enemy lines, including 
ambushes, prisoner snatches, and intelligence gathering. Their expertise in small-unit tactics and guerrilla warfare made them highly effective against 
the Viet Cong.<br/><br/>

SEALs were also heavily involved in the Phoenix Program, a controversial CIA-led initiative aimed at dismantling the Viet Cong's political infrastructure 
through targeted assassinations and capturing key leaders. Their operations in the challenging environments of the Mekong Delta and Vietnamese rivers, 
often conducted at night, cemented their reputation as a fearsome and effective force.<br/><br/>

The Vietnam War was a formative experience for the SEALs, shaping their future role in U.S. special operations. Their success in Vietnam, including their 
role in the Phoenix Program, left a lasting legacy on the conduct of special operations worldwide.<br/><br/>

<img image='pics\SEALsfinal.jpg'/><br/><br/>

Above: SEAL Team One (1967).<br/><br/>
" ]];

player createDiaryRecord ["Historical", ["Author Notes", 
"<br/>This history codex showcases the authentic elements incorporated into this historical-fiction Vietnam War era mission.<br/><br/>

As the mission author, I have made every effort to use period-correct equipment, weapons, uniforms, and other relevant elements.<br/><br/>

If you have any feedback please share on the Rankin Bleed Discord. Happy learing and happy gaming! I hope you enjoy my mission.<br/><br/>

Best Regards,
FoxClubNiner
" ]];
