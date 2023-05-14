class_name MapBuffer

var buffer: Array = Array()
var size: Vector2i
var tiles: Array

func _init(size: Vector2i, tiles: Array) -> void:
	self.size = size
	self.tiles = tiles
	# inicia todas as posições de tiles
	for y in range(size.y):
		var aux_buff: Array = Array()
		for x in range(size.x):
			# null significa que existem todas as possibilidades ainda
			aux_buff.append(null)
		buffer.append(aux_buff)

# observa uma posição do mapa
func observe(pos: Vector2i) -> Array:
	var local = buffer[pos.y][pos.x]
	
	# se não existir valor nessa região significa que é entropia maxima
	if local == null: local = tiles
	return local

# collapsa um local e propaga seu efeito
func collapse(pos: Vector2i) -> Dictionary:
	assert(pos.x <= size.x && pos.y <= size.y && pos.x >= 0 && pos.y >= 0)
	
	# calcula a entropia da região, para cada ponto de estabilidade
	# é como uma ficha em um sorteio
	var local = observe(pos)
	
	if local.size() != 1:
		var expand_locals: Array = Array()
		
		# espande em um vetor as possibilidades
		var _i: int = 0
		for locals in local:
			for _e in range(locals.stability):
				expand_locals.append(locals)
			_i += 1
		
		# pega uma das possibilidades ponderadas
		local = [expand_locals.pick_random()]
	else:
		buffer[pos.y][pos.x] = local
		propageY(local, pos)
		return local[0]
		
	
	buffer[pos.y][pos.x] = local
	
	# propaga os efeitos da redução de entropia
	# para esquerda
	propageX(local, pos)
	propageY(local, pos)

	return local[0]
	
func propage(aux_local, aux_pos, bind_local, bind_asside):
		# pega as possibilidades de encaixe, para a lista de encaixes disponiveis
		aux_local = observe(aux_pos).filter(
			func(cell):
				for aux_cell in aux_local:
					if aux_cell.binds.get(bind_local) == cell.binds.get(bind_asside):
						return true
				return false
		)
		
		# se a entropia da célula for igual a entropia máxima pare
		if aux_local.size() == tiles.size(): return null
		
		if aux_local.size() == 0:
			aux_local = tiles
		
		buffer[aux_pos.y][aux_pos.x] = aux_local
		
		return aux_local
	
func propageX(aux_local, pos):
	for x in range(pos.x+1, size.x):
		var aux_pos = Vector2i(x, pos.y)
		
		aux_local = propage(aux_local, aux_pos, "right", "left")
		if aux_local == null: return
		
func propageY(aux_local, pos):
	for y in range(pos.y+1, size.y):
		var aux_pos = Vector2i(pos.x, y)
		
		# pega as possibilidades de encaixe, para a lista de encaixes disponiveis
		aux_local = observe(aux_pos).filter(
			func(cell):
				for aux_cell in aux_local:
					if aux_cell.binds.get("down") == cell.binds.get("up"):
						return true
				return false
		)
		
		# se a entropia da célula for igual a entropia máxima retorne
		if aux_local.size() == tiles.size(): break
		
		propageXR(aux_local, aux_pos)
		
		if aux_local.size() == 0:
			aux_local = tiles
		
		buffer[aux_pos.y][aux_pos.x] = aux_local
	
func propageXR(aux_local, pos):
	for x in range(1, pos.x+1):
		var aux_pos = Vector2i(pos.x-x, pos.y)
		
		aux_local = propage(aux_local, aux_pos, "left", "right")
		if aux_local == null: return
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
