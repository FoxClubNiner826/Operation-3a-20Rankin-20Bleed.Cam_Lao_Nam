/*
    File: fn_conversation.sqf
    Author: NikkoJT (Built for FoxClubNiner by NikkoJT of Arma Discord - Scripting Channel)
    Description:
        Plays a conversation with audio and text and broadcasts it with FoxClub_fnc_Conversation.
*/

params ["_convo", "_speakers", ["_mandatory", false]];

if (missionNamespace getVariable ["minimizeChatter", false] && !_mandatory) exitwith {};

//missionNamespace setVariable ["functionOn", true, true];

{
	_x setVariable ["foxclub_var_isTalking",true];
} forEach _speakers;

private _conversationData = foxclub_var_conversations get _convo;
{
	_x params ["_speakerIndex","_text","_sound", ["_delayAfter", 0], ["_customCode", {}]];
	private _speaker = _speakers select _speakerIndex;
	if (isNull _speaker) then { _speakers spawn _customCode; sleep _delayAfter; continue };
    if !(alive _speaker) then { break };
	_speakers spawn _customCode;
	private _sound = _speaker say3D _sound;
	//_speaker customChat [FOX_DialogueChannel, _text];
	if (!(missionNamespace getVariable ["subtitlesOff", false])) then {
		if (player distance _speaker < 40) then {
			_speaker customChat [FOX_DialogueChannel, _text];
		};
	};
	_speaker setRandomLip true;
	waitUntil {isNull _sound};
	_speaker setRandomLip false;
	sleep _delayAfter;
} forEach _conversationData;

{
	_x setVariable ["foxclub_var_isTalking",false];
} forEach _speakers;

//missionNamespace setVariable ["functionOn", false, true];

//////////////////////////////////////////////////
//                                              //
//          HOW TO USE CONVO FUNCTION           //
//                                              //
//////////////////////////////////////////////////

/* The first index is the name of the subtitle text in init.sqf. This contains the actual text of the subtitle.
The second index is who will be saying the subtitle. This determines things like who gets lip movement, the name tag of the subtitle, etc. 
RemoteExec then broadcasts the function (subtitle) to all players on the server. The proximity determines which clients the function is 
executed on (subtitles, say3d, etc).

Step 1: Place the subtitle to be used in init.sqf:
["keyword reference",
	[
		[_speakerIndex, "text", "soundClass", _delayAfter, { hint "custom code!" }], // first speaker
		[_speakerIndex, "text2", "soundClass2"] // seconds speaker (responding to first speaker)
	]
]

Step 2: Call the function with this format:
["keyword reference",[_speakerUnit0, _speakerUnit1, _speakerUnit2]]
The array of speakers is passed to the custom code when it's executed, contained in variable _this


Examples (place code in action or where ever you want to use it):
1. Example
["convo_8", [_caller, _target]] remoteExec ["foxclub_fnc_conversation"];

2. Example
["convo_10", [_sally, _jim, _annoyingOrange]] remoteExec ["foxclub_fnc_conversation"];

3. To send the subtitle to all the players regardless of proximity:
["name1", [leader playergroup]] remoteExec ["FoxClub_fnc_Conversation"];

4. To send the subtitle to all players withiin 100 meters of the leader of the group:
["name1", [leader playergroup]] remoteExec ["FoxClub_fnc_Conversation", allPlayers select {_x distance leader playergroup <= 100}];
Cannot use `leader player` because it wouldnt work on a dedicated server since `player` doesn't exist. 
This option also wouldn't filter out if the scout is the leader of the group.

5. To send a randomly chosen subtitle to all players regardless of proximity.
[selectRandom ["name1", "name2", "name3"], [leader playergroup]] remoteExec ["FoxClub_fnc_Conversation"];

