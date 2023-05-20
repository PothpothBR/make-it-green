extends Node

# Called when the node enters the scene tree for the first time.
static func vai(pos):
	var db = SQLite.new()
	
	var table: Dictionary = Dictionary()
	table["Id"] = {"data_type":"int", "primary_key": true, "auto_increment": true, "not_null": true}
	table["x"] = {"data_type":"real", "not_null": true}
	table["y"] = {"data_type":"real", "not_null": true}

	db.path = "res://data/banco"
	db.verbosity_level = SQLite.NORMAL
	db.open_db()

	db.create_table("position", table)

	var row1 : Dictionary = Dictionary()
	row1["x"] = pos.x
	row1["y"] = pos.y

	db.insert_row("position", row1)
#
#	var row2 : Dictionary = Dictionary()
#	row2["Name"] = "bbb"
#
#	db.insert_row("Tabela1", row2)

#	var selected = db.select_rows("Tabela1", "", ["*"])

#	print("{0}".format({"0": selected}))
	db.close_db()
#	db.delete_rows("Tabela1", "*")

static func vem():
	var db = SQLite.new()
	db.path = "res://data/banco"
	db.verbosity_level = SQLite.NORMAL
	db.open_db()
	var selected = db.select_rows("position", "", ["x", "y"])
	print(selected)
	var v = Vector2(selected[0]["x"], selected[0]["y"])
	db.close_db()
	return v
	

