extends Control



func _on_Play_pressed():
	var _scene = get_tree().change_scene("res://Levels/Level1.tscn")
	
func _ready():
	$Label.text = "Your final score was " + str(Global.score) + "."

func _on_Quit_pressed():
	
