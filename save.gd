class_name Save

const DB_NAME: String = "res://data/master.db"

static func openDb() -> SQLite:
	var db = SQLite.new()
	db.path = DB_NAME
	db.verbosity_level = SQLite.NORMAL
	db.open_db()
	return db

static func criar():
	var db = openDb()
	pass
	
static func migrar():
	var db = openDb()
	pass

static func salvar(save):
	var db = openDb()
	
	var selected = db.select_rows("saves", "", ["*"])
	if selected.is_empty():
		db.insert_row("saves", save["saves"])
	db.delete_rows("progressao_jogador", "id_saves = 1")
	db.insert_row("progressao_jogador", save["progressao_jogador"])
	
	db.close_db()
	
static func carregar(save):
	var db = openDb()
	
	var selected = db.select_rows("saves", "", ["data", "dificuldade"])
	if selected.is_empty():
		db.close_db()
		return save
	save["saves"] = selected[0]
	
	selected = db.select_rows("progressao_jogador", "id_saves = 1", ["id_saves", "nome", "points", "x", "y"])
	save["progressao_jogador"] = selected[0]
	
	db.close_db()
	
	return save
