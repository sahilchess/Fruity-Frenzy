extends CharacterBody2D


var SPEED = PlayerStats.speed
var JUMP_VELOCITY = PlayerStats.jump_velocity

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var effects: AnimatedSprite2D = $Effects
@onready var jump_sound: AudioStreamPlayer = $jump_sound



func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta	

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump_sound.play()

	# Get the input direction -1,0,1
	var direction := Input.get_axis("move_left", "move_right")
	
	# turn the character
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true

	if is_on_floor():
		# play the run animation	
		if direction == 0:
			animated_sprite_2d.play("idle")
		else:
			animated_sprite_2d.play("run")
	else:
		animated_sprite_2d.play("jump")
		
		
		
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
