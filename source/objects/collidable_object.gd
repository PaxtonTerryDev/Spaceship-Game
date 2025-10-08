@tool
class_name CollidableObject extends Resource

@export var sprite: Texture2D
@export var collision_data: Array[PackedVector2Array]

func instantiate_nodes(parent: Node) -> void:
	_instantiate_sprite_node(parent)
	_instantiate_collider_nodes(parent)

func _instantiate_sprite_node(parent: Node) -> void:
	var sprite_node: Sprite2D = _create_sprite()
	parent.add_child(sprite_node)
	if Engine.is_editor_hint():
		sprite_node.owner = parent.get_tree().edited_scene_root

func _instantiate_collider_nodes(parent: Node) -> void:
	var colliders: Array[CollisionPolygon2D] = _create_colliders()
	for collider in colliders:
		parent.add_child(collider)
		if Engine.is_editor_hint():
			collider.owner = parent.get_tree().edited_scene_root

func _create_sprite() -> Sprite2D:
	var sprite_node: Sprite2D = Sprite2D.new()
	sprite_node.texture = sprite
	return sprite_node

func _create_colliders() -> Array[CollisionPolygon2D]:
	var collider_nodes: Array[CollisionPolygon2D] = []
	for data in collision_data:
		var node = CollisionPolygon2D.new()
		node.build_mode = CollisionPolygon2D.BUILD_SOLIDS
		node.polygon = data
		collider_nodes.append(node)

	return collider_nodes
