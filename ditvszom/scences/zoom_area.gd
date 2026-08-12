extends Area2D

@onready var camera = $"../player/Camera2D"

func _on_body_entered(body):
	if body.name == "player":
		var tween = create_tween()
		tween.tween_property(camera, "zoom", Vector2(2, 2), 0.5)
		
func _on_body_exited(body):
	if body.name == "player":
		var tween = create_tween()
		tween.tween_property(camera, "zoom", Vector2(1, 1), 0.5)
		
