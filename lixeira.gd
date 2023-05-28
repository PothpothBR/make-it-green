extends Node2D

@onready var tipo: String = "Lixeira"
@onready var items: Array[String] = []
@onready var front: CanvasLayer
var Pontos
var personagem: CharacterBody2D
var pontos = 0
	
func add(inventario) -> void:
	var arr: Array[String] = inventario.arrLixos
	items.append_array(arr)
	
	for item in arr:
		pontos += 1
	Pontos.adicionar(pontos)
	pontos = 0
	
