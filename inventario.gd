extends CanvasLayer

@onready var arrLixos: Array[String] = []
@onready var lixos: ItemList = get_node('VBoxContainer/Lixos')

var player
var raiz
var tamanhoSementes = 10
var tamanho = 0
var temRegador = false
var gameState

@onready var espaco: RichTextLabel = get_node("espaco_inventario")

@onready var arrSementes: Array[Dictionary] = [
	{
		"type": "semente_arvore1",
		"tile": {
			"index": [1, 0],
			"layer": 0,
			"source": 3
		}
	},
	{
		"type": "semente_arvore2",
		"tile": {
			"index": [1, 0],
			"layer": 0,
			"source": 3
		}
	}
]
@onready var sementes: ItemList = get_node('VBoxContainer/Sementes')

func _ready():
	pass
	
func _physics_process(delta):
	espaco.set_text("Espaço Livre: {tamanho}".format({"tamanho": tamanhoSementes}))

func addItem(lixo: Node2D) -> void:
	lixos.add_item(lixo.to_string())
	arrLixos.append(lixo.to_string())
	
func clear() -> void:
	lixos.clear()
	arrLixos.clear()


func _on_sementes_item_clicked(index, at_position, mouse_button_index):
	var id = sementes.get_item_metadata(index)
	if id == 1:
		player.plantarArvore()
	elif id == 2:
		player.plantarArbusto()
	elif id == 3:
		player.regar()
	elif id == 4:
		player.adubar()
	visible = false
	gameState["inventario"] = !gameState["inventario"]
	player.animacao.stop()
	player.updateHUD()
	tamanho -= 1
	if id != 3:
		sementes.remove_item(index)
