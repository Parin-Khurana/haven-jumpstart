extends CharacterBody2D

const SPEED = 250.0
const JUMP_VELOCITY = -500.0
const FALL_LIMIT = 600.0


func _physics_process(delta: float) -> void:
	# Add gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Restart if player falls off the level
	if global_position.y > FALL_LIMIT:
		get_tree().reload_current_scene()
		return

	# Handle jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction
	var direction := Input.get_axis("ui_left", "ui_right")

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# Move the player
	move_and_slide()
