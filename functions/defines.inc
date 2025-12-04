/*--------------------------------------------------------------------------------------------------

	SYSTEM SETTINGS

--------------------------------------------------------------------------------------------------*/
#define REVIVE_SIDES						[WEST,EAST,RESISTANCE,CIVILIAN]
#define REVIVE_SIDES_TXT					["West","East","Guer","Civ"]
#define REVIVE_DISTANCE						4
#define REVIVE_DISTANCE_BODY_CENTER			2

//behavior settings
#define REVIVE_MEDIKIT_MULTIPLIER			2		//multiplier acting on revive time if the player has a medikit
#define DEFAULT_REVIVE_TIME					6		//default time (in seconds) that it takes to revive a unit
#define DEFAULT_FORCE_RESPAWN_TIME			3		//default time (in seconds) that it takes to force respawn
#define DEFAULT_BLEEDOUT_TIME				120		//default time (in seconds) that it takes to bleed out

//damage model
#define MAX_SAFE_DAMAGE						0.95

/*--------------------------------------------------------------------------------------------------

	DEATH MESSAGES

--------------------------------------------------------------------------------------------------*/
//kill-feed messages
#define MSG_SECURED							"%1 was secured"
#define MSG_SECURED_BY						"%1 was secured by %2"
#define MSG_INCAPACITATED					(localize "STR_A3_Revive_MSG_INCAPACITATED")				//%1 was incapacitated
#define MSG_INCAPACITATED_BY				(localize "STR_A3_Revive_MSG_INCAPACITATED_BY")				//%1 was incapacitated by %2
#define MSG_INCAPACITATED_BY_FF				(localize "STR_A3_Revive_MSG_INCAPACITATED_BY_FF")			//%1 was incapacitated by %2 (friendly fire)
#define MSG_KILLED							(localize "STR_A3_Revive_MSG_KILLED")						//%1 was killed
#define MSG_KILLED_BY						(localize "STR_A3_Revive_MSG_KILLED_BY")					//%1 was killed by %2
#define MSG_KILLED_BY_FF					(localize "STR_A3_Revive_MSG_KILLED_BY_FF")					//%1 was killed by %2 (friendly fire)
#define MSG_EXECUTED						(localize "STR_A3_Revive_MSG_EXECUTED")						//%1 was executed
#define MSG_EXECUTED_BY						(localize "STR_A3_Revive_MSG_EXECUTED_BY")					//%1 was executed by %2
#define MSG_EXECUTED_BY_FF					(localize "STR_A3_Revive_MSG_EXECUTED_BY_FF")				//%1 was executed by %2 (friendly fire)
#define MSG_REVIVED							(localize "STR_A3_Revive_MSG_REVIVED")						//%1 was revived
#define MSG_REVIVED_BY						(localize "STR_A3_Revive_MSG_REVIVED_BY")					//%1 was revived by %2
#define MSG_FORCED_RESPAWN					(localize "STR_A3_Revive_MSG_FORCED_RESPAWN")				//%1 forced respawn
#define MSG_BLEDOUT							(localize "STR_A3_Revive_MSG_BLEDOUT")						//%1 bled out
#define MSG_DROWNED							(localize "STR_A3_Revive_MSG_DROWNED")						//%1 drowned
#define MSG_DIED							(localize "STR_A3_Revive_MSG_DIED")							//%1 died
#define MSG_SUICIDED						(localize "STR_A3_Revive_MSG_SUICIDED")						//%1 suicided
#define	MSG_NAME_TEMPLATE_AI				(localize "STR_A3_Revive_MSG_NAME_TEMPLATE_AI")				//%1 (AI)

//for everyone
#define DEATH_REASON_UNKNOWN				-1
#define DEATH_REASON_NONE					0
#define DEATH_REASON_EXECUTED				1
#define DEATH_REASON_SUICIDED				2
#define DEATH_REASON_SECURED				3

//for friendlies only (>10)
#define DEATH_REASON_BLEEDOUT				11
#define DEATH_REASON_FORCED_RESPAWN			12
#define DEATH_REASON_DROWNED				13

#define RATING_KILL							200
#define RATING_TEAMKILL						-1000
#define RATING_EXECUTE						-400
#define RATING_REVIVE						RATING_KILL
#define RATING_SECURE						RATING_KILL

