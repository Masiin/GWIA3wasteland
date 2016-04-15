// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_StashDefense.sqf
//	@file Author: Masin

if (!isServer) exitwith {};

#include "sideMissionDefines.sqf"

private ["_nbUnits", "_aiGroup1", " _aiGroup2", "_aiGroup3", "_enemy", "_enemyPos", "_box1", "_box2", "_box3", "_box4", "_missionPos", "_fillEvenly", "_defenseVeh1", "_veh1", "_veh2"];

_setupVars =
{
	_missionType = "Stash Defense";
	_nbUnits = if (missionDifficultyHard) then { AI_GROUP_LARGE } else { AI_GROUP_MEDIUM };
	_locationsArray = MissionSpawnMarkers;

	//randomize amount of units
	_nbUnits = _nbUnits + round(random (_nbUnits*0.5));
};

_setupObjects =
{
	_missionPos = markerPos _missionLocation;
	
	//Enemy Spawn Location
	_enemyPos = _missionPos vectorAdd ([[50 + random 50, 0, 0], random 360] call BIS_fnc_rotateVector2D);
	
	//spawn enemy
	_aiGroup1 = createGroup CIVILIAN;
	[_aiGroup1, _missionPos, _nbUnits] call createCustomGroup2;
	
	_aiGroup1 setCombatMode "RED";  // Units will Fire at Will and Engage at Will
	_aiGroup1 setBehaviour "COMBAT";  // Units will utilize cover whenever possible

	// spawn some crates in the middle of the base
	_box1 = createVehicle ["Box_NATO_Wps_F", _missionPos, [], 5, "None"];
	_box1 setDir random 360;
	[_box1, "mission_USSpecial"] call fn_refillbox;

	_box2 = createVehicle ["Box_East_Wps_F", _missionPos, [], 5, "None"];
	_box2 setDir random 360;
	[_box2, "mission_USLaunchers"] call fn_refillbox;
	
	_box3 = createVehicle ["Box_East_Wps_F", _missionPos, [], 5, "None"];
	_box3 setDir random 360;
	[_box3, "mission_Main_A3snipers"] call fn_refillbox;
	
	_box4 = createVehicle ["Box_East_Wps_F", _missionPos, [], 5, "None"];
	_box4 setDir random 360;
	[_box4, "mission_TOP_Gear1"] call fn_refillbox;
	
	{ _x setVariable ["R3F_LOG_disabled", true, true] } forEach [_box1, _box2, _box3, _box4];
	
	// Spawn second wave
	if (count (units _aiGroup1) <1 then;
	
	_defenseVeh1 =
	{
		["I_MRAP_03_gmg_F"];
	};
	
	_veh1 = _defenseVeh1 select 0;
	_veh2 = _defenseVeh1 select 1;
	
	_createVehicle =
	{
		private ["_type", "_position", "_direction", "_vehicle", "_soldier"];
		
		_type = _this select 0;
		_position = _this select 1;
		_direction = _this select 2;

		_vehicle = createVehicle [_type, _position, [], 0, "None"];
		_vehicle setVariable ["R3F_LOG_disabled", true, true];
		[_vehicle] call vehicleSetup;

		_vehicle setDir _direction;
		_aiGroup addVehicle _vehicle;
	
		_soldier = [_aiGroup, _position] call createRandomSoldier;
		_soldier moveInDriver _vehicle;

		switch (true) do
		{
			case (_type isKindOf "I_MRAP_03_gmg_F"):
			{
				_soldier = [_aiGroup, _position] call createRandomSoldier;
				_soldier moveInGunner _vehicle;
			};
		};
		
		[_vehicle, _aiGroup] spawn checkMissionVehicleLock;
		
		_vehicle
	};
	
	_aiGroup2 = createGroup CIVILIAN;
	[_aiGroup2, _enemyPos, _nbUnits] call createCustomGroup2;
	
	_vehicles =
	[
		[_veh1, _starts select 0, _startsDirs select 0] call _createVehicle,
		[_veh2, _starts select 1, _startsDirs select 1] call _createVehicle
	];
	
	_aiGroup2 setCombatMode "RED";
	_aiGroup2 setBehaviour "COMBAT";
	_aiGroup2 setFormation "WEDGE";
	
	_aiGroup2 doMove (position _missionPos);

	_missionHintText = format ["A stash of enemy weapons and gear has been found! Get there and secure it before they escape!];
};
	
_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = nil;

_failedExec =
{
	// Mission failed
	{ deleteVehicle _x } forEach [_box1, _box2, _box3, _box4];
};

_successExec =
{
	// Mission Completed!
	{ _x setVariable ["R3F_LOG_disabled", false, true] } forEach [_box1, _box2, _box3, _box4];
	
	_successHintMessage = format ["Good work! The stash is now yours!];
	//{ deleteVehicle _x } forEach [_tent1, _chair1, _chair2, _cFire1];
};

_this call sideMissionProcessor;
