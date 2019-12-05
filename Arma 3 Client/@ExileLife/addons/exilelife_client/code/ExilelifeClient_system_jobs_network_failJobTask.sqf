/**
                    * ExilelifeClient_system_jobs_network_failJobTask
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_jobClassname","_currentStep","_jobConfig","_getVehicle","_returnVehicle","_text","_display"];
_jobClassname = _this select 0;
ExileLifeParentJobTask setTaskState "Failed";
{
	player removeSimpleTask _x;
}
forEach ExileLifeJobTaskClearQueue;
if !(isNil "ExileLifeCurrentJobTaskMarker") then {
	if !(ExileLifeCurrentJobTaskMarker isEqualTo "") then
	{
		removeMissionEventHandler ["Draw3D",ExileLifeCurrentJobTaskMarker];
	};
};
_currentStep = 0;
if !(ExileLifeCurrentJob isEqualTo []) then
{
	_currentStep = ExileLifeCurrentJob select 1;
};
ExileLifeCurrentJobTask = "";
ExileLifeParentJobTask = "";
ExileLifeCurrentJobTaskMarker = "";
ExileLifeCurrentJob = [];
ExileLifeSelectedJobBoard = [];
ExileLifeJobTaskClearQueue = [];
ExileLifeCurrentJobCanForfeit = true;
ExileLifeParentJobTaskLongDescription = "";
ExileLifeParentJobTaskShortDescription = "";
ExileLifeParentJobTaskShortName = "";
_jobConfig = (configFile >> "CfgJobs" >> _jobClassname);
_getVehicle = getNumber (_jobConfig >> "getVehicle");
_returnVehicle = getNumber (_jobConfig >> "returnVehicle");
if((_currentStep >= _getVehicle) && (_currentStep <=  _returnVehicle)) then {
	_text = getText (_jobConfig >> "failedWithVehicleText");
}else{
	_text = getText (_jobConfig >> "failedText");
};
["Job Failed",_text,10,"red"] spawn ExileLifeClient_gui_baguette_show;
_display = uiNameSpace getVariable ["RscExileXM8",displayNull];
if (!isNull _display) then
{
	if(ExileLifeJobManagmentIsOpen)then{
		ExileLifeJobManagmentIsOpen = false;
		[ExileExtraAppsHomePage, 1] call ExileClient_gui_xm8_slide; 
	};
	[ExileLifeXM8JobThread] call ExileClient_system_thread_removeTask;
};
