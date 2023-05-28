extends CanvasLayer

@onready var arrLixos: Array[String] = []
@onready var lixos: ItemList = get_node('VBoxContainer/Lixos')

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
	sementes.add_item(arrSementes[0]["type"])
	sementes.add_item(arrSementes[1]["type"])


var gameState

func addItem(lixo: Node2D) -> void:
	lixos.add_item(lixo.to_string())
	arrLixos.append(lixo.to_string())
	
func clear() -> void:
	lixos.clear()
	arrLixos.clear()
