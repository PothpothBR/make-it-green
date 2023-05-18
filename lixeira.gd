extends Node2D

@onready var tipo: String = "Lixeira"
@onready var items: Array[String] = []
@onready var front: CanvasLayer
var personagem: CharacterBody2D

func _ready():
	pass 
	
func _process(delta):
	pass
	
func add(inventario) -> void:
	var arr: Array[String] = inventario.items
	items.append_array(arr)
	
	for item in arr:
		personagem.pontos += 1
	