/*--------------------------------------------------------------------------------------------------

	REVIVE ALLOW CHECK

--------------------------------------------------------------------------------------------------*/
/*
#define TXT_REQUIRE_MEDIC						"<t color='#ffae00'>Medic</t> Required"
#define TXT_REQUIRE_MEDIKIT						"<t color='#ffae00'>Medikit</t> Required"
#define TXT_REQUIRE_FAK							"<t color='#ffae00'>First Aid Kit</t> Required"
#define TXT_REQUIRE_MEDIKIT_OR_FAK				"<t color='#ffae00'>Medikit</t> or <t color='#ffae00'>First Aid Kit</t> Required"
*/

#define TXT_REQUIRE_MEDIC						"Medic Required"
#define TXT_REQUIRE_MEDIKIT						"Medikit Required"
#define TXT_REQUIRE_FAK							"First Aid Kit Required"
#define TXT_REQUIRE_MEDIKIT_OR_FAK				"Medikit or First Aid Kit Required"

#define TXT_REVIVE_SYSTEM_DISABLED				"Revive System Disabled"
#define TXT_REVIVE_DISABLED						"Revive Disabled"

//target independent (< -10)
#define ALLOW_CHECK_REQUIRE_MEDIC				-13
#define ALLOW_CHECK_REQUIRE_MEDIKIT				-2
#define ALLOW_CHECK_REQUIRE_FAK					-3
#define ALLOW_CHECK_REQUIRE_MEDIKIT_OR_FAK		-4
#define ALLOW_CHECK_REVIVE_SYSTEM_DISABLED		-11
#define ALLOW_CHECK_REVIVE_DISABLED				-12
#define ALLOW_CHECK_NULL						-14			//player is not pointing at the target or player is NULL (?)

//will not consume FAK (> 10)
#define ALLOW_CHECK_OK_USE_FAK					1
#define ALLOW_CHECK_OK							11
#define ALLOW_CHECK_OK_USE_MEDIKIT				12

/*--------------------------------------------------------------------------------------------------

	INIT MODES

--------------------------------------------------------------------------------------------------*/
#define REVIVE_MODE_AUTODETECT					-1	//Revive2 compatability solution
#define REVIVE_MODE_DISABLED					0
#define REVIVE_MODE_ENABLED_ALL_PLAYERS			1
#define REVIVE_MODE_ENABLED_INDIVIDUAL_PLAYERS	2

#define REVIVE_MODE								(missionNamespace getVariable ["bis_revive_mode",REVIVE_MODE_DISABLED])

/*--------------------------------------------------------------------------------------------------

	PLAYER VARIABLE NAMES

--------------------------------------------------------------------------------------------------*/
//unit variable names
#define VAR_REVIVE_ENABLED				"#rev_enabled"

//broadcasted unit variables
#define VAR_TRANSFER_STATE				"#rev"
#define VAR_TRANSFER_FORCING_RESPAWN	"#revF"
#define VAR_TRANSFER_BEING_REVIVED		"#revB"
#define VAR_BLOOD_LEVEL					"#revL"

//local unit variables
#define VAR_STATE						"#rev_state"
#define VAR_STATE_PREV					"#rev_statePrev"

#define VAR_BEING_REVIVED				"#rev_being_revived"
#define VAR_FORCING_RESPAWN				"#rev_forcing_respawn"

#define VAR_DAMAGE						"#rev_damage"
#define VAR_DAMAGE_BLEED				"#rev_bleed"
#define VAR_ACTION_ID_REVIVE			"#rev_actionID_revive"
#define VAR_ACTION_ID_RESPAWN			"#rev_actionID_respawn"
#define VAR_ACTION_ID_SECURE			"#rev_actionID_secure"

#define VAR_CAMERA_VIEW					"#rev_camera"

#define VAR_INCAPACITATED_POS			"#rev_incap_pos"
#define VAR_INCAPACITATED_BACKUPPOS		"#rev_incap_backuppos"
#define VAR_INCAPACITATED_DIR			"#rev_incap_dir"
#define VAR_INCAPACITATED_BODY			"#rev_incap_corpse"

#define AI_PROTECTION_ACTIVATE(unit)	if (!captive unit) then {unit setCaptive true;unit setVariable ["#rev_captiveForced",true];} else {unit setVariable ["#rev_captiveForced",false];}
#define AI_PROTECTION_DEACTIVATE(unit)	if (unit getVariable ["#rev_captiveForced",false]) then {unit setVariable ["#rev_captiveForced",false];unit setCaptive false;}


/*--------------------------------------------------------------------------------------------------

	GENERAL 'QUALITY OF LIFE' MACROS

--------------------------------------------------------------------------------------------------*/
#define GET_UNIT_VAR(unit)				([unit] call bis_fnc_objectVar)
#define GET_UNIT(unitVar)				(missionNamespace getVariable [unitVar,objNull])

