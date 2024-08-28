extends Node
class_name GameManager
@onready var pause: Pause = $CanvasLayer/pause
@onready var scorelabel: Label = $CanvasLayer/scorelabel

@export var score: int= 0

func add_score():
	pass


var is_paused:bool=false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
#funcs para pausar o jogo
func _input(event):
	if event.is_action_pressed("Pause"):
		swap_state()
		
func swap_state():
	if not pause.visible:
		pause.show()
		get_tree().paused=true
	else:
		get_tree().paused=false
		pause.hide()
		is_paused=true





# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
