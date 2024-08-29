class_name CreditsScreen extends Control

const title_screen_path: String = "res://Scenes/title_screen.tscn"


func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file(title_screen_path)
