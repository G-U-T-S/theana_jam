class_name BaseShape extends RigidBody2D

@export var type: String = ""

# o valor dessa variavel que
# vai ser afetado pelo inflate
@export var texture: Node2D = null


func inflate() -> void:
	var inflate_tween: Tween = create_tween()
	inflate_tween.tween_property(texture, "scale", Vector2(1.3, 1.3), 0.2)
	inflate_tween.play()


func deflate() -> void:
	var deflate_tween: Tween = create_tween()
	deflate_tween.tween_property(texture, "scale", Vector2.ONE, 0.2)
	deflate_tween.play()
