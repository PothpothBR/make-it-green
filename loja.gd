extends CanvasLayer

var gameState
#itens do inventario
var inventarioItens

func _ready():
	pass

func adicionar_item(nome, x, y):
	var texture  = AtlasTexture.new()
	texture.set_atlas(load("res://resources/Sprit-Itens.png"))
	texture.set_region(Rect2(x, y, 32, 32))
	inventarioItens.add_item(nome, texture)
	
#-----------------itens de plantação-----------------
func on_comprar_semente_arvore():
	adicionar_item("Árvore",0, 0)

func on_comprar_semente_arbusto():
	pass
func on_comprar_regador():
	var texture  = AtlasTexture.new()
	var sprite = Sprite2D.new()
	
func on_comprar_fertilizante():
	adicionar_item("fertilizante", 32, 0)
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

