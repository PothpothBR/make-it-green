extends Node2D

@export
var debug: bool = true

@onready var map: TileMap = get_node("TileMap")

var x = 0
var y = 0

var w = 40
var h = 40

var WFCMap

func loadData():
	var file: FileAccess = FileAccess.open("res://data/tiles.json", FileAccess.READ)
	var data: Dictionary = JSON.parse_string(file.get_as_text())
	file.close()
	return data

func findDepend(index, tiles):
	for depend in tiles:
		if depend.index[0] == index[0] && depend.index[1] == index[1]:
			return depend
	print("Dependencia para o index", index, "nao existe")
	
func _ready():
	var data: Dictionary = loadData()
	
	for layer in data.layers:
		map.add_layer(layer)
		
	for tile in data.tiles:
		if tile.has("depends"):
			tile.depends = findDepend(tile.depends, data.tiles)
	
	WFCMap = MapBuffer.new(Vector2i(w, h), data.tiles)
	while y < h:
		var pos = Vector2i(x, y)
		var local = WFCMap.collapse(pos)

		map.set_cell(
			local.layer,
			pos,
			local.source,
			Vector2i(local.index[0], local.index[1])
		)

		if local.has("depends"):
			map.set_cell(
				local.depends.layer,
				pos,
				local.depends.source,
				Vector2i(local.depends.index[0], local.depends.index[1])
			)

		x += 1
		if x >= w:
			y += 1
			x = 0
