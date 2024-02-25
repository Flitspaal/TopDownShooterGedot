extends Node2D

func _ready():
	spawn_mob()

func spawn_mob():
	var new_slime_mob = preload("res://mob_slime.tscn").instantiate()
	%SpawnPath.progress_ratio = randf()
	new_slime_mob.global_position = %SpawnPath.global_position
	add_child(new_slime_mob)

func _on_timer_timeout():
	spawn_mob()
	%PointCounter.add_score()
	
func _on_player_health_depleted():
	%GameOver.visible = true
	get_tree().paused = true
