extends Area2D

const SPEED = 600.0
var direction = Vector2.ZERO

func _ready():
	await get_tree().create_timer(2.0).timeout
	queue_free()

func _process(delta):
	position += direction * SPEED * delta

func _on_body_entered(body):
	if body.is_in_group("zombies"):
		body.die()
		queue_free()
