class_name Projectile extends Area2D

@onready var movement_component: ProjectileMovementComponent = $MovementComponent
@onready var sprite: Sprite2D = $Sprite
@onready var collision: CollisionShape2D = $Collision
