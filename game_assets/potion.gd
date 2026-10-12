extends Node
class_name Potion

enum Type { RESET, PURPLE, SPEED_UP, STRENGTH}

static var data = {
	Type.RESET: {
		"effect": _reset
	},
	
	Type.SPEED_UP: {
		"effect": _speed_up
	},
	
	Type.PURPLE: {
		"effect": _reset
	},
	
	Type.STRENGTH: {
		"effect": _strength
	},
}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

static func _speed_up(target: Node2D):
	var movement = target.get_node_or_null("GridMovement_C")
	if movement:
		movement.set_step_length(2)
		
static func _reset(target: Node2D):
	var movement = target.get_node_or_null("GridMovement_C")
	if movement:
		movement.set_step_length(1)
		movement.push_strength = 1

static func _strength(target: Node2D):
	var movement = target.get_node_or_null("GridMovement_C")
	if movement:
		movement.push_strength = 50
	
