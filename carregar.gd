extends CanvasLayer

@onready var list: ItemList = get_node("Saves")

func _ready():
	var saves = Save.listaSaves()
	
	for i in saves:
		list.add_item("Save {0}".format({"0": i["id"]}))

func _process(delta):
	pass


func saveSelecionado(index):
	Global.load = true
	Global.save = index+1
	get_tree().change_scene_to_file("res://raiz.tscn")
	recarrega()
	
func recarrega():
	list.clear()
	var saves = Save.listaSaves()
	
	for i in saves:
		list.add_item("Save {0}".format({"0": i["id"]}))
