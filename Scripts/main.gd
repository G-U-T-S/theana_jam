extends Node2D

@onready var shape_spawn: ShapeSpawn = %shape_spawn

var min_shapes_quantity: int = 70


func _process(_delta: float) -> void:
	if shape_spawn.get_child_count() < min_shapes_quantity:
		shape_spawn.spawn()


func _input(event: InputEvent) -> void:
	if event.is_action("ui_accept"):
		shape_spawn.get_children().pick_random().queue_free()
