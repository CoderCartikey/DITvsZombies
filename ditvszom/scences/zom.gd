extends Node2D

func _ready():
	for zombie in get_children():
		zombie.add_to_group("zombies")
