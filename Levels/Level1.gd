extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var musicChoice = randi() % 3
	if musicChoice == 0:
		$Music1.playing = true
	if musicChoice == 1:
		$Music2.playing = true
	if musicChoice == 2:
		$Music3.playing = true

func _process(_delta):
	var Door = get_node_or_null("/root/Level1/Door")
	if Door != null:
		var Enemy_Container = get_node_or_null("/root/Level1/Enemy_Container")
		if Enemy_Container != null and Enemy_Container.get_child_count() == 0:
			Door.queue_free()


func _on_Music1_finished():
	randomize()
	var musicChoice = randi() % 3
	if musicChoice == 0:
		$Music1.playing = true
	if musicChoice == 1:
		$Music2.playing = true
	if musicChoice == 2:
		$Music3.playing = true


func _on_Music2_finished():
	randomize()
	var musicChoice = randi() % 3
	if musicChoice == 0:
		$Music1.playing = true
	if musicChoice == 1:
		$Music2.playing = true
	if musicChoice == 2:
		$Music3.playing = true


func _on_Music3_finished():
	randomize()
	var musicChoice = randi() % 3
	if musicChoice == 0:
		$Music1.playing = true
	if musicChoice == 1:
		$Music2.playing = true
	if musicChoice == 2:
		$Music3.playing = true
