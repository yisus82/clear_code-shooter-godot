extends CharacterBody2D

signal scout_shoot_laser(pos, direction)

var is_player_nearby: bool = false
var can_shoot_laser: bool = true
var child_index: int = 0

func _process(_delta):
	if is_player_nearby:
		look_at(Globals.player_pos)
		if can_shoot_laser:
			var spawnPosition: Marker2D = $LaserSpawnPositions.get_child(child_index%$LaserSpawnPositions.get_child_count())
			var pos: Vector2 = spawnPosition.global_position
			var direction: Vector2 = (Globals.player_pos - position).normalized()
			scout_shoot_laser.emit(pos, direction)
			can_shoot_laser = false
			$LaserTimer.start()
			child_index += 1

func _on_attack_area_body_entered(_body: Node2D) -> void:
	is_player_nearby = true

func _on_attack_area_body_exited(_body: Node2D) -> void:
	is_player_nearby = false

func _on_laser_cooldown_timeout() -> void:
	can_shoot_laser = true

func hit() -> void:
	print("scout was hit")
