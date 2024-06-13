extends CharacterBody2D

signal player_shoot_laser(pos: Vector2, direction: Vector2)
signal player_shoot_grenade(pos: Vector2, direction: Vector2)

@export var max_speed: int = 500
var speed: int = max_speed
var can_shoot_laser: bool = true
var can_shoot_grenade: bool = true

func _process(_delta):
	# movement input
	var movement: Vector2 = Input.get_vector("left", "right", "up", "down")
	velocity = movement * speed
	move_and_slide()
	Globals.player_pos = global_position
	
	# rotate
	var mouse_pos: Vector2 = get_global_mouse_position()
	look_at(mouse_pos)

	# shooting input
	if Input.is_action_pressed("fire1") and can_shoot_laser and Globals.laser_amount > 0:
		Globals.laser_amount -= 1
		$GPUParticles2D.emitting = true
		var pos: Vector2 = $LaserSpawnPoint.global_position
		var direction: Vector2 = (mouse_pos - position).normalized()
		player_shoot_laser.emit(pos, direction)
		can_shoot_laser = false
		$LaserTimer.start()
	if Input.is_action_pressed("fire2") and can_shoot_grenade and Globals.grenade_amount > 0:
		Globals.grenade_amount -= 1
		var pos: Vector2 = $GrenadeSpawnPoint.global_position
		var direction: Vector2 = (mouse_pos - position).normalized()
		player_shoot_grenade.emit(pos, direction)
		can_shoot_grenade = false
		$GrenadeTimer.start()

func _on_laser_timer_timeout() -> void:
	can_shoot_laser = true

func _on_grenade_timer_timeout() -> void:
	can_shoot_grenade = true
