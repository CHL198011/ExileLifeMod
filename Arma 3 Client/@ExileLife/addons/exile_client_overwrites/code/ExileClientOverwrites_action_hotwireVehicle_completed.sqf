/**
                    * ExileClientOverwrites_action_hotwireVehicle_completed
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

                    ["Lockpick",100] call ExileLifeClient_object_player_skills_updateSkillRequest;
["hotwireLockRequest", [netId _this]] call ExileClient_system_network_send;
