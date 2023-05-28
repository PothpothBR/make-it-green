extends Node2D

@onready var spriteLixo: Sprite2D = get_node("Corpo/Sprite")
@onready var tipo: String = "Lixo"

@export var tempoDeVida: float = 3
@export var degradacao: float = 1
@export var tempoDegradacao: float = 1

var regTextura = Rect2(32*randi_range(0, 36), 0, 32, 32)

const modEscala: float = .4

# Called when the node enters the scene tree for the first time.
func _ready():
	var texturaLixo: CompressedTexture2D

	spriteLixo.set_texture(load("res://resources/spritesheet-lixo.png"))
	spriteLixo.set_region_rect(regTextura)
	
	spriteLixo.set_scale(Vector2(randf_range(1-modEscala, 1+modEscala), randf_range(1-modEscala, 1+modEscala)))
	spriteLixo.set_rotation(randf_range(0, 359))
	
	spriteLixo.set_flip_h(randi_range(0,1))
	spriteLixo.set_flip_v(randi_range(0,1))

func _physics_process(delta):
	executarDegradacao()

func executarDegradacao():
	if tempoDeVida <= 0:
		queue_free()

func lixoDestruido():
	var player = get_tree().get_nodes_in_group("player")[0]
	player.lixoAtual -= 1
	var objetivos = get_tree().get_nodes_in_group("objetivos")[0]
	objetivos.coletar(player.lixoAtual)
	
func lixo_reciclado():
	#preencher com os dados, lixo que são reciclados
	pass
	
func area_limpa():
	#preencher com a area limpa
	pass
	
func arvore_plantadas():
	#preencher com uma variavel(objeto arvore plantado)
	pass
