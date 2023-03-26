extends Node

const CenaLixo: PackedScene = preload("res://lixo.tscn")

@export var geracaoLixo: int = 40
@export var geracaoLixoPadding: float = 100
@export var modGeracaoLixo: int = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	var contagemLixo = randi_range(geracaoLixo-modGeracaoLixo, geracaoLixo+modGeracaoLixo)
	print("instanciando: ", contagemLixo, " lixo...")
	
	var window_size: Vector2 = get_window().size
	
#	for i in range(contagemLixo):
#		var lixo = CenaLixo.instantiate()
#
#		lixo.position = Vector2(
#			randf_range(geracaoLixoPadding, window_size[0]-geracaoLixoPadding),
#			randf_range(geracaoLixoPadding, window_size[1]-geracaoLixoPadding)
#			)
#		add_child(lixo)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
