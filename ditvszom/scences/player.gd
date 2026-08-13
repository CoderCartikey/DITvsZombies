extends CharacterBody2D

const SPEED = 3000.0

var health = 100
var health_bar = null
var bullet_scene = null
var is_dead = false


func _ready():
	bullet_scene = load("res://bullet.tscn")

	health_bar = get_node_or_null("/root/maincampus/CanvasLayer/Control/HealthBar")

	if health_bar:
		health_bar.value = 100


func _physics_process(delta):
	if is_dead:
		return

	# Movement input
	# WASD + Virtual Joystick both use these InputMap actions
	var direction = Vector2.ZERO

	direction.x = Input.get_axis("move_left", "move_right")
	direction.y = Input.get_axis("move_up", "move_down")

	direction = direction.normalized()
	velocity = direction * SPEED

	# Smooth rotation
	if direction != Vector2.ZERO:
		var target_angle = direction.angle()
		rotation = lerp_angle(rotation, target_angle, 0.1)

	move_and_slide()


func _process(delta):
	if is_dead:
		return

	# Spacebar / ui_accept = shoot
	if Input.is_action_just_pressed("ui_accept"):
		shoot()


func shoot():
	if bullet_scene == null:
		return

	var bullet = bullet_scene.instantiate()

	bullet.direction = Vector2.RIGHT.rotated(rotation)
	bullet.global_position = global_position

	get_parent().add_child(bullet)


func take_damage(amount):
	if is_dead:
		return

	health -= amount
	health = max(health, 0)

	print("Health:", health)

	if health_bar:
		health_bar.value = health

	if health <= 0:
		die()


func die():
	is_dead = true
	velocity = Vector2.ZERO
	show_dead_screen()


func show_dead_screen():
	var canvas = get_node_or_null("/root/maincampus/CanvasLayer")

	if canvas == null:
		return

	# Full-screen dark overlay
	var overlay = ColorRect.new()
	overlay.color = Color(0, 0, 0, 0.7)
	overlay.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)

	canvas.add_child(overlay)

	# "YOU'RE DEAD" text
	var label = Label.new()
	label.text = "YOU'RE DEAD BRO.."

	label.add_theme_font_size_override("font_size", 72)
	label.add_theme_color_override("font_color", Color.RED)

	label.set_anchors_and_offsets_preset(Control.PRESET_CENTER)
	label.position = Vector2(-310, -70)
	label.size = Vector2(600, 140)

	canvas.add_child(label)

	# Restart button
	var button = Button.new()
	button.text = "Try Again"

	button.set_anchors_and_offsets_preset(Control.PRESET_CENTER)
	button.position = Vector2(-100, 50)
	button.size = Vector2(200, 60)

	button.pressed.connect(func():
		get_tree().reload_current_scene()
	)

	canvas.add_child(button)
