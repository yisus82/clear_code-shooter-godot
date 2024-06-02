extends CanvasLayer

@onready var laser_label: Label = $LaserCount/VBoxContainer/Label
@onready var laser_icon: TextureRect = $LaserCount/VBoxContainer/TextureRect
@onready var grenade_label: Label = $GrenadeCount/VBoxContainer/Label
@onready var grenade_icon: TextureRect = $GrenadeCount/VBoxContainer/TextureRect
@onready var health_bar: TextureProgressBar = $MarginContainer/HealthBar

var green: Color = Color("6bbfa3")
var red: Color = Color("e60000")

func _ready():
	update_stats()
	
func update_color(amount: int, label: Label, icon: TextureRect) -> void:
	if amount <= 0:
		label.modulate = red
		icon.modulate = red
	else:
		label.modulate = green
		icon.modulate = green
		
func update_stats() -> void:
	update_laser_text()
	update_grenade_text()
	update_health_bar()

func update_laser_text() -> void:
	laser_label.text = str(Globals.laser_amount)
	update_color(Globals.laser_amount, laser_label, laser_icon)

func update_grenade_text() -> void:
	grenade_label.text = str(Globals.grenade_amount)
	update_color(Globals.grenade_amount, grenade_label, grenade_icon)
	
func update_health_bar() -> void:
	health_bar.value = Globals.player_health
