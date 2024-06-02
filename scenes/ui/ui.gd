extends CanvasLayer

@onready var laser_label: Label = $LaserCount/VBoxContainer/Label
@onready var grenade_label: Label = $GrenadeCount/VBoxContainer/Label
@onready var health_bar: TextureProgressBar = $MarginContainer/HealthBar

func _ready():
	update_laser_text()
	update_grenade_text()
	update_health_bar()

func update_laser_text():
	laser_label.text = str(Globals.laser_amount)

func update_grenade_text():
	grenade_label.text = str(Globals.grenade_amount)
	
func update_health_bar():
	health_bar.value = Globals.player_health
