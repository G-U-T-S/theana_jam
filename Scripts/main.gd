extends Node2D

@onready var shape_spawn: ShapeSpawn = %shape_spawn
@onready var mouse_entity: MouseEntity = %mouse_entity
@onready var bg: Parallax2D = %bg
@onready var custom_camera: CustomCamera = %custom_camera
@onready var custom_score_label: CustomScoreLabel = %custom_score_label
@onready var custom_timer: CustomTimer = %custom_timer
@onready var pop_sound: AudioStreamPlayer = %pop_sound

var min_shapes_quantity: int = 100
var current_selected_shapes: Array[BaseShape] = []
var current_shape_type: String = ""
var min_combo: int = 3

# variavel para monitorar quantas
# shapes o player destruiu
var total_killed_shapes: int = 0

# essa variavel serve para limitar a distancia
# entre a ultima forma selecionada e a proxima
var max_detect_distance: float = 80.0

# essa variavel dita se o player esta segurando
# o botao do mouse para selecionar as formas
var is_selecting: bool = false


# BUG acho que e problema da godot, a fisica so atualiza
# quando ha o primeiro contato entre as formas BUG

func _ready() -> void:
	custom_timer.init_timer(30)
	custom_timer.timer.timeout.connect(finish_game)
	

func _process(_delta: float) -> void:
	# movimenta o background, dividido por um
	# numero tao grande para a velocidade ser baixa
	bg.scroll_offset.x += sin(Time.get_ticks_msec() / 10000.0)
	#bg.scroll_offset.y -= sin(Time.get_ticks_msec() / 10000.0)
	
	if shape_spawn.get_child_count() < min_shapes_quantity:
		shape_spawn.spawn()
	
	if is_selecting and mouse_entity.has_overlapping_bodies():
		check_valid_shape(mouse_entity.get_overlapping_bodies()[0])


func check_valid_shape(new_shape: BaseShape) -> void:
	# essa funçao testa se a "shape"
	# ja nao esta na lista
	if current_selected_shapes.size() <= 0:
		new_shape.inflate()
		current_selected_shapes.append(new_shape)
		current_shape_type = new_shape.type
		return
	else:
		# esse loop garante que a "new_shape" nao esta na lista
		# se ja estiver so sai da funçao
		for shape: BaseShape in current_selected_shapes:
			if shape == new_shape:
				return
		
		if current_shape_type == new_shape.type\
		and is_shape_distance_valid(new_shape, max_detect_distance):
			
			new_shape.inflate()
			current_selected_shapes.append(new_shape)


func is_shape_distance_valid(new_shape:BaseShape, max_distance: float) -> bool:
	# funçao usada para garantir que a forma esta no raio de detecçao
	var distance: float = current_selected_shapes[-1].global_position.distance_to(
		new_shape.global_position
	)
		
	if distance <= max_distance:
		return true
	
	return false


func clear_shapes() -> void:
	if current_selected_shapes.size() >= min_combo:
		total_killed_shapes += current_selected_shapes.size()
		
		custom_camera.start_shake(
			current_selected_shapes.size() * 1.3, 0.25
		)
		
		custom_score_label.add_score(
			current_selected_shapes.size() * 15
		)
		
		custom_timer.add_time(
			current_selected_shapes.size() * 0.5, 60.0
		)
		
		pop_sound.pitch_scale = randf_range(0.7, 1.3)
		pop_sound.play()

	for shape in current_selected_shapes:
		if current_selected_shapes.size() >= min_combo:
			shape.die()
		else:
			shape.deflate()

	current_selected_shapes.clear()
	current_shape_type = ""


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("mouse_left"):
		is_selecting = true
	
	elif event.is_action_released("mouse_left"):
		is_selecting = false
		clear_shapes()


func finish_game() -> void:
	total_killed_shapes = 0
