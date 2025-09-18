extends CharacterBody2D

@export var speed = 220

func _physics_process(delta: float) -> void:
	var dir := 0
	
	if Input.is_action_pressed("p1_up"):
		dir -= 1
	if Input.is_action_pressed("p1_down"):
		dir += 1
	
	velocity = Vector2(0, dir * speed)
	move_and_slide()
