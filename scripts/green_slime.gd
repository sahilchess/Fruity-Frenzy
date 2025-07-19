extends Node2D

const SPEED = 60
var direction = 1

@onready var ray_cast_left: RayCast2D = $RayCast_Left
@onready var ray_cast_right: RayCast2D = $RayCast_right
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	animated_sprite.play("idle")
	if ray_cast_left.is_colliding():
		direction=1
		animated_sprite.flip_h = false
	elif ray_cast_right.is_colliding():
		direction=-1
		animated_sprite.flip_h = true
	else:
		pass
	position.x += SPEED * delta * direction
	
