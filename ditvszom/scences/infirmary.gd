extends Area2D

func _ready():
	print("Infirmary ready!")
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	print("Something entered infirmary: ", body.name)
	if body.name == "player":
		body.health = 100
		var hb = body.get_node_or_null("/root/maincampus/CanvasLayer/Control/HealthBar")
		if hb:
			hb.value = 100
		print("Health restored!")
