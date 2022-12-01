extends Node2D


export var initial_position = Vector2.ZERO
var direction = Vector2(1.5,0)
var wobble = 10.0
export var health = 1
onready var CarrotDrop = load("res://Enemies/CarrotDrop.tscn")
export var speed = 350


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _physics_process(_delta):
	position += direction
	position.y = initial_position.y - sin(position.x/20)*wobble
	if position.x >= 1024:
		direction = -direction

func damage(d):
	health -= d
	if health <= 0:
		Global.update_score(100)
		var Effects = get_node_or_null("/root/Level1/Effects")
		if Effects != null:
			var drop = CarrotDrop.instance()
			drop.global_position = global_position
			Effects.add_child(drop)
			Global.update_score(100)
		Global.update_score(100)
		queue_free()



func _on_Area2D_body_entered(body):
	if body.name == "Player":
		body.damage(1)
		damage(1)
	else:
		direction = -direction

