extends Node2D

@onready var tipo: String = "Lixeira"
@onready var items: Array[String] = []
@onready var front: CanvasLayer

func _ready():
	pass 
	
func _process(delta):
	pass
	
func add(inventario) -> void:
	var arr: Array[String] = inventario.items
	items.append_array(arr)
	front.setGrid(items)
	
