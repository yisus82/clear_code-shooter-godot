extends StaticBody2D
class_name ItemContainer

signal open(pos: Vector2, direction: Vector2)

@onready var current_direction: Vector2 = Vector2.DOWN.rotated(rotation)

var opened: bool = false
var item_count: int = 1

func hit() -> void:
	if not opened:
		$LidSprite.hide()
		opened = true
		for i in range(item_count):
			var spawnPosition: Marker2D = $SpawnPositions.get_child(randi()%$SpawnPositions.get_child_count())
			var pos: Vector2 = spawnPosition.global_position
			open.emit(pos, current_direction)
