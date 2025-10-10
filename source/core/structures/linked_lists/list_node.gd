class_name ListNode extends RefCounted

var node: Variant
var next: Variant

func _init(_node: Variant, _next: Variant) -> void:
	self.node = _node
	self.next = _next
