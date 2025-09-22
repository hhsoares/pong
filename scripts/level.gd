extends Node2D

@onready var ball = $Ball

func _process(delta) -> void:
	$player1.position.x = -150
	$player2.position.x = 150

	if Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()

	if Input.is_action_just_pressed("menu"):
		get_tree().change_scene_to_file("res://scenes/menu.tscn")

	if ball.p1_score >= 5 or ball.p2_score >= 5:
		win_check()
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")

func win_check() -> void:
	if ball.p1_score >= 5:
		Global.who_won = "PLAYER  1"
	elif ball.p2_score  >= 5:
		Global.who_won = "PLAYER  2"
	print("winner is: ", Global.who_won)
