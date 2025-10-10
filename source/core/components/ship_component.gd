@abstract
class_name ShipComponent extends Node2D

@onready var ship: Ship = _get_ship()

func _get_ship() -> Ship:
	return get_parent() as Ship
