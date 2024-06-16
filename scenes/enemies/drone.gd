extends CharacterBody2D

const speed: int = 200
var health: int = 30
var is_vulnerable: bool = true

func _process(delta):
	var direction = Vector2.RIGHT
	velocity = direction * speed
	move_and_slide()

func _on_hit_timer_timeout() -> void:
	is_vulnerable = true

func hit() -> void:
	if is_vulnerable:
		is_vulnerable = false
		$HitTimer.start()
		health -= 10
		if health <= 0:
			queue_free()
