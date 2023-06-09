extends Node

const CenaLixo: PackedScene = preload("res://lixo.tscn")

@export var geracaoLixo: int = 40
@export var geracaoLixoPadding: float = 100
@export var modGeracaoLixo: int = 5

@onready var inventario = get_node("Inventario")
@onready var hud = get_node("HUD")

@onready var musica: AudioStreamPlayer = get_node("AudioStreamPlayer")

@onready var gameState = {
	"pause": false,
	"inventario": false,
	"jogando": true
}

@onready var save = {
	"saves": {
		"id": 1,
		"data": "aaa",
		"dificuldade": "easy"
	},
	"progressao_jogador": {
		"id_saves": 1,
		"nome": "aaa",
		"points": 0,
		"x": 284,
		"y": 249
	}
}

@onready var player = get_node("Personagem")
@onready var Pontos = get_node("HUD/Pontos")
var salvar

@onready var help = get_node("Help")
@onready var tutorial = get_node("Tutorial")

# Called when the node enters the scene tree for the first time.
func _ready():
	var contagemLixo = randi_range(geracaoLixo-modGeracaoLixo, geracaoLixo+modGeracaoLixo)
	var objetivos = get_node("HUD/Objetivos")
	var interativo = get_tree().get_nodes_in_group("menu_interativo")
	var lixeira = get_tree().get_nodes_in_group("lixeira")
	var pause = get_node("Pause")
	var loja = get_node("Loja")
	salvar = pause.salvarScn
	
	Global.player = player
	
	if Global.load:
		save = Save.carregar(save)
	
	Pontos.adicionar(save["progressao_jogador"]["points"])
	player.position = Vector2(save["progressao_jogador"]["x"], save["progressao_jogador"]["y"])
	
	gerarLixo(contagemLixo, 100, 100)
	player.apontaLixoPerto()
#	lixoPerto(player)
	
	for i in interativo:
		print(i)
		print(i.gameState)
		i.gameState = gameState
	for i in lixeira:
		i.personagem = player
		i.Pontos = Pontos
		i.objetivos = objetivos
	
	player.inventario = inventario
	player.pause = pause
	player.gameState = gameState
	player.lixoTotal = contagemLixo
	player.lixoAtual = contagemLixo
	player.loja = loja
	player.save = save
	player.hud = hud
	player.objetivos = objetivos
	
	pause.gameState = gameState
	pause.player = player
	
	inventario.gameState = gameState
	inventario.player = player
	inventario.raiz = self
	
	loja.inventarioItens = inventario.get_node('VBoxContainer/Sementes')
	loja.inventario = inventario
	
	objetivos.total_lixo = contagemLixo
	objetivos.atualiza()
	
	salvar.save = save
	musica.play()

func gerarLixo(count, x, y):
	print("instanciando: ", count - 1, " lixo...")
	
	var window_size: Vector2 = Vector2(x * 32, y * 32) #Vector2(3834, 2017)
	
	for i in range(count):
		var lixo = CenaLixo.instantiate()

		lixo.position = Vector2(
			randf_range(geracaoLixoPadding, window_size[0]-geracaoLixoPadding),
			randf_range(geracaoLixoPadding, window_size[1]-geracaoLixoPadding)
		)
		add_child(lixo)

func _physics_process(delta):
	if Input.is_action_just_pressed("save"):
		salvar.visible = !salvar.visible
			
#	if Input.is_action_just_pressed("inventory") or Input.is_action_just_pressed("temp"):
#		for i in hud.get_children():
#			i.visible = !i.visible


func voltar_help():
	help.visible = false


func voltar_tutorial():
	tutorial.visible = false
