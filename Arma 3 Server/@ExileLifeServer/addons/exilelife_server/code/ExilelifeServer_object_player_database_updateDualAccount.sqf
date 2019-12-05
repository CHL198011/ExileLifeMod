/**
                    * ExilelifeServer_object_player_database_updateDualAccount
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

                    private["_player","_characterSelected","_playerUID","_dataLife","_playerID","_playerPos","_data"];
_player = _this select 0;
_characterSelected = _this select 1;
_playerUID = getplayerUID _player;
_dataLife =
[
	_player getVariable ["ExileName",""],
  	_player getVariable ['ExileLifeClientClass', ""],
  	_player getVariable ["ExileLifeClientRank", 0],
  	_player getVariable ['ExileLifeClientGang', ""],
  	_player getVariable ["ExileLifeSkill:Lockpick", 0],
  	_player getVariable ["ExileLifeSkill:Strength", 0],
  	_player getVariable ["ExileLifeSkill:Speed", 0],
    _player getVariable ["ExileLifeSkill:Heal", 0],
    _player getVariable ["ExileLifeSkill:Repair", 0],
	_playerUID
];
_playerID = _player getVariable["ExileDatabaseID", -1]; 
_playerPos = getPosATL _player;
_data =
[
	_player getVariable ["ExileName",""],
	damage _player,
	_player getVariable ["ExileHunger", 100],
	_player getVariable ["ExileThirst", 100],
	_player getVariable ["ExileAlcohol", 0],
	getOxygenRemaining _player,
	getBleedingRemaining _player,
	_player call ExileClient_util_player_getHitPointMap,
	getDir _player,
	_playerPos select 0,
	_playerPos select 1,
	_playerPos select 2,
	assignedItems _player,
	backpack _player,
	(getItemCargo backpackContainer _player) call ExileClient_util_cargo_getMap,
	(backpackContainer _player) call ExileClient_util_cargo_getMagazineMap,
	(getWeaponCargo backpackContainer _player) call ExileClient_util_cargo_getMap,
	currentWeapon _player,
	goggles _player,
	handgunItems _player,
	handgunWeapon _player,
	headgear _player,
	binocular _player,
	_player call ExileClient_util_inventory_getLoadedMagazinesMap,
	primaryWeapon _player,
	primaryWeaponItems _player,
	secondaryWeapon _player,
	secondaryWeaponItems _player,
	uniform _player,
	(getItemCargo uniformContainer _player) call ExileClient_util_cargo_getMap,
	(uniformContainer _player) call ExileClient_util_cargo_getMagazineMap,
	(getWeaponCargo uniformContainer _player) call ExileClient_util_cargo_getMap,
	vest _player,
	(getItemCargo vestContainer _player) call ExileClient_util_cargo_getMap,
	(vestContainer _player) call ExileClient_util_cargo_getMagazineMap,
	(getWeaponCargo vestContainer _player) call ExileClient_util_cargo_getMap,
	_player getVariable ["ExileTemperature", 0],
	_player getVariable ["ExileWetness", 0],
	_playerUID
];
true
