class_name PlayerController extends Node

@onready var ship: Ship = get_parent() as Ship

@export var thrust_power: float = 500.0

func _physics_process(_delta: float) -> void:
	# Set target rotation to face mouse
	var mouse_pos = ship.get_global_mouse_position()
	var direction_to_mouse = mouse_pos - ship.global_position
	ship.movement.target_rotation = direction_to_mouse.angle()

	# Stern thrusters - push forward
	if Input.is_action_pressed("ship_stern_thrusters"):
		var action_strength = Input.get_action_strength("ship_stern_thrusters")
		print("Stern thruster engaged: ", action_strength)
		ship.movement.engage_thruster(Ship.ShipSide.STERN, action_strength)

	# Bow thrusters - push backward
	if Input.is_action_pressed("ship_bow_thrusters"):
		var action_strength = Input.get_action_strength("ship_bow_thrusters")
		ship.movement.engage_thruster(Ship.ShipSide.BOW, action_strength)

	# Port thrusters - push right
	if Input.is_action_pressed("ship_port_thrusters"):
		var action_strength = Input.get_action_strength("ship_port_thrusters")
		ship.movement.engage_thruster(Ship.ShipSide.PORT, action_strength)

	# Starboard thrusters - push left
	if Input.is_action_pressed("ship_starboard_thrusters"):
		var action_strength = Input.get_action_strength("ship_starboard_thrusters")
		ship.movement.engage_thruster(Ship.ShipSide.STARBOARD, action_strength)
