class_name PowerupsTab extends Control

@onready var bomb_button: TextureButton = %bomb_button

@export var custom_camera: CustomCamera = null
@export var score_label: CustomScoreLabel = null

@export var bomb_price: int = 350
@export var ot_price: int = 0
@export var ott_price: int = 0

const bomb_scene: PackedScene = preload("res://Scenes/boom_powerup.tscn")

enum POWERUPS{
	none = 0, bomb = 1
}
var current_powerup: int = 0


func _input(event: InputEvent) -> void:
	if event.is_action_released("mouse_left"):
		match current_powerup:
			POWERUPS.bomb:
				current_powerup = POWERUPS.none
				shake_camera(15, 0.5)


func _on_bomb_button_pressed() -> void:
	if GlobalScript.current_player_score >= bomb_price:
		current_powerup = POWERUPS.bomb
		score_label.sub_score(bomb_price)
		add_child(bomb_scene.instantiate())


func shake_camera(amount:float, duration: float) -> void:
	custom_camera.start_shake(amount, duration)
