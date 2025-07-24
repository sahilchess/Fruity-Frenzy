extends Area2D

# 130
# -300

# 200
# -500

# slowness is 50
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var powerup: AudioStreamPlayer = $powerup


func _on_body_entered(body: Node2D) -> void:
	print("hihihiih")
	animated_sprite_2d.hide()
	collision_shape_2d.disabled = true
	PlayerStats.jump_velocity = PlayerStats.jump_velocity-50
	powerup.play()
	await powerup.finished
	



func _on_timer_timeout() -> void:
	PlayerStats.jump_velocity = -300
	queue_free()
