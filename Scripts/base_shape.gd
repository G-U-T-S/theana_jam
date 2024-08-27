class_name BaseShape extends RigidBody2D

@export var type: String = ""

# o valor dessa variavel que
# vai ser afetado pelo inflate
@export var texture: Node2D = null

var base_scale := Vector2.ZERO


func _enter_tree() -> void:
	base_scale = texture.scale


func inflate() -> void:
	var inflate_tween: Tween = create_tween()
	inflate_tween.set_ease(Tween.EASE_IN_OUT)
	inflate_tween.tween_property(
		texture, "scale", base_scale + Vector2(0.2, 0.2), 0.2
	)
	inflate_tween.play()


func deflate() -> void:
	var deflate_tween: Tween = create_tween()
	deflate_tween.tween_property(
		texture, "scale", base_scale, 0.2
	)
	deflate_tween.play()
