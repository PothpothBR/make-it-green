extends Control

const carregar: PackedScene = preload("res://carregar.tscn")
@onready var root = get_node(".")

func _ready():
	if !FileAccess.file_exists(Save.DB_NAME):
		Save.criar()
		Save.migrar()

func BotaoJogar():
	get_tree().change_scene_to_file("res://raiz.tscn")

func BotaoSair():
	get_tree().quit()


func BotaoCarregar():
	var c = carregar.instantiate()
	root.add_child(c)
