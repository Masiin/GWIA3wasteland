//	@file Version: 1.0
//	@file Name: midGroup.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev
//	@file Created: 08/12/2012 21:58
//	@file Args:

if (!isServer) exitWith {};

private ["_group", "_pos", "_leader", "_man2", "_man3", "_man4", "_man5", "_man6", "_man7", "_man8", "_man9", "_man10"];

_group = _this select 0;
_pos = _this select 1;
_nbUnits = param [2, 7, [0]];
_radius = param [3, 10, [0]];

// Leader
_leader = _group createUnit ["C_man_polo_1_F", [(_pos select 0) + 10, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _leader;
sleep 0.1; // Without this delay, headgear doesn't get removed properly
_leader addUniform "U_IG_leader";
_leader addVest "V_PlateCarrierGL_blk";
_leader addItemToVest "FirstAidKit";
_leader addBackpack "B_Carryall_khk";
_leader addMagazine "150Rnd_93x64_Mag";
_leader addWeapon "MMG_01_tan_F";
_leader addPrimaryWeaponItem "optic_Arco";
_leader addPrimaryWeaponItem "muzzle_snds_93mmg";
_leader addMagazine "150Rnd_93x64_Mag";
_leader addMagazine "150Rnd_93x64_Mag";
_leader addHeadgear "H_Beret_Colonel";
_leader addPrimaryWeaponItem "acc_flashlight";
_leader enablegunlights "forceOn";		
_leader call setMissionSkill;
_leader addRating 1e11;
_leader addEventHandler ["Killed", server_playerDied];


// Soldier2
_man2 = _group createUnit ["C_man_polo_2_F", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
removeAllAssignedItems _man2;
sleep 0.1; // Without this delay, headgear doesn't get removed properly
_man2 addUniform "U_BG_Guerilla1_1";
_man2 addVest "V_PlateCarrier2_rgr";
_man2 addItemToVest "FirstAidKit";
_man2 addBackpack "B_FieldPack_ocamo";
_man2 addMagazine "150Rnd_762x54_Box";
_man2 addWeapon "LMG_Zafir_F";
_man2 addMagazine "150Rnd_762x54_Box";
_man2 addMagazine "150Rnd_762x54_Box";
_man2 addHeadgear "H_HelmetB_light_black";
_man2 addGoggles "G_Balaclava_blk";
_man2 addPrimaryWeaponItem "acc_flashlight";
_man2 enablegunlights "forceOn";		
_man2 call setMissionSkill;
_man2 addRating 1e11;
_man2 addEventHandler ["Killed", server_playerDied];


// Soldier3
_man3 = _group createUnit ["C_man_polo_3_F", [_pos select 0, (_pos select 1) + 30, 0], [], 1, "Form"];
removeAllAssignedItems _man3;
sleep 0.1; // Without this delay, headgear doesn't get removed properly
_man3 addUniform "U_IG_Guerilla3_2";
_man3 addVest "V_TacVest_camo";
_man3 addBackpack "B_FieldPack_ocamo";
_man3 addItemToVest "FirstAidKit";
_man3 addMagazine "150Rnd_762x54_Box";
_man3 addWeapon "LMG_Zafir_F";
_man3 addMagazine "150Rnd_762x54_Box";
_man3 addMagazine "150Rnd_762x54_Box";
_man3 addHeadgear "H_HelmetB_light_black";
_man3 addGoggles "G_Balaclava_blk";
_man3 addPrimaryWeaponItem "acc_flashlight";
_man3 enablegunlights "forceOn";		
_man3 call setMissionSkill;
_man3 addRating 1e11;
_man3 addEventHandler ["Killed", server_playerDied];


// Soldier4
_man4 = _group createUnit ["C_man_polo_4_F", [_pos select 0, (_pos select 1) + 40, 0], [], 1, "Form"];
removeAllAssignedItems _man4;
sleep 0.1; // Without this delay, headgear doesn't get removed properly
_man4 addUniform "U_BG_Guerilla2_1";
_man4 addVest "V_TacVest_camo";
_man4 addBackpack "B_FieldPack_ocamo";
_man4 addItemToVest "FirstAidKit";
_man4 addMagazine "20Rnd_762x51_Mag";
_man4 addWeapon "srifle_DMR_06_olive_F";
_man4 addPrimaryWeaponItem "optic_Hamr";
_man4 addPrimaryWeaponItem "muzzle_snds_M";
_man4 addMagazine "20Rnd_762x51_Mag";
_man4 addMagazine "20Rnd_762x51_Mag";
_man4 addHeadgear "H_HelmetB_light_black";
_man4 addGoggles "G_Balaclava_blk";
_man4 addPrimaryWeaponItem "acc_flashlight";
_man4 enablegunlights "forceOn";		
_man4 call setMissionSkill;
_man4 addRating 1e11;
_man4 addEventHandler ["Killed", server_playerDied];


// Soldier5
_man5 = _group createUnit ["C_man_polo_5_F", [_pos select 0, (_pos select 1) + 40, 0], [], 1, "Form"];
sleep 0.1; // Without this delay, headgear doesn't get removed properly
removeAllAssignedItems _man5;
_man5 addUniform "U_BG_Guerilla3_2";
_man5 addVest "V_TacVest_camo";
_man5 addBackpack "B_FieldPack_ocamo";
_man5 addItemToVest "FirstAidKit";
_man5 addMagazine "20Rnd_762x51_Mag";
_man5 addWeapon "srifle_DMR_06_olive_F";
_man5 addPrimaryWeaponItem "optic_Hamr";
_man5 addPrimaryWeaponItem "muzzle_snds_M";
_man5 addMagazine "20Rnd_762x51_Mag";
_man5 addMagazine "20Rnd_762x51_Mag";
_man5 addHeadgear "H_HelmetB_light_black";
_man5 addGoggles "G_Balaclava_blk";
_man5 addPrimaryWeaponItem "acc_flashlight";
_man5 enablegunlights "forceOn";		
_man5 call setMissionSkill;
_man5 addRating 1e11;
_man5 addEventHandler ["Killed", server_playerDied];


// Soldier6
_man6 = _group createUnit ["C_man_polo_4_F", [_pos select 0, (_pos select 1) - 30, 0], [], 1, "Form"];
sleep 0.1; // Without this delay, headgear doesn't get removed properly
removeAllAssignedItems _man6;
_man6 addUniform "U_BG_Guerilla3_1";
_man6 addVest "V_TacVest_camo";
_man6 addBackpack "B_FieldPack_ocamo";
_man6 addItemToBackpack "10Rnd_127x54_Mag";
_man6 addItemToVest "FirstAidKit";
_man6 addWeapon "srifle_DMR_04_F";
_man6 addPrimaryWeaponItem "optic_Hamr";
_man6 addMagazine "10Rnd_127x54_Mag";
_man6 addMagazine "10Rnd_127x54_Mag";
_man6 addHeadgear "H_HelmetB_light_black";
_man6 addGoggles "G_Balaclava_blk";
_man6 addPrimaryWeaponItem "acc_flashlight";
_man6 enablegunlights "forceOn";		
_man6 call setMissionSkill;
_man6 addRating 1e11;
_man6 addEventHandler ["Killed", server_playerDied];

// Soldier7
_man7 = _group createUnit ["C_man_polo_4_F", [_pos select 0, (_pos select 1) - 30, 0], [], 1, "Form"];
sleep 0.1; // Without this delay, headgear doesn't get removed properly
removeAllAssignedItems _man7;
_man7 addUniform "U_BG_Guerilla3_1";
_man7 addVest "V_TacVest_camo";
_man7 addBackpack "B_FieldPack_ocamo";
_man7 addMagazine "200Rnd_65x39_cased_Box";
_man7 addItemToVest "FirstAidKit";
_man7 addWeapon "LMG_Mk200_BI_F";
_man7 addPrimaryWeaponItem "muzzle_snds_H_MG";
_man7 addPrimaryWeaponItem "optic_MRCO";
_man7 addMagazine "200Rnd_65x39_cased_Box";
_man7 addMagazine "200Rnd_65x39_cased_Box";
_man7 addHeadgear "H_HelmetB_light_black";
_man7 addGoggles "G_Balaclava_blk";
_man7 addPrimaryWeaponItem "acc_flashlight";
_man7 enablegunlights "forceOn";		
_man7 call setMissionSkill;
_man7 addRating 1e11;
_man7 addEventHandler ["Killed", server_playerDied];



// Soldier8
_man8 = _group createUnit ["C_man_polo_4_F", [_pos select 0, (_pos select 1) - 30, 0], [], 1, "Form"];
sleep 0.1; // Without this delay, headgear doesn't get removed properly
removeAllAssignedItems _man8;
_man8 addUniform "U_OG_Guerilla3_2";
_man8 addVest "V_TacVest_camo";
_man8 addBackpack "B_FieldPack_ocamo";
_man8 addMagazine "200Rnd_65x39_cased_Box";
_man8 addItemToVest "FirstAidKit";
_man8 addWeapon "LMG_Mk200_BI_F";
_man8 addPrimaryWeaponItem "muzzle_snds_H_MG";
_man8 addPrimaryWeaponItem "optic_MRCO";
_man8 addMagazine "200Rnd_65x39_cased_Box";
_man8 addMagazine "200Rnd_65x39_cased_Box";
_man8 addHeadgear "H_HelmetB_light_black";
_man8 addGoggles "G_Balaclava_blk";
_man8 addPrimaryWeaponItem "acc_flashlight";
_man8 enablegunlights "forceOn";		
_man8 call setMissionSkill;
_man8 addRating 1e11;
_man8 addEventHandler ["Killed", server_playerDied];

// Soldier9
_man9 = _group createUnit ["C_man_polo_4_F", [_pos select 0, (_pos select 1) - 30, 0], [], 1, "Form"];
sleep 0.1; // Without this delay, headgear doesn't get removed properly
removeAllAssignedItems _man9;
_man9 addUniform "U_OG_Guerilla3_2";
_man9 addVest "V_TacVest_camo";
_man9 addBackpack "B_FieldPack_ocamo";
_man9 addItemToBackpack "1Rnd_HE_Grenade_shell";
_man9 addItemToBackpack "1Rnd_HE_Grenade_shell";
_man9 addItemToVest "FirstAidKit";
_man9 addWeapon "arifle_Katiba_GL_F";
_man9 addPrimaryWeaponItem "optic_Hamr";
_man9 addPrimaryWeaponItem "muzzle_snds_H";
_man9 addMagazine "30Rnd_65x39_caseless_green";
_man9 addMagazine "30Rnd_65x39_caseless_green";
_man9 addHeadgear "H_HelmetB_light_black";
_man9 addGoggles "G_Balaclava_blk";
_man9 addPrimaryWeaponItem "acc_flashlight";
_man9 enablegunlights "forceOn";		
_man9 call setMissionSkill;
_man9 addRating 1e11;
_man9 addEventHandler ["Killed", server_playerDied];

// Soldier10
_man10 = _group createUnit ["C_man_polo_4_F", [_pos select 0, (_pos select 1) - 30, 0], [], 1, "Form"];
sleep 0.1; // Without this delay, headgear doesn't get removed properly
removeAllAssignedItems _man10;
_man10 addUniform "U_OG_Guerilla2_3";
_man10 addVest "V_TacVest_camo";
_man10 addBackpack "B_FieldPack_ocamo";
_man10 addItemToVest "FirstAidKit";
_man10 addMagazine "20Rnd_762x51_Mag";
_man10 addWeapon "srifle_DMR_03_F";
_man10 addPrimaryWeaponItem "optic_Hamr";
_man10 addMagazine "20Rnd_762x51_Mag";
_man10 addMagazine "20Rnd_762x51_Mag";
_man10 addMagazine "20Rnd_762x51_Mag";
_man10 addHeadgear "H_HelmetB_light_black";
_man10 addGoggles "G_Balaclava_blk";
_man10 addPrimaryWeaponItem "acc_flashlight";
_man10 enablegunlights "forceOn";		
_man10 call setMissionSkill;
_man10 addRating 1e11;
_man10 addEventHandler ["Killed", server_playerDied];

_leader = leader _group;
// [_group, _pos] call defendArea;