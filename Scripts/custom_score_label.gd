class_name CustomScoreLabel extends Label

@onready var anim: AnimationPlayer = %anim
@onready var anim_label: Label = %anim_label


func add_score(amount: int) -> void:
	GlobalScript.current_player_score += amount
	anim_label.text = "+ " + var_to_str(amount)
	anim.play("add_score_anim")
	
	await anim.animation_finished
	text = "SCORE: " + var_to_str(GlobalScript.current_player_score)


func sub_score(amount: int) -> void:
	GlobalScript.current_player_score -= amount
	anim_label.text = "- " + var_to_str(amount)
	anim.play("sub_score_anim")
	
	await anim.animation_finished
	text = "SCORE: " + var_to_str(GlobalScript.current_player_score)
