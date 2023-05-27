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
