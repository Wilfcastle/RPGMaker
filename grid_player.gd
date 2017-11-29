extends "res://grid_character.gd"


func _ready():
    pass


func _physics_process(delta):
    var direction = Vector2()

    if Input.is_action_pressed("move_up"):
        direction.y = -1
    elif Input.is_action_pressed("move_down"):
        direction.y = 1
    elif Input.is_action_pressed("move_left"):
        direction.x = -1
    elif Input.is_action_pressed("move_right"):
        direction.x = 1
        
    route = [direction]
