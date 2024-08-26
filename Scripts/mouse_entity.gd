class_name MouseEntity extends Area2D

## Esse objeto vai ser usado para quando o player
## enviar um input de click do mouse
## seja verificada a area que esta colidindo
## com esse objeto, assim executando a logica desejada


func _process(_delta: float) -> void:
	global_position = get_global_mouse_position()
