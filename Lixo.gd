extends Node2D

@onready var temporizador: Timer = get_node("Timer")

@export var tempoDeVida: float = 3
@export var degradacao: float = 1
@export var tempoDegradacao: float = 1

const modEscala: float = .4

const lixo_refs = [{ 	
	"name": "caixa",
	"ref": "res://resources/Lixo/box 1.png",
	"colide": true,
	"peso": 1
}, {
	"name": "garrafa",
	"ref": "res://resources/Lixo/alcohol 1.png",
	"colide": false,
	"peso": 1
}]

# Called when the node enters the scene tree for the first time.
func _ready():
	
	self.scale = Vector2(randf_range(1-modEscala, 1+modEscala), randf_range(1-modEscala, 1+modEscala))
	self.rotation = randf_range(0, 359)
	
	temporizador.connect("timeout", executarDegradacao.bind(temporizador))
	temporizador.set_wait_time(tempoDegradacao)
	temporizador.start()

func executarDegradacao(_timer):
	tempoDeVida -= degradacao
	if tempoDeVida <= 0:
		pass
		# queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
