// by commy2

//give spare barrel
_this spawn {
	waitUntil {!isNull (findDisplay 46)};
	if (getNumber (configFile >> "CfgWeapons" >> currentWeapon player >> "AGM_Overheating_allowSwapBarrel") == 1) then {
		player addItem "AGM_SpareBarrel"; 
	};
};

player addEventHandler ["Take", {
	if (_this select 0 == _this select 1 && {isClass (configFile >> "CfgMagazines" >> _this select 2)}) then {
		[vehicle player, currentWeapon vehicle player, true] call AGM_Overheating_fnc_clearJam;
	};
}];
