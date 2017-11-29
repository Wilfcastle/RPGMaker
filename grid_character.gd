extends KinematicBody2D

var speed = 400
var target_position = Vector2()
var target_direction = Vector2()
var is_moving = false
var grid
var route = []
var loop_route = false


func _ready():
    grid = get_parent()
    set_physics_process(true)


func _physics_process(delta):
    if not is_moving:
        var direction = route.pop_front()
        if loop_route:
            route.push_back(direction)
        if direction and direction != Vector2():
            get_node('AnimatedSprite').face_direction(direction)
            target_direction = direction
            if grid.is_cell_vacant(get_position(), direction):
                target_position = grid.update_child_position(self, get_position(), direction)
                is_moving = true
    if is_moving:
        var velocity = speed * target_direction * delta

        var current_position = get_position()
        var distance_to_target = current_position.distance_to(target_position)
        var move_distance = velocity.length()

        if move_distance > distance_to_target:
            velocity = target_direction * distance_to_target
            is_moving = false

        move_and_collide(velocity)
