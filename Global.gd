extends Node

var VP = Vector2.ZERO
var health = 3
var score = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	VP = get_viewport().size
	var _signal = get_tree().get_root().connect("size_changed", self, "_resize")

		

func _resize():
	VP = get_viewport().size

func update_score(s):
	score += s
	var hud = get_node_or_null("/root/Levels/Level1/ui/HUD")
	if hud != null:
		hud.update_score()

func update_health(l):
	health += l
	var health = get_node_or_null("/root/Levels/Level1/ui/HUD/health")
	if health != null:
		health.text = "health: " + str(health)
