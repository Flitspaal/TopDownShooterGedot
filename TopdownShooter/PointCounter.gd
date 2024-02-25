extends Label

var score = 0
var multiplier = 1 #set value is 1
var score_add = 1

func _ready():
	self.text = str(score)

func add_score():
	if (score >= 0):
		score += score_add * multiplier
		self.text = str(score)
	
func remove_score():
	if (score >= 0):
		score -= 1 
		self.text = str(score)
