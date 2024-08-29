class_name BombPowerup extends Node2D

@onready var explosion_area: Area2D = %explosion_area
@onready var explosive_particles: CPUParticles2D = %explosive_particles
@onready var sprite: Sprite2D = %sprite
@onready var particles: CPUParticles2D = %particles


func _process(_delta: float) -> void:
	global_position = get_global_mouse_position()


func _input(event: InputEvent) -> void:
	if event.is_action_released("mouse_left") and explosion_area.visible:
		for body in explosion_area.get_overlapping_bodies():
			if body is BaseShape:
				body.queue_free()
				
		explosive_particles.one_shot = true
		explosive_particles.emitting = true
				
		particles.hide()
		sprite.hide()
		explosion_area.hide()
		await explosive_particles.finished
		queue_free()
