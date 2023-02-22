extends Node2D

onready var lbl = get_node("Label")
onready var player = get_node("player")
onready var btn = get_node("restart")
onready var mixer = get_node("AudioStream")


func on_click():
	lbl.score=0
	lbl.showText("Score: 0")
	player.start()
	for i in range(40):
		get_node("meteorite"+str(i+1)).start()


func _process(delta):
	if not mixer.is_playing():
		mixer.play()
	lbl.isOver = player.isOver
	if btn.is_pressed():
		on_click()
