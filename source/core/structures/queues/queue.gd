class_name Queue extends RefCounted

var _elements: Array[Variant] = []
var size: int:
	get: return _elements.size()

func enqueue(object: Variant) -> void:
	_elements.append(object)

func dequeue() -> Variant:
	return _elements.pop_front()

func peek() -> Variant:
	if size > 0: return _elements[0]
	else: return null
