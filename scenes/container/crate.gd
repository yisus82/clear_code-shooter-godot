extends ItemContainer

func hit() -> void:
	if not opened:
		$LidSprite.hide()
		opened = true
		for i in range(5):
			var spawnPosition: Marker2D = $SpawnPositions.get_child(randi()%$SpawnPositions.get_child_count())
			var pos: Vector2 = spawnPosition.global_position
			open.emit(pos, current_direction)
