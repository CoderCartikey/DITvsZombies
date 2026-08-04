extends Node2D

@onready var camera = $Camera2D
@onready var player = $player    # ← lowercase 'p' — exactly jaisa scene tree mein naam hai

func _process(delta):
	camera.global_position = player.global_position


func _on_infirmary_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
