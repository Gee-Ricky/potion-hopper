extends Node

@export var camera: Camera2D
@export var next_level: String
@export var scene_path := &""
var level_ended := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.player_outside_screen.connect(pan_level)
	Global.find_player.connect(find_player)
	Global.next_level.connect(goto_next_level)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func pan_level(direction: Vector2i) -> void:
	if !level_ended:
		camera.pan_camera(direction)
		for entity_key in Global.game_entities.entity_dict:
			var entity := Global.game_entities.entity_dict[entity_key]
			if not entity is Player and  entity.get_viewport_rect().has_point(entity.get_canvas_transform() * entity.position):
				entity.get_node("GridMovement_C").teleport(entity.get_node("GridMovement_C").init_pos)

func find_player(player: Player) -> void:
	camera.find_player(player)

func goto_next_level():
	level_ended = true
	SceneLoader.load_scene(next_level)
	
	

func _input(event: InputEvent) -> void:
	
	if (event.is_action_pressed("reset")):
		print("reset")
		SceneLoader.load_scene(scene_path);
	elif (event.is_action_pressed("demo_reset")):
		$".".free()
		SceneLoader.load_scene("res://game_scenes/title_screen.tscn")
		Global.last_player_cp = Vector2.ZERO
		
