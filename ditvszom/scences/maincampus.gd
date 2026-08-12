extends Node2D

@onready var camera = $Camera2D
@onready var player = $player

func _ready():
	# Player collision fix
	player.set_collision_layer_value(1, false)
	player.set_collision_layer_value(2, true)
	player.set_collision_mask_value(1, true)
	player.set_collision_mask_value(3, true)
	
	# Saare zombies fix
	var zom_node = get_node("ZOM")
	for zombie in zom_node.get_children():
		zombie.add_to_group("zombies")
		zombie.set_collision_layer_value(1, false)
		zombie.set_collision_layer_value(3, true)
		zombie.set_collision_mask_value(1, true)
		zombie.set_collision_mask_value(2, true)


func _on_zoom_area_body_entered(body: Node2D) -> void:
	if body.name == "player":
		print("ZOOM TRIGGERED")
		camera.zoom = Vector2(2, 2)
