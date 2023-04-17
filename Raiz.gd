extends Node

const CenaLixo: PackedScene = preload("res://lixo.tscn")

@export var geracaoLixo: int = 40
@export var geracaoLixoPadding: float = 100
@export var modGeracaoLixo: int = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	var contagemLixo = randi_range(geracaoLixo-modGeracaoLixo, geracaoLixo+modGeracaoLixo)
	print("instanciando: ", contagemLixo - 1, " lixo...")
	
	var window_size: Vector2 = Vector2(3834, 2017)
	
	for i in range(contagemLixo):
		var lixo = CenaLixo.instantiate()

		lixo.position = Vector2(
			randf_range(geracaoLixoPadding, window_size[0]-geracaoLixoPadding),
			randf_range(geracaoLixoPadding, window_size[1]-geracaoLixoPadding)
		)
		add_child(lixo)
	var player = get_tree().get_nodes_in_group("player")[0]
	var objetivos = get_tree().get_nodes_in_group("objetivos")[0]
	player.lixoTotal = contagemLixo
	player.lixoAtual = contagemLixo
	objetivos.lixoTotal = contagemLixo
	
	var lixos = get_tree().get_nodes_in_group("lixo")
	var minVec = lixos[0].position
	var min = Vector2(abs(player.position.x - lixos[0].position.x), abs(player.position.y - lixos[0].position.y))
	for i in range(1, lixos.size()):
		var nmin = Vector2(abs(player.position.x - lixos[i].position.x), abs(player.position.y - lixos[i].position.y))
		if nmin.length() < min.length():
			minVec = lixos[i].position
			min = nmin
	player.lixoPerto = minVec

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(Engine.get_frames_per_second())
