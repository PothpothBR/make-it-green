extends Node

static func salvar(save):
	var db = SQLite.new()
	db.path = "res://master"
	db.verbosity_level = SQLite.NORMAL
	db.open_db()
	
	var selected = db.select_rows("saves", "", ["*"])
	if selected.is_empty():
		db.insert_row("saves", save["saves"])
	db.delete_rows("progressao_jogador", "id_saves = 1")
	db.insert_row("progressao_jogador", save["progressao_jogador"])
	
	db.close_db()
	
static func carregar(save):
	var db = SQLite.new()
	db.path = "res://master"
	db.verbosity_level = SQLite.NORMAL
	db.open_db()
	
	var selected = db.select_rows("saves", "", ["data", "dificuldade"])
	if selected.is_empty():
		db.close_db()
		return save
	save["saves"] = selected[0]
	
	selected = db.select_rows("progressao_jogador", "id_saves = 1", ["id_saves", "nome", "points", "x", "y"])
	save["progressao_jogador"] = selected[0]
	
	db.close_db()
	
	return save
