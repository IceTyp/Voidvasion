@tool
class_name TileMapCleaner
extends Node
## utility functions to clean tilemaps
## like removing all cells with darkness tiles


const TILEMAP_LAYER = 0
const TILESET_SRC_ID = 0
const DARKNESS_TILE_ALT_ID = 2


@export_node_path("TileMap") var tile_map_path := ^".."
## when clicked removes all cells from the tilemap which use the darkness tile
@export var clear_darkness_cells := false:
	set(clear):
		if not clear:
			return
		do_clear_darkness_cells()

var tile_map: TileMap


func do_clear_darkness_cells() -> void:
	if tile_map == null:
		tile_map = get_node(tile_map_path)
	for coord in tile_map.get_used_cells(TILEMAP_LAYER):
		var cell_alt_id := tile_map.get_cell_alternative_tile(TILEMAP_LAYER, coord)
		if cell_alt_id == DARKNESS_TILE_ALT_ID:
			tile_map.erase_cell(TILEMAP_LAYER, coord)
			print("erased darkness cell at ", coord)
