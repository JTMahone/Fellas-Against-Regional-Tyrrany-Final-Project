extends KinematicBody2D

var velocity = Vector2.ZERO
var speed = 500.0
var damage = 1.0
var face = Vector2.ZERO

onready var player = get_node("/root/Level1/Player")
# Called when the node enters the scene tree for the first time.
func _ready():
	global_position = Vector2(player.global_position.x + 40,player.global_position.y)
	velocity = Vector2(speed,0).rotated(rotation)
	pass

func _physics_process(_delta):
	velocity = move_and_slide(velocity, Vector2.ZERO)
	position.x = wrapf(position.x, 0, Global.VP.x)
	position.y = wrapf(position.y, 0, Global.VP.y)

func _on_Timer_timeout():
	queue_free()



func _on_Area2D_body_entered(body):
	if "Box" in body.name:
		queue_free()
	if body.name == "Player":
		queue_free()
	if body.name == "Enemy":
		queue_free()
		body.damage(1)
