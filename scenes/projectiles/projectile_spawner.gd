class_name ProjectileSpawner extends Marker2D

@export var projectile_scene: PackedScene
#@onready var projectile: Projectile = projectile_scene.instantiate()

@export var speed: int = 750

func  _physics_process(delta: float) -> void:
	position += transform.x * speed * delta


func spawn() -> void:
	var projectile = projectile_scene.instantiate()
	owner.add_child(projectile)
	projectile.transform = self.global_transform
