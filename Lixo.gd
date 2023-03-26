extends Node2D

@onready var temporizador: Timer = get_node("Timer")

@export var tempoDeVida: float = 3
@export var degradacao: float = 1
@export var tempoDegradacao: float = 1

const modEscala: float = .4

const lixo_refs = [{ 	
	"name": "caixa P 1",
	"ref": "res://resources/Lixo/box 1.png",
	"colide": true,
	"peso": 24
},{ 	
	"name": "caixa P 2",
	"ref": "res://resources/Lixo/box 2.png",
	"colide": true,
	"peso": 22
},{ 	
	"name": "caixa P 3",
	"ref": "res://resources/Lixo/box 3.png",
	"colide": true,
	"peso": 24
},{ 	
	"name": "caixa P 4",
	"ref": "res://resources/Lixo/box tile 16x16 3.png",
	"colide": true,
	"peso": 22
},{ 	
	"name": "caixa P 5",
	"ref": "res://resources/Lixo/box tile 16x16 4.png",
	"colide": true,
	"peso": 20
},{ 	
	"name": "caixa P 6",
	"ref": "res://resources/Lixo/box tile 16x16 5.png",
	"colide": true,
	"peso": 21
},{ 	
	"name": "caixa P 7",
	"ref": "res://resources/Lixo/box tile 16x16 6.png",
	"colide": true,
	"peso": 21
},{ 	
	"name": "caixa P 8",
	"ref": "res://resources/Lixo/box tile 16x16 7.png",
	"colide": true,
	"peso": 21
},{ 	
	"name": "caixa P 9",
	"ref": "res://resources/Lixo/box tile 16x16 8.png",
	"colide": true,
	"peso": 21
},{ 	
	"name": "caixa P 10",
	"ref": "res://resources/Lixo/box tile 16x16 9.png",
	"colide": true,
	"peso": 21
},{ 	
	"name": "caixa P 11",
	"ref": "res://resources/Lixo/box tile 16x16 10.png",
	"colide": true,
	"peso": 21
},{ 	
	"name": "caixa G 1",
	"ref": "res://resources/Lixo/box tile 32x32 3.png",
	"colide": true,
	"peso": 22
},{ 	
	"name": "caixa G 2",
	"ref": "res://resources/Lixo/box tile 32x32 4.png",
	"colide": true,
	"peso": 20
},{ 	
	"name": "caixa G 3",
	"ref": "res://resources/Lixo/box tile 32x32 5.png",
	"colide": true,
	"peso": 21
},{ 	
	"name": "caixa G 4",
	"ref": "res://resources/Lixo/box tile 32x32 6.png",
	"colide": true,
	"peso": 21
},{ 	
	"name": "caixa P fragil",
	"ref": "res://resources/Lixo/box tile 16x16 1.png",
	"colide": true,
	"peso": 25
},{ 	
	"name": "caixa G fragil",
	"ref": "res://resources/Lixo/box tile 32x32 1.png",
	"colide": true,
	"peso": 25
},{ 	
	"name": "caixa P reciclavel",
	"ref": "res://resources/Lixo/box tile 16x16 2.png",
	"colide": true,
	"peso": 28
},{ 	
	"name": "caixa G reciclavel",
	"ref": "res://resources/Lixo/box tile 32x32 2.png",
	"colide": true,
	"peso": 28
},{ 	
	"name": "caixa velha 1",
	"ref": "res://resources/Lixo/cracked paint tile 16x16 2.png",
	"colide": true,
	"peso": 20
},{ 	
	"name": "caixa velha 2",
	"ref": "res://resources/Lixo/cracked paint tile 16x16 3.png",
	"colide": true,
	"peso": 21
},{ 	
	"name": "computador 1",
	"ref": "res://resources/Lixo/computer 1.png",
	"colide": true,
	"peso": 35
},{ 	
	"name": "computador 2",
	"ref": "res://resources/Lixo/computer 2.png",
	"colide": true,
	"peso": 38
},{ 	
	"name": "secadora",
	"ref": "res://resources/Lixo/dryer.png",
	"colide": true,
	"peso": 80
},{ 	
	"name": "sacola lixo G 1",
	"ref": "res://resources/Lixo/garbage bag 1.png",
	"colide": true,
	"peso": 20
},{ 	
	"name": "sacola lixo G 2",
	"ref": "res://resources/Lixo/garbage bag 2.png",
	"colide": true,
	"peso": 22
},{ 	
	"name": "sacola lixo P 1",
	"ref": "res://resources/Lixo/garbage bag small 1.png",
	"colide": true,
	"peso": 15
},{ 	
	"name": "sacola lixo P 2",
	"ref": "res://resources/Lixo/garbage bag small 2.png",
	"colide": true,
	"peso": 14
},{ 	
	"name": "sacola lixo P 3",
	"ref": "res://resources/Lixo/garbage bag small 3.png",
	"colide": true,
	"peso": 13
},{ 	
	"name": "chapa metal 1",
	"ref": "res://resources/Lixo/rusty sheet metal tile 16x16 1.png",
	"colide": true,
	"peso": 45
},{ 	
	"name": "chapa metal 2",
	"ref": "res://resources/Lixo/rusty sheet metal tile 16x16 2.png",
	"colide": true,
	"peso": 48
},{ 	
	"name": "chapa metal azul 1",
	"ref": "res://resources/Lixo/rusty sheet metal tile blue 16x16 1.png",
	"colide": true,
	"peso": 50
},{ 	
	"name": "chapa metal azul 2",
	"ref": "res://resources/Lixo/rusty sheet metal tile blue 16x16 2.png",
	"colide": true,
	"peso": 55
},{ 	
	"name": "lixo satelite",
	"ref": "res://resources/Lixo/satellite dish.png",
	"colide": true,
	"peso": 100
},{ 	
	"name": "tela 1",
	"ref": "res://resources/Lixo/screen 1.png",
	"colide": true,
	"peso": 32
},{ 	
	"name": "tela 2",
	"ref": "res://resources/Lixo/screen 2.png",
	"colide": true,
	"peso": 33
},{ 	
	"name": "tela 3",
	"ref": "res://resources/Lixo/screen 3.png",
	"colide": true,
	"peso": 36
},{ 	
	"name": "lavadoura",
	"ref": "res://resources/Lixo/washer.png",
	"colide": true,
	"peso": 80
},{ 	
	"name": "garrafa 5",
	"ref": "res://resources/Lixo/water bottle clean.png",
	"colide": false,
	"peso": 8
},{ 	
	"name": "garrafa amassada",
	"ref": "res://resources/Lixo/water bottle crumpled.png",
	"colide": false,
	"peso": 3
},{ 	
	"name": "garrafa suja",
	"ref": "res://resources/Lixo/water bottle dirty.png",
	"colide": false,
	"peso": 10
},{ 	
	"name": "organico 1",
	"ref": "res://resources/Lixo/rotting food.png",
	"colide": false,
	"peso": 4
},{ 	
	"name": "organico 2",
	"ref": "res://resources/Lixo/rotting food 2.png",
	"colide": false,
	"peso": 5
},{ 	
	"name": "papel 1",
	"ref": "res://resources/Lixo/crumpled paper 1.png",
	"colide": false,
	"peso": 6
},{ 	
	"name": "papel 2",
	"ref": "res://resources/Lixo/crumpled paper 2.png",
	"colide": false,
	"peso": 6
},{
	"name": "garrafa 1",
	"ref": "res://resources/Lixo/alcohol 1.png",
	"colide": false,
	"peso": 8
},{
	"name": "garrafa 2",
	"ref": "res://resources/Lixo/alcohol 2.png",
	"colide": false,
	"peso": 7
},{
	"name": "garrafa 3",
	"ref": "res://resources/Lixo/alcohol 3.png",
	"colide": false,
	"peso": 7
},{
	"name": "garrafa 4",
	"ref": "res://resources/Lixo/alcohol 4.png",
	"colide": false,
	"peso": 7
},{
	"name": "garrafa 2",
	"ref": "res://resources/Lixo/alcohol 2.png",
	"colide": false,
	"peso": 7
},{
	"name": "garrafa 3",
	"ref": "res://resources/Lixo/alcohol 3.png",
	"colide": false,
	"peso": 7
},{
	"name": "garrafa 4",
	"ref": "res://resources/Lixo/alcohol 4.png",
	"colide": false,
	"peso": 7
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
