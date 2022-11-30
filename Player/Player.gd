extends KinematicBody2D



var speed = 500
var health = 1
var velocity = Vector2()
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
		$MuzzleFlash.show()
	if Input.is_action_just_released("shoot"):
		$MuzzleFlash.hide()
	velocity = velocity.normalized() * speed
	

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
