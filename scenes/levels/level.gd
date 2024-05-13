extends Node2D


func _on_gate_player_entered_gate(body):
	print(body.name + " has entered the gate")


func _on_player_player_shoot_laser():
	print("shoot laser")


func _on_player_player_shoot_grenade():
	print("shoot grenade")
