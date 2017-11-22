extends TileMap

var half_cell_size = get_cell_size() / 2
var grid_size = Vector2(16, 16)
var grid = []


func _ready():
    for x in range(grid_size.x):
        grid.append([])
        for y in range(grid_size.y):
            grid[x].append(null)
            

func get_cell_content(cell=Vector2()):
    return grid[cell.x][cell.y]


func is_cell_vacant(old_position=Vector2(), direction=Vector2()):
    var cell = world_to_map(old_position) + direction
    if cell.x < grid_size.x and cell.x >= 0:
        if cell.y < grid_size.y and cell.y >= 0:
            return true if grid[cell.x][cell.y] == null else false
    return false


func update_child_position(child, new_position, direction):
    var cell = world_to_map(new_position)
    grid[cell.x][cell.y] = null
    
    var new_cell = cell + direction
    grid[new_cell.x][new_cell.y] = child
    
    var target_position = map_to_world(new_cell) + half_cell_size
    return target_position
