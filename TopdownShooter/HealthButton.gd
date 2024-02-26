extends Button

var cost = 10

func _ready():
	var button = Button.new()
	button.text = str(cost)
	#button.pressed.connect(self._button_pressed)



