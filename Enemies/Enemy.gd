extends KinematicBody2D

var y_positions = [50,100,150,450,500]
var initial_position = Vector2.ZERO
var direction = Vector2(1.5,0)
var wobble = 10.0

export var speed = 350

func _ready():
	pass

func _physics_process(_delta):
	position += direction
	position.y = initial_position.y - sin(position.x/20)*wobble
	if position.x >= 1200:
		direction = -direction
func die():
	queue_free()


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		die()
	else:
		direction = -direction