#define IN_VEHICLE(unit)				(vehicle unit != unit)

#define ENABLE_REVIVE(unit,state)		(unit setVariable [VAR_REVIVE_ENABLED, state, true])
#define REVIVE_ENABLED(unit)			(unit getVariable [VAR_REVIVE_ENABLED, false])
#define REVIVE_ALLOWED(unit)			([unit] call bis_fnc_reviveAllowed)
#define REVIVE_ALLOWED2(unit,target)	([unit,target] call bis_fnc_reviveAllowed)
#define IS_MP							isMultiplayer

/*--------------------------------------------------------------------------------------------------

	REQUIREMENTS

--------------------------------------------------------------------------------------------------*/
#define CAN_USE_MEDIKIT(unit)			(unit getUnitTrait "Medic" && {items unit findIf {getNumber (configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "type") == 619} >= 0})
#define CAN_USE_MEDIKIT2(unit,target)	(unit getUnitTrait "Medic" && {(items unit findIf {getNumber (configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "type") == 619} >= 0 || {(!isNull target && {items target findIf {getNumber (configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "type") == 619} >= 0})})})
#define CAN_USE_FAK(unit)				(items unit findIf {getNumber (configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "type") == 401} >= 0)
#define CAN_USE_FAK2(unit,target)		(items unit findIf {getNumber (configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "type") == 401} >= 0 || {(!isNull target && {items target findIf {getNumber (configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "type") == 401} >= 0})})

/*--------------------------------------------------------------------------------------------------

	PLAYER ACTION FLAGS

--------------------------------------------------------------------------------------------------*/
#define IS_BEING_REVIVED(unit)					(unit getVariable [VAR_BEING_REVIVED, false])
#define IS_FORCING_RESPAWN(unit)				(unit getVariable [VAR_FORCING_RESPAWN, false])

#define SET_BEING_REVIVED(unit,state)			["",state,unit] call bis_fnc_reviveOnBeingRevived;unit setVariable [VAR_TRANSFER_BEING_REVIVED, state, true]
#define SET_FORCING_RESPAWN(unit,state)			["",state,unit] call bis_fnc_reviveOnForcingRespawn;unit setVariable [VAR_TRANSFER_FORCING_RESPAWN, state, true]

#define SET_BEING_REVIVED_LOCAL(unit,state)		["",state,unit] call bis_fnc_reviveOnBeingRevived;unit setVariable [VAR_TRANSFER_BEING_REVIVED, state]
#define SET_FORCING_RESPAWN_LOCAL(unit,state)	["",state,unit] call bis_fnc_reviveOnForcingRespawn;unit setVariable [VAR_TRANSFER_FORCING_RESPAWN, state]

/*--------------------------------------------------------------------------------------------------

	PLAYER STATES

--------------------------------------------------------------------------------------------------*/
#define STATE_RESPAWNED								0
#define STATE_REVIVED								1
#define STATE_INCAPACITATED							2
#define STATE_DEAD									3

#define GET_STATE_STR(state)						format["%1(%2)",["RESPAWNED","REVIVED","INCAPACITATED","DEAD"] select state,state]

#define SET_STATE(unit,state)						["",state,unit] call bis_fnc_reviveOnState;unit setVariable [VAR_TRANSFER_STATE, state, true]
#define SET_STATE_XTRA(unit,state,source)			["",[state,source],unit] call bis_fnc_reviveOnState;unit setVariable [VAR_TRANSFER_STATE, [state,source], true]
#define SET_STATE_XTRA2(unit,state,source,reason)	["",[state,source,reason],unit] call bis_fnc_reviveOnState;unit setVariable [VAR_TRANSFER_STATE, [state,source,reason], true]

#define GET_STATE(unit)								(unit getVariable [VAR_STATE, STATE_RESPAWNED])
#define IS_DISABLED(unit)							(GET_STATE(unit) == STATE_INCAPACITATED)
#define IS_ACTIVE(unit)								(GET_STATE(unit) < STATE_INCAPACITATED)

/*--------------------------------------------------------------------------------------------------

	ICON STATES

--------------------------------------------------------------------------------------------------*/
#define ICON_STATE_ADD						-1
#define ICON_STATE_REMOVE					-2
#define ICON_STATE_FORCING_RESPAWN			-3
#define ICON_STATE_BEING_REVIVED			-4

