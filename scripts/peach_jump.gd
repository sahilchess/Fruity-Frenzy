extends Area2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var powerup: AudioStreamPlayer = $powerup
@onready var level_up: AudioStreamPlayer = $level_up


func _on_body_entered(body: Node2D) -> void:
	print("hihihiih")
	animated_sprite_2d.hide()
	collision_shape_2d.disabled= true
	level_up.play()
	await level_up.finished
	queue_free()
