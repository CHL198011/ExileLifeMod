/**
                    * ExilelifeClient_gui_xm8_slide_criminalHistoryUpdate_event_onSubmitButtonClick
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_display","_configPermissions","_notepadCtrl"];
disableSerialization;
_display = uiNameSpace getVariable ["RscExileXM8", displayNull];
_configPermissions = missionConfigFile >> "CfgPlayer" >> "CfgExileLifeClasses" >> ExileLifeClientGang >> "Permissions";
if !(ExileLifeClientRank in (getArray(_configPermissions >> "setRecords"))) exitWith {};
_notepadCtrl = _display displayCtrl 5326;
ExileLifeInfraction set [4, (ctrlText _notepadCtrl)];
call ExileLifeClient_system_PrisonRecords_updatePrisonerRecords;
[ExileExtraAppsHomePage, 1] call ExileClient_gui_xm8_slide;
