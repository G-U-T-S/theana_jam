class_name ShapeSpawn extends Node2D

@export var range_to_spawn_x: Array[float] = [-170, 170]

# as cenas das formas que podem ser geradas
var SHAPES: Dictionary = {
	"circle": load("res://Scenes/circle_shape.tscn"),
	"triangle": load("res://Scenes/triangle_shape.tscn"),
	"square": load("res://Scenes/square_shape.tscn"),
	"pentagon": load("res://Scenes/pentagon_shape.tscn"), 
	"hexagon": load("res://Scenes/hexagon.tscn"),
	"heptágono": load("res://Scenes/heptágono.tscn"),
	"octógono": load("res://Scenes/octógono.tscn")
}


func spawn() -> void:
	var new_shape: BaseShape = SHAPES[SHAPES.keys().pick_random()].instantiate()
	add_child(new_shape)

	# faz com que a posiçao no eixo X onde a
	# forma for aparecer seja aleatoria
	new_shape.global_position.x = randf_range(
		global_position.x - range_to_spawn_x[0],
		global_position.x - range_to_spawn_x[1]
	)
	
	new_shape.global_position.y = global_position.y
