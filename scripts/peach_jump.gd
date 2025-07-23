extends Node2D

@onready var powerup: AudioStreamPlayer = $powerup
@onready var area_2d: Area2D = $Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $Area2D/AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $Area2D/CollisionShape2D

# 130
# -300

# 200
# -500

# slowness is 50


func _on_area_2d_body_entered(body: Node2D) -> void:
	collision_shape_2d.disabled = true
	animated_sprite_2d.hide()
	powerup.play()
	await powerup.finished
	queue_free()
