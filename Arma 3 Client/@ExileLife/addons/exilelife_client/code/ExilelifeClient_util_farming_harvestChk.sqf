/**
                    * ExilelifeClient_util_farming_harvestChk
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

                    private["_result","_plotNumber"];
_result = false;
try
{ 
	if ((player distance ExileClientInteractionObject) > 2) then 
	{
		throw false;
	};
	_plotNumber = ExileClientInteractionObject getVariable['ExileLifePlotNumber',-1];
	if (_plotNumber isEqualto -1) then
	{
		throw false;
	};
	if !(([ExileClientInteractionObject,_plotNumber,5,1] call ExileLifeClient_util_farming_getState) isEqualTo 4) then
	{
		throw false;
	};
	_result = true;
}
catch
{
	_result = _exception;
};
_result
