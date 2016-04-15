// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: fn_refilltruck.sqf
//	@file Author: AgentRev
//	@file Created: 30/06/2013 15:28

if (!isServer) exitWith {};

#define RANDOM_BETWEEN(START,END) (START + floor random ((END - START) + 1))

private ["_truck", "_truckItems", "_item", "_qty", "_mag"];
_truck = _this;

// Clear prexisting cargo first
clearMagazineCargoGlobal _truck;
clearWeaponCargoGlobal _truck;
clearItemCargoGlobal _truck;

// Item type, Item, # of items, # of magazines per weapon
_truckItems =
[
	["wep", ["Rangefinder", "Laserdesignator"], RANDOM_BETWEEN(0,2)],
	["itm", "Medikit", RANDOM_BETWEEN(1,3)],
	["itm", "Toolkit", RANDOM_BETWEEN(0,1)],
	["itm", "I_UavTerminal", RANDOM_BETWEEN (0,1)],
	["itm", ["V_PlateCarrierGL_blk", "V_PlateCarrierGL_mtp", "V_PlateCarrierSpec_blk"], RANDOM_BETWEEN(0,2)],
	["itm", ["B_Carryall_khk", "B_Carryall_mcamo", "B_Carryall_oucamo"], RANDOM_BETWEEN(0,2)],
	["itm", ["muzzle_snds_M", "muzzle_snds_H", "muzzle_snds_H_MG", "muzzle_snds_B", "muzzle_snds_acp"], RANDOM_BETWEEN(0,3)],
	["itm", ["optic_Aco", "optic_ACO_grn", "optic_MRCO", "optic_Hamr", "optic_Arco"], RANDOM_BETWEEN(2,4)],
	["wep", ["arifle_MX_SW_Black_F", "arifle_MXM_RCO_pointer_snds_F"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(3,5)],
	["wep", ["srifle_DMR_02_F", "srifle_DMR_03_F", "srifle_DMR_05_blk_F", "srifle_DMR_04_F"], RANDOM_BETWEEN(2,5), RANDOM_BETWEEN(4,5)],
	["mag", "150Rnd_93x64_Mag", RANDOM_BETWEEN(3,6)],
	["mag", "10Rnd_127x54_Mag", RANDOM_BETWEEN(3,6)],
	["mag", "20Rnd_762x51_Mag", RANDOM_BETWEEN(8,13)],
	["mag", "130Rnd_338_Mag", RANDOM_BETWEEN(3,6)],
	["wep", ["srifle_GM6_LRPS_F", "srifle_LRR_LRPS_F"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(4,6)],
	["wep", ["MMG_02_sand_F", "MMG_01_tan_F"], RANDOM_BETWEEN(0,2)],
	["wep", ["launch_Titan_F", "launch_Titan_short_F"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(1,2)],
	["mag", "HandGrenade", RANDOM_BETWEEN(0,5)],
	["itm", "optic_Nightstalker", RANDOM_BETWEEN(0,1)],
	["mag", ["APERSTripMine_Wire_Mag", "APERSBoundingMine_Range_Mag", "SLAMDirectionalMine_Wire_Mag", "ATMine_Range_Mag"], RANDOM_BETWEEN(2,6)]
];

[_truck, _truckItems] call processItems;
