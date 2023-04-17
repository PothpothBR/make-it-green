extends Control

func BotaoJogar():
	get_tree().change_scene_to_file("res://raiz.tscn")

func BotaoSair():
	get_tree().quit()
