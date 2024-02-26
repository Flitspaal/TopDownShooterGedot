extends Label

var score = 0
var multiplier = 1 #set value is 1
var score_add = 1
var cost = 10

func _ready():
	self.text = str(score)

func add_score():
	if (score >= 0):
		score += score_add * multiplier
		self.text = str(score)
	
func remove_score(t):
	#if (t >= score):
		score -= t 
		self.text = str(score)
		return
	#return false


func _on_health_button_button_down():
	if score > cost:
		remove_score(cost)
		%Player.add_health(10)
