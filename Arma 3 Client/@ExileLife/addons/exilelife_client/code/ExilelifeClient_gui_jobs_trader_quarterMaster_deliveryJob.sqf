/**
                    * ExilelifeClient_gui_jobs_trader_quarterMaster_deliveryJob
                    *
                    * ExileLife Mod
                    * www.exilelifemod.com
                    * © 2016 ExileLife Mod Team
                    *
                    * All Rights Reserved 
                    *
                    */

                    private["_dialogName","_scene","_button","_disabled","_display","_idc","_baseText","_text","_extra","_extraButton"];
disableSerialization;
_dialogName = _this select 0;
_scene = _this select 1;
_button = _this select 2;
_disabled = false;
if (ExileLifeCurrentJob isEqualTo []) exitWith {};
_display = uiNameSpace getVariable ["RscExileLifeInformation",displayNull];
(_display displayCtrl 16111) ctrlShow false;
(_display displayCtrl 16113) ctrlShow false;
(_display displayCtrl 16114) ctrlShow false;
_idc = _display displayCtrl 16105;
if (ExileLifeCurrentJob select 1==0) then 
{
    _baseText = getText(configFile >> "CfgDialogs" >> _dialogName >> "Main" >> _scene >> _button >> "body");
    _text = parseText format
    [
        "%1",   _baseText
    ];
}
else
{
    _baseText = getText(configFile >> "CfgDialogs" >> _dialogName >> "Main" >> _scene >> _button >> "body2");
    _text = parseText format
    [
        "%1",    _baseText
    ];
};
_idc ctrlSetStructuredText _text;
_idc call BIS_fnc_ctrlTextHeight;
_extra = configFile >> "CfgDialogs" >> _dialogName >> "Main" >> _scene >> _button >> "extraButton";
if !(getText(_extra) isEqualTo "") then
{
    _extraButton = configFile >> "CfgDialogs" >> _dialogName >> "Extras" >> (getText _extra);
    if (isClass (_extraButton)) then
    {
        if (ExileLifeCurrentJob select 1==0) then 
        {
            _idc = _display displayCtrl 16111;
            _idc ctrlSetText getText(_extraButton >> "name");
            _idc ctrlRemoveAllEventHandlers "ButtonClick";
            _idc ctrlAddEventHandler ["ButtonClick",format["(_this select 0) ctrlEnable false; %1",getText(_extraButton >> "action")]];
            _idc ctrlShow true;
        }
        else
        {
            _idc = _display displayCtrl 16111;
            _idc ctrlSetText "Deliver";
            _idc ctrlRemoveAllEventHandlers "ButtonClick";
            _idc ctrlAddEventHandler ["ButtonClick",format["(_this select 0) ctrlEnable false; %1",getText(_extraButton >> "action")]];
            _idc ctrlShow true;
        };
    };
};
true
