class_name Ship extends RigidBody2D

enum ShipSide {
	STERN,
	BOW,
	PORT,
	STARBOARD
}

@onready var movement_component: ShipMovement = $ShipMovement
@onready var thrusters: ThrusterArray = $ThrusterArray
@onready var weapon_component: WeaponComponent = $WeaponComponent

@onready var thruster_map: Dictionary[Ship.ShipSide, Thruster] = {
	Ship.ShipSide.STERN: thrusters.stern,
	Ship.ShipSide.BOW: thrusters.bow,
	Ship.ShipSide.PORT: thrusters.port,
	Ship.ShipSide.STARBOARD: thrusters.starboard
}

@onready var thruster_direction: Dictionary[Ship.ShipSide, Vector2] = {
	Ship.ShipSide.STERN: Vector2.RIGHT,
	Ship.ShipSide.BOW: Vector2.LEFT,
	Ship.ShipSide.PORT: Vector2.DOWN,
	Ship.ShipSide.STARBOARD: Vector2.UP
	}
