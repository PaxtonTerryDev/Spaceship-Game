@tool
class_name SpaceObject extends RigidBody2D

const ROTATION_SCALE = 1000

@export var collidable_object: CollidableObject:
	set(new_res):
		_clear_children()
		if new_res == null:
			collidable_object = null
		else:
			collidable_object = new_res
			collidable_object.instantiate_nodes(self)

@export_range(0.0, 100.0) var rotation_speed: float = 50:
	set(new_speed):
		rotation_speed = new_speed
		_scaled_speed = _apply_rotation_scale(rotation_speed)

@onready var _scaled_speed: float = _apply_rotation_scale(rotation_speed)

@export var initial_velocity: Vector2 = Vector2.ZERO
@export var initial_speed: float = 0.0

var _initial_velocity_applied: bool = false

func _ready() -> void:
	linear_damp_mode = DampMode.DAMP_MODE_REPLACE
	linear_damp = 0.0
	angular_damp_mode = DampMode.DAMP_MODE_REPLACE
	angular_damp = 0.0
	gravity_scale = 0.0

	if !Engine.is_editor_hint():
		_apply_initial_velocity()

func _apply_rotation_scale(speed: float) -> float:
	return speed / ROTATION_SCALE

func _apply_initial_velocity() -> void:
	if _initial_velocity_applied:
		return

	if initial_velocity != Vector2.ZERO:
		linear_velocity = initial_velocity.normalized() * initial_speed

	angular_velocity = PI * _scaled_speed
	_initial_velocity_applied = true

func _clear_children() -> void:
	for child in get_children():
		child.queue_free()
