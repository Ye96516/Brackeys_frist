extends CharacterBody2D


const SPEED = 140.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("k") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	
	var direction = Input.get_axis("a", "d")
	if direction>0:
		$AnimatedSprite2D.flip_h=false
	elif direction<0:
		$AnimatedSprite2D.flip_h=true
		
	if is_on_floor():
		if direction==0:
			$AnimatedSprite2D.play("idle")
		else:
			$AnimatedSprite2D.play("run")
	else:
		$AnimatedSprite2D.play("jump")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
