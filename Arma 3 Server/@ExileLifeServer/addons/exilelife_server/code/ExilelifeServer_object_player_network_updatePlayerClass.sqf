/**
                    * ExilelifeServer_object_player_network_updatePlayerClass
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

                    private["_sessionID","_parameters","_requestingPlayer","_spawnPlayerSelectedClass","_playerUID","_PlayerID"];
_sessionID = _this select 0;
_parameters = _this select 1;
_requestingPlayer = _sessionID call ExileServer_system_session_getPlayerObject;
try
{
	if (isNull _requestingPlayer) then
	{
		throw format ["Session %1 requested a bambi character, but doesn't have a player object. Hacker or Monday?", _sessionID];
	};
	_spawnPlayerSelectedClass = _parameters select 0;
	_playerUID = getPlayerUID _requestingPlayer;
	_PlayerID = _requestingPlayer getVariable ["ExileLifePID", -1];
	if(_playerUID isEqualTo "")then
	{
		throw format ["Player: '%1' has no player UID. Arma/Steam Sucks!.",name _requestingPlayer];
	};
	_requestingPlayer setVariable ['ExileLifeClientClass', _spawnPlayerSelectedClass];
	format["updateplayerclass:%1:%2", _requestingPlayer getVariable ['ExileLifeClientClass', "SomethingWentWrong"], _PlayerID] call ExileServer_system_database_query_insertSingle;
}
catch
{
	_exception call ExileServer_util_log;
};
