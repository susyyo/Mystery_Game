extends CharacterBody2D

@export var speed := 200.0
@onready var anim = $AnimatedSprite2D

func _physics_process(_delta):
	var input_vector = Vector2.ZERO
	
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()

	velocity = input_vector * speed
	move_and_slide()

	update_animation(input_vector)
	
func update_animation(direction: Vector2):
	if direction == Vector2.ZERO:
		anim.play("idle")
		return

	if abs(direction.x) > abs(direction.y):
		if direction.x > 0:
			anim.flip_h = false
			anim.play("walk_side")
		else:
			anim.flip_h = true
			anim.play("walk_side")
	else:
		if direction.y > 0:
			anim.play("walk_down")
		else:
			anim.play("walk_up")
