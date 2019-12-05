/**
                    * ExilelifeServer_util_messaging_buildMessageList
                    *
                    * Exile Mod
                    * www.exilemod.com
                    * © 2016 Exile Mod Team
                    *
                    * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
                    * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
                    * 
                    * Permission granted to ExileLife Dev Team to overwrite files and redistribute them
                    *
                    */

                    private["_player","_messages","_msg"];
_player = _this;
_messages = [];
{
	_msg = _x call ExileLifeServer_util_messaging_buildMessage;
	if !(isNil "_msg") then
	{
		_messages pushBack (_x call ExileLifeServer_util_messaging_buildMessage);
	};
} forEach (_player getVariable["ExileLifeMessages",[]]);
_messages
