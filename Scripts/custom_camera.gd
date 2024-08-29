class_name CustomCamera extends Camera2D

@onready var shake_timer: Timer = %shake_timer

var shake_amount := Vector2(0, 0)
var original_position := Vector2(0, 0)


func start_shake(amount: float, duration: float) -> void:
	shake_amount = Vector2(amount, amount)
	shake_timer.start(duration)
	original_position = global_position


func _process(_delta) -> void:
	if not shake_timer.is_stopped():
		position = original_position + Vector2(
			randf_range(-shake_amount.x, shake_amount.x),
			randf_range(-shake_amount.y, shake_amount.y)
		)


func _on_shake_timer_timeout() -> void:
	global_position = original_position
