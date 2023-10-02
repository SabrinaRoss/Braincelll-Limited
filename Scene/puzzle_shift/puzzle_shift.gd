extends Area2D

var tiles = []
var solved = []
var mouse = false
var xc = 300 + 61
var yc = 300 + 39
# Called when the node enters the scene tree for the first time.
func _ready():
	start_game()

func start_game():
	tiles = [$Tile1, $Tile2, $Tile3, $Tile4, $Tile5, $Tile6, $Tile7, $Tile8, $Tile9]
	solved = tiles.duplicate()
	shuffle_tiles()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and mouse:
		var mouse_copy = mouse.duplicate()
		#print(mouse.position)
		mouse = false
		var rows = int(mouse_copy.position.y/yc)
		var cols = int(mouse_copy.position.x/xc)
		print(rows, ", ", cols)
		
		# Uncertain what the following means
		var pos= rows * 3 + cols
		print(tiles[pos])
		check_neighbors(rows, cols)
		if tiles == solved:
			print("Congrats!!")
			
func shuffle_tiles():
	var previous = 99
	var previous1 = 98
	for i in range(0, 1000):
		var tile = randi() % 9
		if tiles[tile] != $Tile9 and tile != previous and tile != previous1:
			var rows = int(tiles[tile].position.y / yc)
			var cols = int(tiles[tile].position.x / xc)
			check_neighbors(rows,cols)
			previous1 = previous
			previous = tile
		
		
func check_neighbors(rows, cols):
	var empty = false
	var done = false
	var pos = rows * 3 + cols
	while !empty and !done:
		var new_pos = tiles[pos].position
		
		# Vertical position swap
		if rows < 2:
			new_pos.y += yc
			empty = find_empty(new_pos, pos)
			new_pos.y -= yc
		if rows > 0:
			new_pos.y -= yc
			empty = find_empty(new_pos, pos)
			new_pos.y += yc
			
		# Horizontal position swap
		if cols < 2:
			new_pos.x += xc
			empty = find_empty(new_pos, pos)
			new_pos.x -= xc
		if cols > 0:
			new_pos.x -= xc
			empty = find_empty(new_pos, pos)
			new_pos.x += xc
		
		done = true
			
# Finding the empty position in between two tiles
func find_empty(posit, pos):
	var new_rows = int(posit.y/yc)
	var new_cols = int(posit.x/xc)
	var new_pos = new_rows * 3 + new_cols
	
	if tiles[new_pos] == $Tile9:
		swap_tiles(pos, new_pos)
		return true
	return false

#Algorithm for the actual switching of tiles
func swap_tiles(tile_src, tile_dst):
	var temp_pos = tiles[tile_src].position
	tiles[tile_src].position = tiles[tile_dst].position
	tiles[tile_dst].position = temp_pos

	var temp_tile = tiles[tile_src]
	tiles[tile_src] = tiles[tile_dst]
	tiles[tile_dst] = temp_tile
	
# Takes in event input... need better explanation
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		mouse = event
