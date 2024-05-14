extends Node2D

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")

func _on_gate_player_entered_gate(body):
	print(body.name + " has entered the gate")

func _on_player_player_shoot_laser(pos):
	var laser: Area2D = laser_scene.instantiate()
	laser.position = pos
	$Projectiles.add_child(laser)

func _on_player_player_shoot_grenade():
	print("shoot grenade")
