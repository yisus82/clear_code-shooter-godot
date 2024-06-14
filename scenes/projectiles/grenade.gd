extends RigidBody2D

const speed: int = 750

var is_explosion_active: bool = false
var explosion_radius: int = 400

func _process(_delta):
	if is_explosion_active:
		var containers: Array[Node] = get_tree().get_nodes_in_group("Containers")
		var entities: Array[Node] = get_tree().get_nodes_in_group("Entities")
		var targets: Array[Node] = containers + entities
		for target in targets:
			if target.global_position.distance_to(global_position) <= explosion_radius:
				target.hit()

func explode() -> void:
	$".".lock_rotation = true
	$AnimationPlayer.play("explosion")
	$CollisionShape2D.disabled = true
	is_explosion_active = true
