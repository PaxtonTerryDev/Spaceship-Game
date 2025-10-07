class_name Ship extends RigidBody2D

enum ShipSide {
	STERN,
	BOW,
	PORT,
	STARBOARD
}


@onready var thrusters: ThrusterArray = $ThrusterArray

@onready var thruster_map: Dictionary[ShipSide, Thruster] = {
	ShipSide.STERN: thrusters.stern,
	ShipSide.BOW: thrusters.bow,
	ShipSide.PORT: thrusters.port,
	ShipSide.STARBOARD: thrusters.starboard
}

@onready var thruster_direction: Dictionary[ShipSide, Vector2] = {
	ShipSide.STERN: Vector2.RIGHT,
	ShipSide.BOW: Vector2.LEFT,
	ShipSide.PORT: Vector2.DOWN,
	ShipSide.STARBOARD: Vector2.UP
	}

func engage_thruster(side: ShipSide, strength: float = 1.0) -> void:
	var vector = _rotated_ship_vector(side)
	var force = thruster_map[side].force * strength
	apply_central_force(vector * force)

func _rotated_ship_vector(side: ShipSide) -> Vector2:
	return thruster_direction[side].rotated(rotation);
