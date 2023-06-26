extends CanvasLayer

const SQL = preload("res://sqlite_teste.gd")

@onready var pause = get_node(".")
@onready var salvarScn = get_node("Salvar")
@onready var carregarScn = get_node("Carregar")
@onready var voltarBtn = get_node("Voltar")
@onready var menu = get_node("Control")
@onready var help = get_node("Help")
@onready var tutorialScn = get_node("Tutorial")

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
	menu.visible = false
	salvarScn.visible = true


func voltarPause():
	salvarScn.visible = false
	carregarScn.visible = false
	help.visible = false
	tutorialScn.visible = false
	menu.visible = true


func carregar():
	menu.visible = false
	carregarScn.recarrega()
	carregarScn.visible = true


func _on_h_slider_value_changed(value):
	AudioServer.set_bus_volume_db(0, linear_to_db(value))


func _on_ajuda_pressed():
	menu.visible = false
	help.visible = true


func tutorial():
	menu.visible = false
	tutorialScn.visible = true
