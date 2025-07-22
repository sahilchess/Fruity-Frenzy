extends CharacterBody2D


var SPEED = 130.0
var JUMP_VELOCITY = -150.0


@onready var movement_sprite: AnimatedSprite2D = $MovementSprite
@onready var jump: AudioStreamPlayer = $jump
@onready var effects: AnimatedSprite2D = $Effects



func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta	

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump.play()

	# Get the input direction -1,0,1
	var direction := Input.get_axis("move_left", "move_right")
	
	# turn the character
	if direction > 0:
		movement_sprite.flip_h = false
	elif direction < 0:
		movement_sprite.flip_h = true

	if is_on_floor():
		# play the run animation	
		if direction == 0:
			movement_sprite.play("idle")
		else:
			movement_sprite.play("run")
	else:
		movement_sprite.play("jump")
		
		
		
	if direction	:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
