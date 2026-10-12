extends Node2D

@export var player_movement: GridMovement_C

func _ready() -> void:
	call_deferred("update_visibility")

func update_positions() -> void:
	for child: Sprite2D in get_children():
		var tween := create_tween()
		var target_pos = child.position.normalized() * 32 * player_movement.step_len
		tween.tween_property(child, "position", target_pos, 0.05)
	update_visibility()
		

func update_visibility():
	for child: Sprite2D in get_children():
		var target_cell_pos = player_movement.cell_pos + Vector2i(child.position.normalized()) * player_movement.step_len
		child.visible = player_movement.can_move(target_cell_pos)

func _on_grid_movement_c_step_len_changed() -> void:
	update_positions()


func _on_player_player_move() -> void:
	update_visibility()
