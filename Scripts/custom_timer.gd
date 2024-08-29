class_name CustomTimer extends Label

@onready var timer: Timer = %timer
@onready var anim: AnimationPlayer = %anim


func init_timer(time_amount: float) -> void:
	timer.start(time_amount)


func _process(_delta: float) -> void:
	if not timer.is_stopped():
		text = "TIME: " + var_to_str(round(timer.time_left))


func add_time(plus_time: float, limit:float = -1) -> void:
	if not timer.is_stopped() and limit > 0:
		timer.paused = true
		var current_time: float = timer.time_left
		timer.start(
			clampf(current_time + plus_time, 1, limit)
		)
		#anim.play("add_time_anim") # nao ficou legal
		timer.paused = false


func get_timer_value() -> float:
	return timer.time_left
