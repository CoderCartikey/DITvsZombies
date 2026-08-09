extends CharacterBody2D

const SPEED = 200.0
var health = 100
var health_bar = null
var bullet_scene = null
var is_dead = false

func _ready():
	bullet_scene = load("res://bullet.tscn")
	health_bar = get_node_or_null("/root/maincampus/CanvasLayer/HealthBar")
	if health_bar:
		health_bar.value = 100

func _physics_process(delta):
	if is_dead:
		return

	var direction = Vector2.ZERO
	if Input.is_key_pressed(KEY_D):
		direction.x += 1
	if Input.is_key_pressed(KEY_A):
		direction.x -= 1
	if Input.is_key_pressed(KEY_S):
		direction.y += 1
	if Input.is_key_pressed(KEY_W):
		direction.y -= 1

	direction = direction.normalized()
	velocity = direction * SPEED

	if direction != Vector2.ZERO:
		rotation = direction.angle()

	move_and_slide()

func _process(delta):
	if is_dead:
		return
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
	show_dead_screen()

func show_dead_screen():
	var canvas = get_node_or_null("/root/maincampus/CanvasLayer")
	if canvas == null:
		return

	# Dark overlay
	var overlay = ColorRect.new()
	overlay.color = Color(0, 0, 0, 0.7)
	overlay.size = Vector2(1152, 648)
	canvas.add_child(overlay)

	# "You're Dead" text
	var label = Label.new()
	label.text = "YOU'RE DEAD"
	label.add_theme_font_size_override("font_size", 72)
	label.add_theme_color_override("font_color", Color.RED)
	label.position = Vector2(350, 250)
	canvas.add_child(label)

	# Restart button
	var button = Button.new()
	button.text = "Try Again"
	button.position = Vector2(476, 380)
	button.size = Vector2(200, 60)
	button.pressed.connect(func(): get_tree().reload_current_scene())
	canvas.add_child(button)
