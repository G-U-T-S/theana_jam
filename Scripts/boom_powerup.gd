class_name BombPowerup extends Node2D

@onready var explosion_area: Area2D = %explosion_area


func _process(_delta: float) -> void:
	global_position = get_global_mouse_position()


func _input(event: InputEvent) -> void:
	if event.is_action_released("mouse_left"):
		for body in explosion_area.get_overlapping_bodies():
			if body is BaseShape:
				body.queue_free()
				
		queue_free()
