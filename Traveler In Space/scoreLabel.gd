extends Label

var score = 0
var addScore = 0.3
var isOver = false

func showText(text):
	self.text =  text


func _process(delta):
	if isOver: return
	score+=addScore
	showText('Score: ' +str(int(score)))
