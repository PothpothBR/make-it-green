extends CanvasLayer

@onready var items: Array[String] = []
@onready var grid: ItemList = get_node('ItemList')

var gameState

func addItem(lixo: Node2D) -> void:
	grid.add_item(lixo.to_string())
	items.append(lixo.to_string())
	
func clear() -> void:
	grid.clear()
	items.clear()
