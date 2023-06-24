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
	adicionar_item("Arbusto",128, 0)
	
func on_comprar_regador():
	adicionar_item("Regador", 62, 0)
	
func on_comprar_fertilizante():
	adicionar_item("Fertilizante", 32, 0)
	
#-----------------Mochilas-----------------
func on_comprar_mochila_1():
	adicionar_item("Mochila Marrom", 0, 30)
	
func on_comprar_mochila_2():
	adicionar_item("mochila Verde", 33, 33)

func on_comprar_mochila_3():
	adicionar_item("Mochila Roxa", 98, 31)

func on_comprar_mochila_4():
	adicionar_item("Mochila Azul", 130, 30)

