extends KinematicBody2D

const DEFAULT_SPEED = 400

var target_position = Vector2()
var target_direction = Vector2()
var is_moving = false

var grid


func _ready():
    grid = get_parent()
    set_physics_process(true)


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

    if not is_moving and direction != Vector2():
        target_direction = direction
        if grid.is_cell_vacant(get_position(), direction):
            target_position = grid.update_child_position(self, get_position(), direction)
            is_moving = true
    if is_moving:
        var velocity = DEFAULT_SPEED * target_direction * delta

        var current_position = get_position()
        var distance_to_target = current_position.distance_to(target_position)
        var move_distance = velocity.length()

        if move_distance > distance_to_target:
            velocity = target_direction * distance_to_target
            is_moving = false

        move_and_collide(velocity)