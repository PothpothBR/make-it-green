extends Control

func _ready():
	if !FileAccess.file_exists(Save.DB_NAME):
		Save.criar()
		Save.migrar()

func BotaoJogar():
	get_tree().change_scene_to_file("res://raiz.tscn")

func BotaoSair():
	get_tree().quit()
