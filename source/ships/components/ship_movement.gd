class_name ShipMovement extends MovementComponent

@onready var ship = get_parent() as Ship

@export var rotation_speed: float = 5.0

var target_rotation: float = 0.0

@onready var thrusters: ThrusterArray = $ThrusterArray

func _physics_process(delta: float) -> void:
	# Gradually rotate towards target rotation
	var angle_diff = angle_difference(ship.rotation, target_rotation)
	var rotation_step = rotation_speed * delta

	if abs(angle_diff) < rotation_step:
		ship.angular_velocity = 0
		ship.rotation = target_rotation
	else:
		ship.angular_velocity = sign(angle_diff) * rotation_speed

func engage_thruster(side: Ship.ShipSide, strength: float = 1.0) -> void:
	var vector = _rotated_ship_vector(side)
	var force = ship.thruster_map[side].force * strength
	ship.apply_central_force(vector * force)

func _rotated_ship_vector(side: Ship.ShipSide) -> Vector2:
	return ship.thruster_direction[side].rotated(ship.rotation);
