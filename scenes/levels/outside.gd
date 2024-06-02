extends LevelParent

func _on_gate_player_entered_gate(_body: Node2D):
	var tween: Tween = create_tween()
	tween.tween_property($Player, "speed", 0, 0.5)
	get_tree().change_scene_to_file.bind("res://scenes/levels/inside.tscn").call_deferred()
	
func _on_house_player_entered_house(_body: Node2D):
	var tween: Tween = create_tween()
	tween.tween_property($Player/Camera2D, "zoom", Vector2(1, 1), 1)

func _on_house_player_exited_house(_body: Node2D):
	var tween: Tween = create_tween()
	tween.tween_property($Player/Camera2D, "zoom", Vector2(0.6, 0.6), 1)
