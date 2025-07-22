extends Node2D

@onready var powerup: AudioStreamPlayer = $powerup
@onready var area_2d: Area2D = $Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $Area2D/AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $Area2D/CollisionShape2D





func _on_body_entered(body: Node2D) -> void:
	collision_shape_2d.disable()
	animated_sprite_2d.hide()
	Player.SPEED = 150.0
	powerup.play()
	queue_free()
