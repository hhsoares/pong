extends Node2D

@onready var win_label = %win

func _process(delta) -> void:

	win_label.text = str(Global.who_won) + "  WON !"

	if Input.is_action_just_pressed("reset"):
		get_tree().change_scene_to_file("res://scenes/level.tscn")
