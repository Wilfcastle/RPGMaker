extends "res://grid_character.gd"

func _ready():
    route = [Vector2(1, 0), Vector2(1, 0), Vector2(0, 1), Vector2(-1, 0), Vector2(-1, 0), Vector2(0, -1)]
    loop_route = true