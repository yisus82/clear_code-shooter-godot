extends StaticBody2D
class_name ItemContainer

signal open(pos: Vector2, direction: Vector2)

@onready var current_direction: Vector2 = Vector2.DOWN.rotated(rotation)

var opened: bool = false
