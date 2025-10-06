class_name Ship extends RigidBody2D

enum ShipSide {
    STERN,
    BOW,
    PORT,
    STARBOARD
}

@export var ship_thrusters: Dictionary[ShipSide, Thruster] = {
    ShipSide.BOW: Thruster.new(),
    ShipSide.STERN: Thruster.new(),
    ShipSide.PORT: Thruster.new(),
    ShipSide.STARBOARD: Thruster.new(),
}

@export var thruster_force_scale: float = 10.0
@export var thruster_offset: float = 50.0

func _calculate_thruster_force_vector(thruster_side: ShipSide, force_magnitude: float) -> Vector2:
    var force_direction: Vector2

    match thruster_side:
        ShipSide.STERN:
            force_direction = Vector2.UP
        ShipSide.BOW:
            force_direction = Vector2.DOWN
        ShipSide.PORT:
            force_direction = Vector2.RIGHT
        ShipSide.STARBOARD:
            force_direction = Vector2.LEFT

    return force_direction.rotated(rotation) * force_magnitude * thruster_force_scale

func _calculate_thruster_position(thruster_side: ShipSide) -> Vector2:
    var offset_direction: Vector2

    match thruster_side:
        ShipSide.STERN:
            offset_direction = Vector2.DOWN
        ShipSide.BOW:
            offset_direction = Vector2.UP
        ShipSide.PORT:
            offset_direction = Vector2.LEFT
        ShipSide.STARBOARD:
            offset_direction = Vector2.RIGHT

    return offset_direction.rotated(rotation) * thruster_offset

func fire_thruster(thruster_side: ShipSide) -> void:
    var thruster = ship_thrusters[thruster_side]
    if not thruster:
        return

    var force_vector = _calculate_thruster_force_vector(thruster_side, thruster.force)
    var thruster_position = _calculate_thruster_position(thruster_side)

    apply_force(force_vector, thruster_position)

func _input(event: InputEvent) -> void:
    _handle_thruster_input(event)


func _handle_thruster_input(event: InputEvent) -> void:
    if event.is_action("ship_stern_thrusters"):
        if event.is_action_released("ship_stern_thrusters"): return
        fire_thruster(ShipSide.STERN)
    if event.is_action("ship_bow_thrusters"):
        if event.is_action_released("ship_bow_thrusters"): return
        fire_thruster(ShipSide.BOW)
    if event.is_action("ship_port_thrusters"):
        if event.is_action_released("ship_port_thrusters"): return
        fire_thruster(ShipSide.PORT)
    if event.is_action("ship_starboard_thrusters"):
        if event.is_action_released("ship_starboard_thrusters"): return
        fire_thruster(ShipSide.STARBOARD)