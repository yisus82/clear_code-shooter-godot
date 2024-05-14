extends CharacterBody2D

signal player_shoot_laser(pos)
signal player_shoot_grenade

const speed: int = 500
var can_shoot_laser: bool = true
var can_shoot_grenade: bool = true

func _process(_delta):
	# movement input
	var movement: Vector2 = Input.get_vector("left", "right", "up", "down")
	velocity = movement * speed
	move_and_slide()

	# shooting input
	if Input.is_action_pressed("fire1") and can_shoot_laser:
		player_shoot_laser.emit($LaserSpawnPoint.global_position)
		can_shoot_laser = false
		$LaserTimer.start()
	if Input.is_action_pressed("fire2") and can_shoot_grenade:
		player_shoot_grenade.emit()
		can_shoot_grenade = false
		$GrenadeTimer.start()

func _on_laser_timer_timeout():
	can_shoot_laser = true

func _on_grenade_timer_timeout():
	can_shoot_grenade = true
