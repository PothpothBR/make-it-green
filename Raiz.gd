extends Node

const SQL = preload("res://save.gd")
const CenaLixo: PackedScene = preload("res://lixo.tscn")

@export var geracaoLixo: int = 40
@export var geracaoLixoPadding: float = 100
@export var modGeracaoLixo: int = 5

@onready var inventario = get_node("Inventario")
@onready var gameState = {
	"pause": false,
	"inventario": false,
	"jogando": true
}

@onready var save = {
	"saves": {
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

# Called when the node enters the scene tree for the first time.
func _ready():
	var contagemLixo = randi_range(geracaoLixo-modGeracaoLixo, geracaoLixo+modGeracaoLixo)
	var player = get_tree().get_nodes_in_group("player")[0]
	var objetivos = get_tree().get_nodes_in_group("objetivos")[0]
	var interativo = get_tree().get_nodes_in_group("menu_interativo")
	var lixeira = get_tree().get_nodes_in_group("lixeira")
	var pontos = get_node("HUD/Pontos")
	var pause = get_node("Pause")
	var loja = get_node("Loja")
	
	save = SQL.carregar(save)
	
	player.pontos = save["progressao_jogador"]["points"]
	player.position = Vector2(save["progressao_jogador"]["x"], save["progressao_jogador"]["y"])
	
	pontos.update(player.pontos)
	
	gerarLixo(contagemLixo, 119, 63)
	player.apontaLixoPerto()
#	lixoPerto(player)
	
	for i in interativo:
		i.gameState = gameState
	for i in lixeira:
		i.personagem = player
	
	player.inventario = inventario
	player.pause = pause
	player.gameState = gameState
	player.frontPontos = pontos
	player.lixoTotal = contagemLixo
	player.lixoAtual = contagemLixo
	player.loja = loja
	player.save = save
	
	objetivos.lixoTotal = contagemLixo
	
	pause.gameState = gameState
	pause.player = player
	
	inventario.gameState = gameState

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
