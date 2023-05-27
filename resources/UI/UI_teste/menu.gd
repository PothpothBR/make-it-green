extends VBoxContainer


func _on_novo_jogo_pressed():
	get_tree().change_scene_to_file("res://raiz.tscn")


func _on_sair_pressed():
	get_tree().quit()
