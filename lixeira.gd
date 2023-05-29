extends Node2D

@onready var tipo: String = "Lixeira"
@onready var items: Array[String] = []
@onready var front: CanvasLayer
var Pontos
var personagem: CharacterBody2D
var pontos = 0
var objetivos
	
func add(inventario) -> void:
	var arr: Array[String] = inventario.arrLixos
	items.append_array(arr)
	
	var count = 0
	for item in arr:
		pontos += 1
		count += 1
	
	objetivos.reciclar(count)
	Pontos.adicionar(pontos)
	pontos = 0
	
