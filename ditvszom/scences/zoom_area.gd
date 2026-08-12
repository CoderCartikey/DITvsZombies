extends Area2D

@onready var camera = $"../player/Camera2D"

func _on_body_entered(body):
	print("BODY ENTERED:", body.name)
