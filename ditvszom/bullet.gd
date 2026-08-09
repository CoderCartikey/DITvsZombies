extends Area2D

const SPEED = 600.0
var direction = Vector2.ZERO

func _ready():
	# Bullet sirf layer 3 (zombies) ko detect kare
	set_collision_layer_value(1, false)
	set_collision_layer_value(2, true)
	set_collision_mask_value(1, false)
	set_collision_mask_value(3, true)
	body_entered.connect(_on_body_entered)
	await get_tree().create_timer(2.0).timeout
	if is_instance_valid(self):
		queue_free()

func _process(delta):
	position += direction * SPEED * delta

func _on_body_entered(body):
	if body.is_in_group("zombies"):
		body.die()
		queue_free()
	elif body is StaticBody2D:
		queue_free()
