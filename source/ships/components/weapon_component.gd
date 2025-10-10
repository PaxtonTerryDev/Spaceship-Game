class_name WeaponComponent extends ShipComponent

var weapons: Array[Weapon] = []

func _ready() -> void:
	_initialize_weapons_array()

func _initialize_weapons_array() -> void:
	for child in get_children():
		if child is Weapon:
			weapons.append(child)

func fire_active_group() -> void:
	for weapon in weapons:
		weapon.fire()
