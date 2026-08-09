extends CharacterBody2D

const SPEED = 80.0
const DETECTION_RANGE = 500.0
const STOP_DISTANCE = 30.0

var damage_cooldown = 0.0
var player = null

func _ready():
	add_to_group("zombies")
	player = get_parent().get_parent().get_node("player")

func _physics_process(delta):
	if player == null:
		return

	var distance = global_position.distance_to(player.global_position)

	if distance < DETECTION_RANGE:
		var direction = (player.global_position - global_position).normalized()
		rotation = direction.angle()

		if distance > STOP_DISTANCE:
			velocity = direction * SPEED
		else:
			velocity = Vector2.ZERO
			damage_cooldown -= delta
			if damage_cooldown <= 0:
				player.take_damage(10)
				damage_cooldown = 1.0
	else:
		velocity = Vector2.ZERO

	move_and_slide()

func die():
	queue_free()
