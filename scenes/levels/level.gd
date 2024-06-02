extends Node2D
class_name LevelParent

@export var laser_scene: PackedScene
@export var grenade_scene: PackedScene

func _on_player_player_shoot_laser(pos: Vector2, direction: Vector2) -> void:
	var laser: Area2D = laser_scene.instantiate() as Area2D
	laser.position = pos
	laser.direction = direction
	laser.rotation = direction.angle()
	$Projectiles.add_child(laser)
	$UI.update_laser_text()

func _on_player_player_shoot_grenade(pos: Vector2, direction: Vector2) -> void:
	var grenade: RigidBody2D = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
	$Projectiles.add_child(grenade)
	$UI.update_grenade_text()
