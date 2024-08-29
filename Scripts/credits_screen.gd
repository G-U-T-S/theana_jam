class_name CreditsScreen extends Control


func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file(
		GlobalScript.title_screen_path
	)
