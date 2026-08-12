extends Area2D

@onready var camera = $"../player/Camera2D"

func _on_body_entered(body):
	if body.name == "player":
		camera.zoom = Vector2(2, 2)
		print("ZOOM TRIGGERED")
