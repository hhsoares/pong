extends CharacterBody2D

var speed = 225.0

var p1_score = 0
var p2_score = 0

@onready var p1_score_label = %p1_Label
@onready var p2_score_label = %p2_Label

func _ready():
	await get_tree().create_timer(1.5).timeout
	velocity = Vector2(-200, -200).normalized() * speed

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())

func _on_area_2d_area_entered(area: Area2D) -> void:

	if area.is_in_group("right_wall"):
		set_score_p1(p1_score + 1)
		print("p1 score: ", p1_score)

	if area.is_in_group("left_wall"):
		set_score_p2(p2_score + 1)
		print("p2 score: ", p2_score)

func set_score_p1(new_p1_score: int) -> void:
	p1_score =  new_p1_score
	p1_score_label.text = str(p1_score)
	reset_ball_p1()

func set_score_p2(new_p2_score: int) -> void:
	p2_score =  new_p2_score
	p2_score_label.text = str(p2_score)
	reset_ball_p2()

func reset_ball_p1() -> void:
	hide()
	await get_tree().create_timer(1.0).timeout
	position = Vector2(0, randf_range(-90, 90))
	velocity = Vector2(-200, -200).normalized() * speed
	show()

func reset_ball_p2() -> void:
	hide()
	await get_tree().create_timer(1.0).timeout
	position = Vector2(0, randf_range(-90, 90))
	velocity = Vector2(200, 200).normalized() * speed
	show()
