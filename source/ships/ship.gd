class_name Ship extends CharacterBody2D

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

@export var ship_mass: float = 100
@export var angular_drag: float = 0.98
@export var linear_drag: float = 0.99

var angular_velocity: float = 0.0

func fire_thruster(thruster: Thruster) -> void:
    # Todo - implement thruster logic. Depending on the position, should add force to the ship in the opposite direction of the thruster
    print("Thruster fired: %s" % thruster.position)


func _input(event: InputEvent) -> void:
    _handle_thruster_input(event)


func _handle_thruster_input(event: InputEvent) -> void:
    if event.is_action("ship_stern_thrusters"):
        if event.is_action_released("ship_stern_thrusters"): return
        fire_thruster(ship_thrusters[ShipSide.STERN])
    if event.is_action("ship_bow_thrusters"):
        if event.is_action_released("ship_bow_thrusters"): return
        fire_thruster(ship_thrusters[ShipSide.BOW])
    if event.is_action("ship_port_thrusters"):
        if event.is_action_released("ship_port_thrusters"): return
        fire_thruster(ship_thrusters[ShipSide.PORT])
    if event.is_action("ship_starboard_thrusters"):
        if event.is_action_released("ship_starboard_thrusters"): return
        fire_thruster(ship_thrusters[ShipSide.STARBOARD])