extends Area2D

# 130
# -300

# 200
# -500

# slowness is 50
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
signal slowness
signal jump_boost
signal speed_boost


func _ready() -> void:
	var csf = get_tree().current_scene.scene_file_path
	var lvl_num = csf.to_int()
	
	if lvl_num == 1:
		animated_sprite_2d.play("grass")
	if lvl_num == 2:
		animated_sprite_2d.play("sand")
	if lvl_num == 3:
		animated_sprite_2d.play("gold")
	if lvl_num == 4:
		animated_sprite_2d.play("ice")
		
				
func _on_body_entered(body: Node2D) -> void:
	emit_signal("jump_boost")
	animation_player.play("pickup")
	
