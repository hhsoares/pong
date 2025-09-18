extends Node2D

func _process(delta) -> void:
	$player1.position.x = -150
	$player2.position.x = 150

	#if Input.is_action_just_pressed("pause"):
	#	get_tree().paused = not get_tree().paused

	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()
