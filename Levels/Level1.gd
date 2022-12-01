extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(_delta):
	var Door = get_node_or_null("/root/Level1/Door")
	if Door != null:
		var Enemy_Container = get_node_or_null("/root/Level1/Enemy_Container")
		if Enemy_Container != null and Enemy_Container.get_child_count() == 0:
			Door.queue_free()
