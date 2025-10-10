class_name BoundedQueue extends Queue

var max_length: int
var should_free: bool

func _init(_max_length: int, _should_free: bool) -> void:
	max_length = _max_length
	should_free = _should_free

func enqueue(object: Variant) -> void:
	if self.size >= max_length:
		self.dequeue()
	super(object)

func dequeue() -> Variant:
	var element = super()
	if should_free && element is Node:
		element.queue_free()
	return element
