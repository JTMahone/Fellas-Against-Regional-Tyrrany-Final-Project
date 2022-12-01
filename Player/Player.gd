extends KinematicBody2D



var speed = 500
var health = 3
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
		$BulletSoundEffect.play()
	if Input.is_action_just_released("shoot"):
		$Idle.show()
		$Attack.hide()
	velocity = velocity.normalized() * speed
	
func damage(d):
	health -= d
	if health <= 0:
		queue_free()

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
	if get_tree().current_scene.name == "Level1":
		if position.x > 528 and position.x < 645:
			if position.y >522:
				var _scene = get_tree().change_scene("res://Levels/Level2.tscn")


func die():
	queue_free()
