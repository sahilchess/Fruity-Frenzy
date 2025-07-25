extends Area2D

# 130
# -300

# 200
# -500

# slowness is 50
@onready var animation_player: AnimationPlayer = $AnimationPlayer
signal slowness
signal jump_boost
signal speed_boost


func _on_body_entered(body: Node2D) -> void:
	emit_signal("jump_boost")
	animation_player.play("pickup")
	
