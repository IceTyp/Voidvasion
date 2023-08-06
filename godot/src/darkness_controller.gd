extends Node

const ALL_NEIGHBOR_SIDES = [
		TileSet.CELL_NEIGHBOR_RIGHT_SIDE, 
		TileSet.CELL_NEIGHBOR_BOTTOM_SIDE,
		TileSet.CELL_NEIGHBOR_LEFT_SIDE,
		TileSet.CELL_NEIGHBOR_TOP_SIDE,
]
const TILEMAP_LAYER = 0

@export var approaching_tiles_atlas_coords: Array[Vector2i] = [Vector2i(0, 0)]
@export var map_size = Vector2i(64, 64)
@export_node_path("TileMap") var tile_map_path := ^".."

@onready var tile_map := get_node(tile_map_path) as TileMap


func _ready() -> void:
	var used_cells := tile_map.get_used_cells(TILEMAP_LAYER)
	used_cells.sort()
	
#	for cell in used_cells:
#		var atlas_coord := tile_map.get_cell_atlas_coords(TILEMAP_LAYER, cell)
#		if atlas_coord in approaching_tiles_atlas_coords:
#			print("cell ", cell, " is approaching")

	for coord in get_edge_darkness_coords():
		print("cell ", coord, " has approaching neighbor")


## returns all coords of cells that have at least one neighbor being not darkness
func get_edge_darkness_coords() -> Array[Vector2i]:
	var darkness_cells: Array[Vector2i] = []
	for x in map_size.x:
		for y in map_size.y:
			var coord := Vector2i(x, y)
			if not is_cell_darkness(coord):
				continue
			var has_empty_neighbor := false
			for neighbor_coord in get_all_neighbors(coord):
				if not is_cell_darkness(neighbor_coord):
					has_empty_neighbor = true
					break
			if has_empty_neighbor:
				darkness_cells.append(coord)
	return darkness_cells


## returns if the cell at coord is a darkness cell
func is_cell_darkness(coord: Vector2i) -> bool:
	if tile_map.get_cell_tile_data(TILEMAP_LAYER, coord) == null:
		return false
	return tile_map.get_cell_atlas_coords(TILEMAP_LAYER, coord) not in approaching_tiles_atlas_coords


## return the coordinates of all neigbors
func get_all_neighbors(coord: Vector2i) -> Array[Vector2i]:
	var ret: Array[Vector2i] = []
	for neighbor_side in ALL_NEIGHBOR_SIDES:
		ret.append(tile_map.get_neighbor_cell(coord, neighbor_side))
	return ret

