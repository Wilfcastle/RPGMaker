extends AnimatedSprite


func _ready():
    pass


func face_direction(direction):
    if direction == Vector2(0, -1):
        set_frame(0)
    elif direction == Vector2(0, 1):
        set_frame(2)
    elif direction == Vector2(1, 0):
        set_frame(1)
    elif direction == Vector2(-1, 0):
        set_frame(3)
