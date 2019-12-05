/**
                    * ExilelifeClient_system_allowance_gangAllowanceRetrieveRequest
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_result"];
try
{ 
	if (ExileLifeClientAllowanceRequest) then 
	{
		throw false;
	};
	ExileLifeClientAllowanceRequest = true;
	ExileLifeClientGangAllowance = -1;
	if (isNull player) then
	{
		throw false;
	};
	if !(alive player) then
	{
		throw false;
	};	
	if (ExileLifeClientGang isEqualTo "Rogue") then 
	{
		throw false;
	};
	if (ExileLifeClientGang isEqualTo "") then 
	{
		throw false;
	};	
	["gangAllowanceRetrieveRequest",[]] call ExileClient_system_network_send;	
}
catch
{
	_result = _exception;	
};
true
