/**
                    * ExilelifeServer_system_allowance_network_gangAllowanceRetrieveRequest
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

                    private["_sessionID","_player","_playersGang","_playerID","_playerGangAllowanceToCollect"];
_sessionID = _this select 0;
try
{
    _player = _sessionID call ExileServer_system_session_getPlayerObject;
    if (isNull _player) then
    {
        throw false;
    };
	if !(alive _player) then
	{
		throw false;
	};
	_playersGang = _player getVariable ['ExileLifeClientGang', ""];
	if (_playersGang isEqualTo "Rogue") then
	{
		throw false;
	};
	if (_playersGang isEqualTo "") then
	{
		throw false;
	};
	_playerID = _player getVariable ["ExileLifePID", -1];
	_playerGangAllowanceToCollect = format["getPlayersGangAllowance:%1",_playerID] call ExileServer_system_database_query_selectSingleField;
	[_sessionID, "gangAllowanceRetrieveResponse", [_playerGangAllowanceToCollect,true]] call ExileServer_system_network_send_to;
;
}
catch
{
		[_sessionID, "gangAllowanceRetrieveResponse", [-1,_exception]] call ExileServer_system_network_send_to;
};