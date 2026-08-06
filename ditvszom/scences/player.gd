extends CharacterBody2D

const SPEED = 200.0
var health = 100
var health_bar = null

var bullet_scene : PackedScene = preload("res://scenes/bullet.tscn")

func _ready():
	health_bar = get_node_or_null("/root/maincampus/CanvasLayer/HealthBar")
	if health_bar == null:
		print("WARNING: HealthBar node not found!")
	else:
		health_bar.value = 100
		print("HealthBar found!")

func _physics_process(delta):
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
	if Input.is_action_just_pressed("ui_accept"):
		shoot()

func shoot():
	var bullet = bullet_scene.instantiate()
	bullet.direction = Vector2.RIGHT.rotated(rotation)
	bullet.global_position = global_position
	get_parent().add_child(bullet)

func take_damage(amount):
	health -= amount
	print("Health: ", health)
	if health_bar != null:
		health_bar.value = health
	if health <= 0:
		die()

func die():
	get_tree().reload_current_scene()
