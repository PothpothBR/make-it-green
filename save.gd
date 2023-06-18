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
	db.create_table("saves", {
		"id": {"data_type":"int", "primary_key": true, "auto_increment": true, "not_null": true},
		"data": {"data_type": "text", "not_null": true},
		"dificuldade": {"data_type": "text", "not_null": true}
	})
	db.create_table("itens", {
		"id": {"data_type":"int", "primary_key": true, "auto_increment": true, "not_null": true},
		"nome": {"data_type": "text", "not_null": true},
		"descricao": {"data_type": "text"},
		"valor": {"data_type": "real", "not_null": true},
		"fator": {"data_type": "real"}
	})
	db.create_table("objetivos", {
		"id": {"data_type":"int", "primary_key": true, "auto_increment": true, "not_null": true},
		"nome": {"data_type": "text", "not_null": true},
		"objetivo": {"data_type": "real", "not_null": true}
	})
	db.create_table("progressao_itens", {
		"id": {"data_type":"int", "primary_key": true, "auto_increment": true, "not_null": true},
		"id_itens": {"data_type": "int", "foreign_key": "itens.id", "not_null": true, "on_delete": "cascade"},
		"id_saves": {"data_type": "int", "foreign_key": "saves.id", "not_null": true, "on_delete": "cascade"},
		"pos_x": {"data_type": "real"},
		"pos_y": {"data_type": "real"}
	})
	db.create_table("progressao_jogador", {
		"id": {"data_type":"int", "primary_key": true, "auto_increment": true, "not_null": true, "on_delete": "cascade"},
		"id_saves": {"data_type": "int", "foreign_key": "saves.id", "not_null": true},
		"nome": {"data_type": "text", "not_null": true},
		"points": {"data_type": "int", "not_null": true},
		"x": {"data_type": "real", "not_null": true},
		"y": {"data_type": "real", "not_null": true}
	})
	db.create_table("progressao_mundo", {
		"id": {"data_type":"int", "primary_key": true, "auto_increment": true, "not_null": true},
		"id_saves": {"data_type": "int", "foreign_key": "saves.id", "not_null": true, "on_delete": "cascade"},
		"areas_completadas": {"data_type": "int", "not_null": true},
		"areas_x": {"data_type": "int", "not_null": true},
		"areas_y": {"data_type": "int", "not_null": true}
	})
	db.create_table("progressao_itens", {
		"id": {"data_type":"int", "primary_key": true, "auto_increment": true, "not_null": true},
		"id_saves": {"data_type": "int", "foreign_key": "saves.id", "not_null": true, "on_delete": "cascade"},
		"id_objetivos": {"data_type": "int", "foreign_key": "objetivos.id", "not_null": true, "on_delete": "cascade"},
		"valor": {"data_type": "real"}
	})
	
static func migrar():
	var db = openDb()
	pass

static func salvar(save):
	var db = openDb()
	
	var selected = db.select_rows("saves", "id = {0}".format({"0": save["saves"]["id"]}), ["*"])
	if selected.is_empty():
		var n = {
			"data": save["saves"]["data"],
			"dificuldade": save["saves"]["dificuldade"]
		}
		db.insert_row("saves", n)
		
		selected = db.select_rows("saves", "", ["*"])
		save["progressao_jogador"]["id_saves"] = selected[-1]["id"]
		db.insert_row("progressao_jogador", save["progressao_jogador"])
	else:
		db.delete_rows("progressao_jogador", "id_saves = {0}".format({"0": save["save"]["id"]}))
		db.insert_row("progressao_jogador", save["progressao_jogador"])
	
	db.close_db()
	
static func carregar(save):
	var db = openDb()
	
	var selected = db.select_rows("saves", "id = {0}".format({"0": Global.save}), ["data", "dificuldade"])
	if selected.is_empty():
		db.close_db()
		return save
	save["saves"] = selected[0]
	
	selected = db.select_rows("progressao_jogador", "id_saves = {0}".format({"0": Global.save}), ["id_saves", "nome", "points", "x", "y"])
	save["progressao_jogador"] = selected[0]
	
	db.close_db()
	
	return save
	
static func listaSaves():
	var db = openDb()
	
	var selected = db.select_rows("saves", "", ["*"])
	
	db.close_db()
	
	return selected
