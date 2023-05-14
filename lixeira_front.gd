extends CanvasLayer

@onready var grid: ItemList = get_node("ItemList")

func _ready():
	pass
	
func _process(delta):
	pass

func setGrid(items: Array[String]) -> void:
	for i in range(items.size()):
		grid.add_item(items[i])
