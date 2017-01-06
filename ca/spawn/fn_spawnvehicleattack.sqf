/*
 * Author: Poulern
 * Spawns a vehicle that attacks a location or area.
 *
 * Arguments:
 * 0: F3 group array
 * 1: Spawn position, marker, object, group, location, array
 * 2: Marker, position or location to attack. If marker is type of area, then it will use that instead.
 * 3: Vehicle classname
 * 4: Side, west east independent
 *
 * Return Value:
 * Array of [group,vehicle]
 *
 * Example:
 * [["ftl","r","ar","m"],"spawnmarker","attackmarker","C_Offroad_default_F",independent] call ca_fnc_spawnvehicleattack;
 *
 */
 _ishc = !hasInterface && !isDedicated;
 //Use headless instead?
 if (ca_hc && !_ishc) exitwith {	[_this,_fnc_scriptName] spawn ca_fnc_hcexec;};
 //if no headless, and is player, spawn on server instead
 if (!ca_hc && hasInterface) then {
 	if (!isServer) exitWith {	[_this,_fnc_scriptName] spawn ca_fnc_hcexec;};
 };

params ["_unitarray","_position","_attackposition","_vehicletype",["_side", ca_defaultside]];

private ["_group"];
_grpvehicle = [_unitarray,_position,_vehicletype,_side] call ca_fnc_spawnvehiclegroup;
_group = _grpvehicle select 0;
_posdir = _attackposition call ca_fnc_getdirpos;
_attackpos = _posdir select 0;

if (markerShape _attackmarker ==  "RECTANGLE" || markerShape _attackmarker == "ELLIPSE") then {
  [_group,_attackposition] call CBA_fnc_taskSearchArea;
}else{
  [_group,_attackpos] call CBA_fnc_taskAttack;
};
{
  _x allowFleeing 0;
  _x doMove _attackpos;
  _x setspeedmode "FULL";
  _x setbehaviour "SAFE";
  _x setskill ["spotDistance",0.1];
  _x setskill ["spotTime",0.1];
  _x setskill ["courage",1];
  _x setskill ["commanding",0.1];
  _x setskill ["general",0.1];
} forEach (units _group);

_grpvehicle
