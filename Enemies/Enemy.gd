extends Node2D


var y_positions = [50,100,150,450,500]
var initial_position = Vector2.ZERO
var direction = Vector2(1.5,0)
var wobble = 10.0

export var speed = 350


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _physics_process(_delta):
	position += direction
	position.y = initial_position.y - sin(position.x/20)*wobble
	if position.x >= 1200:
		direction = -direction
func die():
	queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		die()
	else:
		direction = -direction

