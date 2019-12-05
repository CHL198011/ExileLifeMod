/**
                    * ExilelifeServer_util_log
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

                    private["_log"];
_log = format["Exile Life Server - %1", _this];
diag_log _log;
[_log,"Server"] call ExileLifeServer_util_A3Log;
[_log,"CYAN",true] call ExileLifeServer_util_consoleLog;
