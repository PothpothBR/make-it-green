extends CanvasLayer

const SQL = preload("res://sqlite_teste.gd")

@onready var pause = get_node(".")

var player
var gameState

func _physics_process(delta):
	if Input.is_action_just_pressed("pause"):
		pause.visible = !(pause.visible)
		gameState["pause"] = !gameState["pause"]


func voltar():
	gameState["pause"] = false
	pause.visible = false


func sair():
	get_tree().change_scene_to_file("res://menu.tscn")


func salvar():
	pass # Replace with function body.
