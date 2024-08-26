extends Node2D

@onready var shape_spawn: ShapeSpawn = %shape_spawn
@onready var mouse_entity: MouseEntity = %mouse_entity

var min_shapes_quantity: int = 70
var current_selected_shapes: Array[BaseShape] = []

# essa variavel dita se o player esta segurando
# o botao do mouse para selecionar as formas
var is_selecting: bool = false


func _process(_delta: float) -> void:
	if shape_spawn.get_child_count() < min_shapes_quantity:
		shape_spawn.spawn()
	
	if is_selecting and mouse_entity.has_overlapping_bodies():
		check_valid_shape(mouse_entity.get_overlapping_bodies()[0])


func check_valid_shape(new_shape: BaseShape) -> void:
	# essa funçao testa se a "shape"
	# ja nao esta na lista
	if current_selected_shapes.size() <= 0:
		current_selected_shapes.append(new_shape)
		return
	else:
		# esse loop garante que a "new_shape" nao esta na lista
		# se ja estiver so sai da funçao
		for shape: BaseShape in current_selected_shapes:
			if shape == new_shape:
				return
		
		current_selected_shapes.append(new_shape)



func _input(event: InputEvent) -> void:
	if event.is_action_pressed("mouse_left"):
		is_selecting = true
	
	elif event.is_action_released("mouse_left"):
		is_selecting = false
		# TEMP
		for shape in current_selected_shapes:
			shape.queue_free()
		current_selected_shapes.clear()
