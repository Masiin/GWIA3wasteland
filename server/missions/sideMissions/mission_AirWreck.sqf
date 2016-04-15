// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_AirWreck.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev
//	@file Created: 08/12/2012 15:19

if (!isServer) exitwith {};
#include "sideMissionDefines.sqf"

private ["_nbUnits", "_leader", "_wreckPos", "_wreck", "_box1", "_box2", "_createVehicle", "_vehicle", "_vehicleClass"];

_setupVars =
{
	_missionType = "Aircraft Wreck";
	_locationsArray = MissionSpawnMarkers;
	_nbUnits = if (missionDifficultyHard) then { AI_GROUP_LARGE } else { AI_GROUP_MEDIUM };
};

_setupObjects =
{
	_missionPos = markerPos _missionLocation;
	_wreckPos = _missionPos vectorAdd ([[25 + random 20, 0, 0], random 360] call BIS_fnc_rotateVector2D);

	// Class, Position, Fuel, Ammo, Damage, Special
	_wreck = ["O_Heli_Light_02_unarmed_F", _wreckPos, 0, 0, 1] call createMissionVehicle;

	_box1 = createVehicle ["Box_NATO_WpsSpecial_F", _missionPos, [], 5, "None"];
	_box1 setDir random 360;
	[_box1, "mission_USSpecial"] call fn_refillbox;

	_box2 = createVehicle ["Box_East_WpsSpecial_F", _missionPos, [], 5, "None"];
	_box2 setDir random 360;
	[_box2, "mission_USLaunchers"] call fn_refillbox;

	{ _x setVariable ["R3F_LOG_disabled", true, true] } forEach [_box1, _box2];

	_vehicleClass = if (missionDifficultyHard) then
	{
		["B_MRAP_01_hmg_F", "B_MRAP_01_gmg_F"] call BIS_fnc_selectRandom;
	}
	else
	{
		["I_G_Offroad_01_F"] call BIS_fnc_selectRandom;
	};
	
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
			case (_type isKindOf "B_MRAP_01_hmg_F", "B_MRAP_01_gmg_F"):
			{
				_soldier = [_aiGroup, _position] call createRandomSoldier;
				_soldier moveInGunner _vehicle;
			};
		};
		
		[_vehicle, _aiGroup] spawn checkMissionVehicleLock;
		_vehicle
	};
	
	_aiGroup = createGroup CIVILIAN;
	[_aiGroup, _missionPos, _nbUnits] call createCustomGroup;
	
	_aiGroup = createGroup CIVILIAN;
	_vehicle = [_vehicleClass, _missionPos, 0] call _createVehicle;
	
	_aiGroup setCombatMode "RED";  // Units will Fire at Will and Engage at Will
	_aiGroup setBehaviour "COMBAT";  // Units will utilize cover whenever possible
	_aiGroup setFormation "WEDGE";
		
	_missionPicture = getText (configFile >> "CfgVehicles" >> typeOf _wreck >> "picture");
	_missionHintText = "A helicopter has come down under enemy fire!";
};

_waitUntilMarkerPos = nil;
_waitUntilExec = nil;
_waitUntilCondition = nil;

_failedExec =
{
	// Mission failed
	{ deleteVehicle _x } forEach [_box1, _box2, _wreck];
};

_successExec =
{
	// Mission completed
	{ _x setVariable ["R3F_LOG_disabled", false, true] } forEach [_box1, _box2];
	deleteVehicle _wreck;

	_successHintMessage = "The airwreck supplies have been collected, well done.";
};

_this call sideMissionProcessor;
