class_name TitleScreen extends Control

const main_scene_path:String = "res://Scenes/main.tscn"
const credits_screen_path:String = "res://Scenes/credits_screen.tscn"


func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file(main_scene_path)


func _on_credits_button_pressed() -> void:
	get_tree().change_scene_to_file(credits_screen_path)
