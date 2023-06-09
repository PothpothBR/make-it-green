extends CanvasLayer

var gameState
#itens do inventario

var inventarioItens: ItemList
var inventario

@onready var Pontos = get_node("/root/Raiz/HUD/Pontos")

@onready var labelPontos = get_node("pontos")

@onready var regador = get_node("Control/VBoxContainer/Items de Plantação/Regador")
@onready var mochila_marrom = get_node("Control/VBoxContainer/Mochilas/Mochila 1")
@onready var mochila_verde = get_node("Control/VBoxContainer/Mochilas/Mochila 2")
@onready var mochila_roxa = get_node("Control/VBoxContainer/Mochilas/Mochila 3")
@onready var mochila_azul= get_node("Control/VBoxContainer/Mochilas/Mochila 4")

func _physics_process(delta):
	labelPontos.set_text("Pontos: {pontos}".format({"pontos": Pontos.pontos}))

func adicionar_item(x, y, id: int):
	if inventario.tamanho >= inventario.tamanhoSementes:
		return
	else:
		inventario.tamanho += 1
		
	var db: SQLite = Save.openDb()
	db.select_rows("itens", "id = "+str(id), ["nome", "valor"])
	var itemDb: Dictionary = db.query_result_by_reference[0]
	var texture  = AtlasTexture.new()
	texture.set_atlas(load("res://resources/Sprit-Itens.png"))
	texture.set_region(Rect2(x, y, 32, 32))
	var item: int = inventarioItens.add_item(itemDb["nome"], texture)
	inventarioItens.set_item_metadata(item, id)
	
#-----------------itens de plantação-----------------
func on_comprar_semente_arvore():
	if (Pontos.pontos >= 2):
		Pontos.remover(2)
		adicionar_item(0, 0, 1)

func on_comprar_semente_arbusto():
	if (Pontos.pontos >= 2):
		Pontos.remover(2)
		adicionar_item(128, 0, 2)
	
func on_comprar_regador():
	if (Pontos.pontos >= 35):
		Pontos.remover(35)
		adicionar_item(64, 0, 3)
		inventario.temRegador = true
		regador.visible = false
	
func on_comprar_fertilizante():
	if (Pontos.pontos >= 20):
		Pontos.remover(20)
		adicionar_item(32, 0, 4)
	
#-----------------Mochilas-----------------
func on_comprar_mochila_1():
	if (Pontos.pontos >= 5):
		Pontos.remover(5)
		inventario.tamanhoSementes = 20
		mochila_marrom.visible = false
	
func on_comprar_mochila_2():
	if (Pontos.pontos >= 10):
		Pontos.remover(10)
		inventario.tamanhoSementes = 30
		mochila_verde.visible = false

func on_comprar_mochila_3():
	if (Pontos.pontos >= 20):
		Pontos.remover(20)
		inventario.tamanhoSementes = 40
		mochila_roxa.visible = false

func on_comprar_mochila_4():
	if (Pontos.pontos >= 50):
		Pontos.remover(50)
		inventario.tamanhoSementes = 50
		mochila_azul.visible = false
