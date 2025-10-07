@tool
extends EditorScript

func _run() -> void:
	var obj_name: String
	var texture: Texture2D
	var colliders: Array[PackedVector2Array] = []
	var nodes: Array[Node] = EditorInterface.get_selection().get_selected_nodes()
	for node in nodes:
		if node is Sprite2D:
			texture = node.texture
			obj_name = node.name
		if node is CollisionPolygon2D:
			colliders.append(node.polygon)

	_build_resource(obj_name, texture, colliders)

func _build_resource(_name: String, _texture: Texture2D, _colliders: Array[PackedVector2Array]) -> void:
	var directory: String = "res://resources/collidable_objects/"
	var obj: CollidableObject = CollidableObject.new()
	obj.sprite = _texture
	obj.collision_data = _colliders
	var filepath = "%s%s%s" % [directory, _name, ".tres"]
	print("Saving resource at %s" % filepath)
	ResourceSaver.save(obj, filepath)
