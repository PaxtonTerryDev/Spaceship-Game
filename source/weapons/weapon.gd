class_name Weapon extends Node2D

@export var projectile_scene: PackedScene

func fire() -> void:
	var projectile: Projectile = projectile_scene.instantiate()
	projectile.transform = self.global_transform
	BulletPool.add(projectile)
