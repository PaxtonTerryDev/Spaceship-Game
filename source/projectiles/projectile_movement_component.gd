class_name ProjectileMovementComponent extends MovementComponent

@export var speed: float = 500.0

@onready var projectile: Projectile = get_projectile()

func get_projectile() -> Projectile:
	return get_parent() as Projectile

func _physics_process(delta: float) -> void:
	projectile.position += projectile.transform.x * speed * delta
