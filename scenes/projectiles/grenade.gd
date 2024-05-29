extends RigidBody2D

const speed: int = 750

func explode():
	$".".lock_rotation = true
	$AnimationPlayer.play("explosion")
	$CollisionShape2D.disabled = true