#define ICON_STATE_INCAPACITATED			STATE_INCAPACITATED
#define ICON_STATE_DEAD						STATE_DEAD

/*--------------------------------------------------------------------------------------------------

	HOLD ACTION AND 3D ICON TEXTURES

--------------------------------------------------------------------------------------------------*/
#define TEMPLATE_2D(id)						(format["<img size='3.0' shadow='0' color='#ffffff' image='\A3\Ui_f\data\IGUI\Cfg\Revive\overlayIcons\%1_ca.paa'/>",id])
#define TEMPLATE_3D(id)						(format["\A3\Ui_f\data\IGUI\Cfg\Revive\overlayIcons\%1_ca.paa",id])
#define TEMPLATE_3D_GROUP(id)				(format["\A3\Ui_f\data\IGUI\Cfg\Revive\overlayIconsGroup\%1_ca.paa",id])

#define SEQUENCE12_DYING					["u100","u75","u50","d50","d75","d100","d100","d75","d50","u50","u75","u100"]
#define SEQUENCE12_BEING_REVIVED			["u100","u75","u50","r50","r75","r100","r100","r75","r50","u50","u75","u100"]
#define SEQUENCE12_UNCONSCIOUS				["u100","u100","u100","u100","u100","u100","u100","u100","u100","u100","u100","u100"]
#define SEQUENCE12_DEAD						["d100","d100","d100","d100","d100","d100","d100","d100","d100","d100","d100","d100"]
#define SEQUENCE12_FORCING_RESPAWN			["u100","u75","u50","f50","f75","f100","f100","f75","f50","u50","u75","u100"]

#define TEXTURES_2D_DYING					bis_reviveTextures2d_dying
#define TEXTURES_2D_BEING_REVIVED			bis_reviveTextures2d_beingRevived
#define TEXTURES_2D_UNCONSCIOUS				bis_reviveTextures2d_unconscious

#define TEXTURES_3D_DYING					bis_reviveTextures3d_dying
#define TEXTURES_3D_BEING_REVIVED			bis_reviveTextures3d_beingRevived
#define TEXTURES_3D_UNCONSCIOUS				bis_reviveTextures3d_unconscious
#define TEXTURES_3D_DEAD					bis_reviveTextures3d_dead
#define TEXTURES_3D_FORCING_RESPAWN			bis_reviveTextures3d_forcingRespawn

#define TEXTURES_3D_GROUP_DYING				bis_reviveTextures3dGroup_dying
#define TEXTURES_3D_GROUP_BEING_REVIVED		bis_reviveTextures3dGroup_beingRevived
#define TEXTURES_3D_GROUP_UNCONSCIOUS		bis_reviveTextures3dGroup_unconscious
#define TEXTURES_3D_GROUP_DEAD				bis_reviveTextures3dGroup_dead
#define TEXTURES_3D_GROUP_FORCING_RESPAWN	bis_reviveTextures3dGroup_forcingRespawn

/*--------------------------------------------------------------------------------------------------

	ICON SETTINGS

--------------------------------------------------------------------------------------------------*/
//icon values
#define ICON_USERACTION_REVIVE				"\A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_revive_ca.paa"
#define ICON_USERACTION_REVIVE_MEDIC		"\A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_reviveMedic_ca.paa"
#define ICON_USERACTION_RESPAWN				"\A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_forceRespawn_ca.paa"
#define ICON_USERACTION_SECURE				"\A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_secure_ca.paa"

#define ICON_VISIBLE_RANGE 					150		//up to this range icon is at full alpha
#define ICON_VISIBLE_RANGE_MAX 				175		//behind this range icon is not visible
#define ICON_SIZE							1.3
#define ICON_TEXT_SIZE						0.035
#define ICON_ALPHA							0.85

#define VAR_ICON_COLOR						"#rev_icon_color"
#define VAR_ICON_TEXT						"#rev_icon_text"
#define VAR_ICON_IS_ACTIVE					"#rev_icon_isActive"	//used in draw frame code to determine visualization and drawing of side arrows
#define VAR_ICON_IN_GROUP					"#rev_icon_inGroup"		//used in draw frame code to determine if unit is in teh same group as player

#define ICON_COLOR_DISABLED					[0.9,0.9,0.9,ICON_ALPHA]
#define ICON_COLOR_ACTIVE					[1,0.3,0.3,ICON_ALPHA]
#define ICON_COLOR_ACTIVE_ALT				[1,0.6,0.3,ICON_ALPHA]		//used for revive when victim's FAK is used