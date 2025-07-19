extends Area2D

@onready var animated_sprite_2d: AnimatedSprite2D = $"../AnimatedSprite2D"
@onready var explode: AudioStreamPlayer2D = $"../explode"



func _on_body_entered(body: Node2D) -> void:
	animated_sprite_2d.play("death")
	explode.play()
	queue_free()
