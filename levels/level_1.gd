extends Node2D
@onready var next_level: Area2D = $next_level


const FILE_BEGIN = "res://levels/level_"

func _on_body_entered(body: Node2D) -> void:
	print("ooooooddddddddddodododododo")
	var current_scene_file = get_tree().current_scene.scene_file_path
	var next_level_number = current_scene_file.to_int() + 1
		
	var next_level_path = FILE_BEGIN + str(next_level_number) + ".tscn"
