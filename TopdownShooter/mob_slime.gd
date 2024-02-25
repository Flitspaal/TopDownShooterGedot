extends CharacterBody2D

var health = 5

@onready var Player = get_node("/root/Game/Player")

func _ready():
	%Slime.play_walk()
	%ProgressBarSlime.max_value = health
		
	
func _physics_process(delta): #move slime
	var direction = global_position.direction_to(Player.global_position)
	velocity = direction * 350
	move_and_slide()
	
func take_damage():
	health -= 1
	%Slime.play_hurt()
	%ProgressBarSlime.value = health
	
	if (health == 0):
		queue_free()
		
		const SMOKE_EXPLOSION = preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_EXPLOSION.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
