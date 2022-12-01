extends KinematicBody2D



var speed = 500
var health = 1
var velocity = Vector2()
var nose = Vector2(0,-60)

onready var Bullet = load("res://Player/Bullet.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity.x += speed
	if Input.is_action_pressed("left"):
		velocity.x -= speed
	if Input.is_action_pressed("down"):
		velocity.y += speed
	if Input.is_action_pressed("up"):
		velocity.y -= speed
	if Input.is_action_just_pressed("shoot"):
		$Idle.hide()
		$Attack.show()
	if Input.is_action_just_released("shoot"):
		$Idle.show()
		$Attack.hide()
	velocity = velocity.normalized() * speed
	

func _physics_process(_delta):
	get_input()
	velocity = move_and_slide(velocity)
	if Input.is_action_just_pressed("shoot"):
		var Effects = get_node_or_null("/root/Level1/Effects")
		if Effects != null:
			var bullet = Bullet.instance()
			bullet.global_position = global_position + nose.rotated(rotation)
			bullet.rotation = rotation
			Effects.add_child(bullet)

func damage(d):
	health -= d
	if health <= 0:
		Global.update_lives(-1)
		queue_free()

func die():
	queue_free()
