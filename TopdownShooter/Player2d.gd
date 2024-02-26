extends CharacterBody2D

signal health_depleted

var maxHealth = 100
var health = 100.0
const DMG_RATE = 5.0

func _ready():
	%ProgressBar.max_value = health


func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 600
	move_and_slide()
	
	if (velocity.length() > 0.0):
		%HappyBoo.play_walk_animation()
	else:
		%HappyBoo.play_idle_animation()
	
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= DMG_RATE * overlapping_mobs.size() * delta
		%ProgressBar.value = health
		if health <= 0.0:
			health_depleted.emit()
		
			
func add_health(t):
	health += t
	if health > maxHealth:
		health = maxHealth




