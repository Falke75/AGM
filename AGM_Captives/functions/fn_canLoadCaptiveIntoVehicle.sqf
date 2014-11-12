// by commy2

private ["_unit", "_target", "_vehicle", "_objects"];

_unit = _this select 0;
_target = _this select 1;
_vehicle = _this select 2;

if (isNull _target) then {
  _objects = attachedObjects _unit;
  _objects = [_objects, {_this getVariable ["AGM_isCaptive", false]}] call AGM_Core_fnc_filter;
  _target = _objects select 0;
};

if (isNull _vehicle) then {
  _objects = nearestObjects [_unit, ["Car_F", "Tank_F", "Helicopter_F"], 10];
  _vehicle = _objects select 0;
};

_unit getVariable ["AGM_isEscorting", false]
&& {count _objects > 0}
&& {!isNull _vehicle}
&& {_vehicle emptyPositions "Cargo" > 0}
&& {!(_vehicle lockedCargo 0)}
