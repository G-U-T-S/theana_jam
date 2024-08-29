class_name TitleScreen extends Control


func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file(
		GlobalScript.main_scene_path
	)


func _on_credits_button_pressed() -> void:
	get_tree().change_scene_to_file(
		GlobalScript.credits_screen_path
	)
