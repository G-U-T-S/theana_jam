class_name BaseShape extends RigidBody2D

@export var type: String = ""
@export var scale_amount := Vector2(0.2, 0.2)

# o valor dessa variavel que
# vai ser afetado pelo inflate
@export var texture: Node2D = null

# particula que vai ser acionada quando
# a forma for destruida
@export var particle: CPUParticles2D = null

var base_scale := Vector2.ZERO


func _enter_tree() -> void:
	if texture != null:
		base_scale = texture.scale


func inflate() -> void:
	if texture != null:
		var inflate_tween: Tween = create_tween()
		inflate_tween.set_ease(Tween.EASE_IN_OUT)
		inflate_tween.tween_property(
			texture, "scale", base_scale + scale_amount, 0.2
		)
		inflate_tween.play()


func deflate() -> void:
	if texture != null:
		var deflate_tween: Tween = create_tween()
		deflate_tween.tween_property(
			texture, "scale", base_scale, 0.2
		)
		deflate_tween.play()


func die() -> void:
	deflate()
	if particle != null:
		texture.hide()
		# garantindo one_shot para
		# nao ficar esperando pra sempre
		particle.one_shot = true
		particle.emitting = true
		await particle.finished
	
	queue_free()
