extends Node2D

@onready var camera = $Camera2D
@onready var player = $player

func _ready():
	# Saare zombies fix karo
	var zom_node = get_node("ZOM")
	for zombie in zom_node.get_children():
		zombie.add_to_group("zombies")
		# Collision layers fix
		zombie.set_collision_layer_value(1, false)
		zombie.set_collision_layer_value(3, true)
		zombie.set_collision_mask_value(1, true)

func _process(delta):
	camera.global_position = player.global_position
