extends Node

func _on_play_pressed() -> void:
	
	SceneLoader.load_scene("res://game_scenes/test_level.tscn");

func _on_credits_pressed() -> void:
	SceneLoader.load_scene("res://game_scenes/credits.tscn")


func _on_exit_pressed() -> void:
	get_tree().quit()
