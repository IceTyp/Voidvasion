extends TileMap

const TILEMAP_LAYER := 0
const TILESET_SRC_ID := 0
const DARKNESS_ALT_TILE_ID := 2

@export var upper_left_corner := Vector2i(0, 7)
@export var lower_right_corner := Vector2i(63, 63)


func _ready() -> void:
	fill_empty_cells(DARKNESS_ALT_TILE_ID)


## fills all cells which are empty (not in used cells) with tiles of the given
## alt_tile_id
## only fills cells between the `upper_left_corner` and the `lower_right_corner`
##
## param alt_tile_id: the alternative_tile id of the tile used for filling
func fill_empty_cells(alt_tile_id: int) -> void:
	var used_cells := get_used_cells(TILEMAP_LAYER)
	
	for cell in used_cells:
		upper_left_corner.x = mini(upper_left_corner.x, cell.x)
		upper_left_corner.y = mini(upper_left_corner.y, cell.y)
		lower_right_corner.x = maxi(lower_right_corner.x, cell.x)
		lower_right_corner.y = maxi(lower_right_corner.y, cell.y)
	
	for x in range(upper_left_corner.x, lower_right_corner.x + 1):
		for y in range(upper_left_corner.y, lower_right_corner.y + 1):
			var coord := Vector2i(x,y)
			if coord not in used_cells:
				set_cell(
						TILEMAP_LAYER, 
						coord, 
						TILESET_SRC_ID, 
						Vector2i.ZERO, 
						alt_tile_id
				)
