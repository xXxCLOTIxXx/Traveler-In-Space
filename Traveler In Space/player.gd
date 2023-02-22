extends KinematicBody2D

var speed: int = 6
var x = 0
var y = 0
var velosity = Vector2()

var divisionX = 2
var divisionY = 2


var isOver = false

onready var playerImage = $player

func _ready():
	start()


func start():
	velosity = Vector2()
	playerImage.play("default")
	position.x = get_viewport().size.x / divisionX
	position.y = get_viewport().size.y / divisionY
	isOver = false

func _physics_process(delta):
	if isOver:return
	var screenX = get_viewport().size.x
	var screenY =  get_viewport().size.y
	if is_on_wall() or is_on_floor() or is_on_ceiling():
		isOver = true
		playerImage.play("rip")


	if Input.is_action_pressed("up"):
		velosity.y-= speed
	elif Input.is_action_pressed("down"):
		velosity.y+= speed
	elif Input.is_action_pressed("left"):
		velosity.x-= speed
	elif Input.is_action_pressed("right"):
		velosity.x+= speed
	
	move_and_slide(velosity, Vector2.UP)
	position.x = clamp(position.x, 0 , screenX)
	position.y = clamp(position.y, 0 , screenY)
