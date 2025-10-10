class_name Stack extends RefCounted

var _elements: Array[Variant] = []
var size: int:
	get: return _elements.size()

func push(object: Variant) -> void:
	_elements.push_front(object);

func pop() -> Variant:
	return _elements.pop_front()

func peek() -> Variant:
	if size > 0: return _elements[0]
	else: return null
