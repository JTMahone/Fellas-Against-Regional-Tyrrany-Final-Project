extends Node

var VP = Vector2.ZERO
var lives = 3
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	VP = get_viewport().size
	var _signal = get_tree().get_root().connect("size_changed", self, "_resize")

func _resize():
	VP = get_viewport().size


func update_lives(l):
	lives += l
	var hud = get_node_or_null("/root/Game/UI/HUD")
	if hud != null:
		if lives > 0:
			hud.update_lives()
		else:
			var _scene = get_tree().change_scene("res://UI/End_Game.tscn")
