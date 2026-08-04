extends Area2D

func _on_body_entered(body):
	if body.name == "player":
		body.health = 100
		var hb = body.get_node_or_null("/root/maincampus/CanvasLayer/HealthBar")
		if hb:
			hb.value = 100
		print("Health restored!")
