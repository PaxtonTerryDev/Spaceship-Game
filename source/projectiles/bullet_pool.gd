extends Node

const MAXIMUM_ALLOWED_BULLETS: int = 10

var _queue = BoundedQueue.new(MAXIMUM_ALLOWED_BULLETS, true)

func add(projectile: Projectile) -> void:
	add_child(projectile)
	_queue.enqueue(projectile)
