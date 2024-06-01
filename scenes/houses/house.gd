extends Area2D

signal player_entered_house(body: Node2D)
signal player_exited_house(body: Node2D)

func _on_area_2d_body_entered(body: Node2D):
	player_entered_house.emit(body)

func _on_area_2d_body_exited(body: Node2D):
	player_exited_house.emit(body)
