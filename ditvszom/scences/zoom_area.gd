extends Area2D

@onready var camera = $"../player/Camera2D"


func _on_zoom_area_body_entered(body: Node2D) -> void:
	if body.name == "player":
		print("ZOOM TRIGGERED")
		camera.zoom = Vector2(2, 2)
