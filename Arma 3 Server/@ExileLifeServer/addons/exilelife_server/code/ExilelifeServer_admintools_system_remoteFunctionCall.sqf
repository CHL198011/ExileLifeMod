/**
                    * ExilelifeServer_admintools_system_remoteFunctionCall
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

                    private["_code","_function","_target"];
params [["_code",""],["_function",""],["_target",-2]];
if !(_code isEqualTo "" || _code isEqualTo {}) then
{
    _code remoteExecCall [_function,_target];
};
