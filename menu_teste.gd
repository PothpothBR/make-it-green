extends Node2D


func on_jogar_pressed():
	get_tree().change_scene_to_file("res://world.tscn")

func on_quit_pressed():
	get_tree().quit()



