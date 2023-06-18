extends CanvasLayer

@onready var list = get_node("ItemList")
var save

func _ready():
	var saves = Save.listaSaves()
	
	for i in saves:
		list.add_item("Save {0}".format({"0": i["id"]}))

func _process(delta):
	pass

func selecionaSave(index):
	save["saves"]["id"] = index+1
	save["progressao_jogador"]["id_saves"] = index+1
	save["progressao_jogador"]["points"] = Global.player.Pontos.pontos
	save["progressao_jogador"]["x"] = Global.player.position.x
	save["progressao_jogador"]["y"] = Global.player.position.y
	Save.salvar(save)


func novoSave():
	save["saves"]["id"] = 0
	save["progressao_jogador"]["id_saves"] = 0
	save["progressao_jogador"]["points"] = Global.player.Pontos.pontos
	save["progressao_jogador"]["x"] = Global.player.position.x
	save["progressao_jogador"]["y"] = Global.player.position.y
	Save.salvar(save)
