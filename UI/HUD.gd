extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _ready():
	update_score()

func update_score():
	$Score.text = "Score: " + str(Global.score)

func update_health():
	$health.text = "health: " + str(Global.health)
