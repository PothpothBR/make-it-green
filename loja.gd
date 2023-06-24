extends CanvasLayer

var gameState
#itens do inventario
var inventarioItens

func _ready():
	pass

#-----------------itens de plantação-----------------
func on_comprar_semente_arvore():
	var texture  = AtlasTexture.new()
	texture.set_atlas(load("res://resources/Sprit-Itens.png"))
	#adcionar as cordenadas
	texture.set_region(Rect2(0, 0, 32, 32))
	
	inventarioItens.add_item("josias",texture)

	

	

func on_comprar_semente_arbusto():
	var texture  = AtlasTexture.new()
	var sprite = Sprite2D.new()
func on_comprar_regador():
	var texture  = AtlasTexture.new()
	var sprite = Sprite2D.new()
	
func on_comprar_fertilizante():
	var texture  = AtlasTexture.new()
	var sprite = Sprite2D.new()
#-----------------Mochilas-----------------
func on_comprar_mochila_1():
	var texture  = AtlasTexture.new()
	var sprite = Sprite2D.new()
func on_comprar_mochila_2():
	var texture  = AtlasTexture.new()
	var sprite = Sprite2D.new()

func on_comprar_mochila_3():
	var texture  = AtlasTexture.new()
	var sprite = Sprite2D.new()

func on_comprar_mochila_4():
	var texture  = AtlasTexture.new()
	var sprite = Sprite2D.new()

