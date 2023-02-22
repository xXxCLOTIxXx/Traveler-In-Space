extends KinematicBody2D

var velocity = Vector2()
var speed = 100
var static_speed = speed

var addSpeed = 6

func _ready():
	start()

func start():
	speed = static_speed
	position.x = int(rand_range(-10,-1000))
	position.y = -int(rand_range(-10,-1000))


func _physics_process(delta):
	var screenX = get_viewport().size.x
	var screenY =  get_viewport().size.y
	velocity.y+= speed
	velocity.x+= int(rand_range(-speed,speed)) / int(rand_range(1,5)) + int(rand_range(-10,10))
	move_and_slide(velocity, Vector2.UP)
	if position.x > screenX or position.y > screenY:
		position.x = int(rand_range(100, get_viewport().size.x))
		position.y = -130
		speed+=addSpeed
	velocity = velocity.normalized() * speed
