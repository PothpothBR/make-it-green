extends CanvasLayer

@onready var items: Array[String] = []
@onready var grid: ItemList = get_node('ItemList')

var gameState

func _ready():
	pass
func _process(delta):
#	for item in grid.get_children():
#		print(item)
	pass
	
func addItem(lixo: Node2D) -> void:
#	print(lixo)
#	print(lixo.regTextura)
#	var csprite = CenaSprite.instantiate()
#	var sprite = csprite.get_node('.')
#	sprite.set_texture(load("res://resources/spritesheet-lixo.png"))
#	sprite.set_region_rect(lixo.regTextura)
#	grid.add_child(csprite)
	grid.add_item(lixo.to_string())
	items.append(lixo.to_string())
	
func clear() -> void:
	grid.clear()
	items.clear()
