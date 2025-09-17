extends CharacterBody2D

@export var speed = 200

func _physics_process(delta: float) -> void:
	var dir := 0
	
	if Input.is_action_pressed("p2_up"):
		dir -= 1
	if Input.is_action_pressed("p2_down"):
		dir += 1
		
	velocity = Vector2(0, dir * speed)
	move_and_slide()
