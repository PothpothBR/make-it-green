extends Node2D

@export
var debug: bool = true

@onready var map: TileMap = get_node("TileMap")

func loadData():
	var file: FileAccess = FileAccess.open("res://data/tiles.json", FileAccess.READ)
	var data: Dictionary = JSON.parse_string(file.get_as_text())
	file.close()
	return data
	
func findModel(id: int, models: Array):
	for model in models:
		if model.id == id:
			return model
	print("Modelo para o id", id, "nao existe")

func calcPairEntropy(targetBind, touchBind, tiles):
	pass

func calcEntropy(upBinds, downBinds, leftBinds, rightBinds, globalBinds, tiles: Array):
	if upBinds: pass
		# calcPairEntropy(upBinds.down, )
	if downBinds: pass
	if leftBinds: pass
	if rightBinds: pass
	if globalBinds: pass
	
	return tiles.pick_random()
	

func generateTerrain(tiles: Array, size: Vector2i):
	var buffer: Array = []
	
	for y in range(size[1]):
		var line: Array = []
		buffer.append(line)
		for x in range(size[0]):
			# 1* eu assumo que todos as celulas podem conter qualquer tile
			# 2* pego a proxima posição
			# 3* calculo a entropia da celula
			#     3.1* olho em todas as celulas em volta da celula
			#     3.2* para cada uma reduzo a possibilidade de escolha da celula
			#     3.3* se a celula não existir nada é reduzido (pois todas as escolhas são posiveis)
			# 4* escolho um tile aleatório (restringido pelo universo de possibilidades)
			# 5* salvo o tile escolhido na celula
			# 6* volto a etapa 2* até acabarem as ceulas
			# 7* salvo a ultima celula
			var up = null
			var down = null
			var left = null
			var right = null
			var global = null
			if y > 0: up = buffer[y-1][x].binds
			if y < size[1]: down = null
			if x > 0: left = buffer[y][x-1].binds
			if x < size[0]: right = null
			
			var possibilities = calcEntropy(up, down, left, right, global, tiles)
			
			#map.set_cell(tile.layer, Vector2i(x, y), tile.source, Vector2i(tile.index[0], tile.index[1]))
			line.append(possibilities)
			pass

func _ready():
	var data: Dictionary = loadData()
	
	for layer in data.layers:
		map.add_layer(layer)
		
	for tile in data.tiles:
		tile.binds = findModel(tile.inherit, data.models)
	
	generateTerrain(data.tiles, Vector2i(4, 4))
	
	map.set_cell(0, Vector2i(0, 0), 3, Vector2i(0, 1))

func _process(_delta):
	pass
