extends Area2D

func _ready():
	print("Infirmary ready!")
	body_entered.connect(_on_body_entered)
	set_collision_mask_value(1, false)
	set_collision_mask_value(2, true)
	set_collision_mask_value(3, false)

func _on_body_entered(body):
	print("Entered: ", body.name)
	if body.name == "player":
		body.health = 100
		var hb = body.get_node_or_null("/root/maincampus/CanvasLayer/Control/HealthBar")
		if hb:
			hb.value = 100
		print("Health restored!")
		show_heal_text()

func show_heal_text():
	var canvas = get_node_or_null("/root/maincampus/CanvasLayer")
	if canvas == null:
		return
	
	var label = Label.new()
	label.text = "✚ Health Restored!"
	label.add_theme_font_size_override("font_size", 36)
	label.add_theme_color_override("font_color", Color.GREEN)
	label.position = Vector2(400, 500)
	canvas.add_child(label)
	
	# 2 second baad automatically hata do
	await get_tree().create_timer(2.0).timeout
	label.queue_free()
