extends Node

signal on_player_move()
signal on_red_tile
signal on_green_tile
signal player_outside_screen(direction: Vector2i)
signal find_player(player: Player)
signal next_level
signal potion_added(potion: Potion.Type)
signal potion_removed

var game_objects: GameObjects = null
var game_entities: GameEntities = null

var last_player_cp: Vector2i = Vector2i.ZERO
