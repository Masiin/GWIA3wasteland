// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: customGroup.sqf
//	@file Author: AgentRev

if (!isServer) exitWith {};

private ["_group", "_pos", "_nbUnits", "_unitTypes", "_uPos", "_unit"];

_group = _this select 0;
_pos = _this select 1;
_nbUnits = param [2, 7, [0]];
_radius = param [3, 10, [0]];

_unitTypes =
[
	"C_man_polo_1_F", "C_man_polo_1_F_euro", "C_man_polo_1_F_afro", "C_man_polo_1_F_asia",
	"C_man_polo_2_F", "C_man_polo_2_F_euro", "C_man_polo_2_F_afro", "C_man_polo_2_F_asia",
	"C_man_polo_3_F", "C_man_polo_3_F_euro", "C_man_polo_3_F_afro", "C_man_polo_3_F_asia",
	"C_man_polo_4_F", "C_man_polo_4_F_euro", "C_man_polo_4_F_afro", "C_man_polo_4_F_asia",
	"C_man_polo_5_F", "C_man_polo_5_F_euro", "C_man_polo_5_F_afro", "C_man_polo_5_F_asia",
	"C_man_polo_6_F", "C_man_polo_6_F_euro", "C_man_polo_6_F_afro", "C_man_polo_6_F_asia"
];

for "_i" from 1 to _nbUnits do
{
	_uPos = _pos vectorAdd ([[random _radius, 0, 0], random 360] call BIS_fnc_rotateVector2D);
	_unit = _group createUnit [_unitTypes call BIS_fnc_selectRandom, _uPos, [], 0, "Form"];
	_unit setPosATL _uPos;

	removeAllWeapons _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	
	switch (true) do
	{
		// Grenadier every 3 units
		case (_i % 3 == 0):
		{
			_unit addUniform "U_B_CombatUniform_mcam_vest";
			_unit addHeadgear "H_HelmetB_black";
			_unit addVest "V_BandollierB_rgr";
			_unit addBackpack "B_Kitbag_rgr";
			_unit addMagazine "30Rnd_65x39_caseless_mag";
			_unit addMagazine "3Rnd_HE_Grenade_shell";
			_unit addWeapon "arifle_MX_GL_Hamr_pointer_F";
			_unit addMagazine "30Rnd_65x39_caseless_mag";
			_unit addMagazine "30Rnd_65x39_caseless_mag";
			_unit addMagazine "3Rnd_HE_Grenade_shell";
			_unit addMagazine "3Rnd_HE_Grenade_shell";
			_unit addMagazine "3Rnd_HE_Grenade_shell";
			_unit addMagazine "3Rnd_HE_Grenade_shell";
			_unit addMagazine "RPG32_F";
			_unit addWeapon "launch_RPG32_F";
			
		};
		// LMG every 4 units
		case (_i % 4 == 0):
		{
			_unit addUniform "U_B_CombatUniform_mcam_tshirt";
			_unit addHeadgear "H_RacingHelmet_2_F";
			_unit addVest "V_PlateCarrier1_blk";
			_unit addBackpack "B_Kitbag_mcamo";
			_unit addMagazine "150Rnd_762x54_Box";
			_unit addWeapon "LMG_Zafir_F";
			_unit addPrimaryWeaponItem "optic_Holosight";
			_unit addMagazine "150Rnd_762x54_Box";
			_unit addMagazine "150Rnd_762x54_Box";
		};
		// RPG every 7 units, starting from second one
		case ((_i + 5) % 7 == 0):
		{
			_unit addUniform "U_B_CombatUniform_mcam_tshirt";
			_unit addHeadgear "H_HelmetB_black";
			_unit addVest "V_PlateCarrier1_blk";
			_unit addBackpack "B_Kitbag_mcamo";
			_unit addMagazine "30Rnd_65x39_caseless_mag";
			_unit addWeapon "arifle_MXM_Black_F";
			_unit addPrimaryWeaponItem "optic_Aco";
			_unit addPrimaryWeaponItem "muzzle_snds_H";
			_unit addMagazine "Titan_AA";
			_unit addWeapon "launch_Titan_F";
			_unit addMagazine "Titan_AA";
			_unit addMagazine "Titan_AA";
			_unit addMagazine "30Rnd_65x39_caseless_mag";
			_unit addMagazine "30Rnd_65x39_caseless_mag";
		};
		// Rifleman
		default
		{
			_unit addUniform "U_B_CombatUniform_mcam";
			_unit addHeadgear "H_HelmetB_black";

			if (_unit == leader _group) then
			{
				_unit addMagazine "10Rnd_338_Mag";
				_unit addWeapon "srifle_DMR_02_F";
				_unit addPrimaryWeaponItem "optic_AMS";
				_unit addPrimaryWeaponItem "muzzle_snds_338_black";
				_unit addVest "V_PlateCarrier1_blk";
				_unit addMagazine "10Rnd_338_Mag";
				_unit addMagazine "10Rnd_338_Mag";
				_unit addMagazine "10Rnd_338_Mag";
				_unit setRank "SERGEANT";
			}
			else
			{
				_unit addMagazine "20Rnd_762x51_Mag";
				_unit addWeapon "srifle_DMR_06_camo_F";
				_unit addPrimaryWeaponItem "optic_Arco";
				_unit addVest "V_PlateCarrier1_blk";
				_unit addBackpack "B_Kitbag_rgr";
				_unit addMagazine "20Rnd_762x51_Mag";
				_unit addMagazine "20Rnd_762x51_Mag";
				_unit addMagazine "20Rnd_762x51_Mag";
				_unit addMagazine "RPG32_F";
				_unit addWeapon "launch_RPG32_F";
			};
		};
	};

	_unit addPrimaryWeaponItem "acc_flashlight";
	_unit enablegunlights "forceOn";

	_unit addRating 1e11;
	_unit spawn addMilCap;
	_unit spawn refillPrimaryAmmo;
	_unit call setMissionSkill;
	_unit addEventHandler ["Killed", server_playerDied];
};

[_group, _pos] call defendArea;
