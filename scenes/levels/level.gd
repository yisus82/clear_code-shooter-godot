extends Node2D
class_name LevelParent

@export var laser_scene: PackedScene
@export var grenade_scene: PackedScene
@export var item_scene: PackedScene

func _ready():
	for container in get_tree().get_nodes_in_group("Containers"):
		container.connect("open", _on_container_opened)
	for scout in get_tree().get_nodes_in_group("Scouts"):
		scout.connect("scout_shoot_laser", _on_scout_scout_shoot_laser)

func create_laser(pos: Vector2, direction: Vector2) -> void:
	var laser: Area2D = laser_scene.instantiate() as Area2D
	laser.position = pos
	laser.direction = direction
	laser.rotation = direction.angle()
	$Projectiles.add_child(laser)

func _on_player_player_shoot_laser(pos: Vector2, direction: Vector2) -> void:
	create_laser(pos, direction)

func _on_player_player_shoot_grenade(pos: Vector2, direction: Vector2) -> void:
	var grenade: RigidBody2D = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
	$Projectiles.add_child(grenade)

func _on_container_opened(pos: Vector2, direction: Vector2) -> void:
	var item: Area2D = item_scene.instantiate() as Area2D
	item.position = pos
	item.direction = direction
	$Items.add_child.call_deferred(item)

func _on_scout_scout_shoot_laser(pos: Vector2, direction: Vector2) -> void:
	create_laser(pos, direction)
	
