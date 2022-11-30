extends KinematicBody2D

var player = get_node_or_null("res://Player/Player.tscn")
export var speed = 350
onready var tween = get_node("Tween")

func _ready():
	pass

func _physics_process(_delta):
	tween.interpolate_property($Area2D,"position",Vector2(0, 0), Vector2(100, 100), 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()

func die():
	queue_free()

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		die()
