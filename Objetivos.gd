extends CanvasLayer

@onready var coleta = get_node("Control/VBoxContainer/coleta_lixo")
@onready var reciclagem = get_node("Control/VBoxContainer/reciclar_lixo")
@onready var arvores_plantadas = get_node("Control/VBoxContainer/plantar_arvore")
@onready var area_limpa = get_node("Control/VBoxContainer/limpar_area")
var lixoColetado: int = 0
var lixoReciclado: int = 0
var arvoresPlantadas: int = 0

func _ready():
	coleta.set_text("Coleta do lixo: 0/10")
	reciclagem.set_text("Reciclagem do lixo: 0/10")
	area_limpa.set_text("Limpeza da Área: 0/10")
	arvores_plantadas.set_text("Árvores Plantadas: 0/10")

func coletar(lixo: int) -> void:
	lixoColetado += lixo
	if lixoColetado < 10:
		coleta.set_text("Coleta do lixo: {total}/10".format({"total": lixoColetado}))
	else:
		coleta.set_text("[color=green][s]-Coleta do Lixo: {total}/10[/s][/color]".format({"total": lixoColetado}))
	limpar()

func reciclar(lixo: int) -> void:
	lixoReciclado += lixo
	if lixoReciclado < 10:
		reciclagem.set_text("Reciclagem do lixo: {total}/10".format({"total": lixoReciclado}))
	else:
		reciclagem.set_text("[color=green][s]-Reciclagem do Lixo: {total}/10[/s][/color]".format({"total": lixoReciclado}))
	limpar()

func plantar(arvore: int) -> void:
	arvoresPlantadas += arvore
	if arvoresPlantadas < 10:
		arvores_plantadas.set_text("Arvores plantadas: {total}/10".format({"total": arvoresPlantadas}))
	else:
		arvores_plantadas.set_text("[color=green][s]-Arvores plantadas: {total}/10[/s][/color]".format({"total": arvoresPlantadas}))
	limpar()

func limpar() -> void:
	var limpeza: int = clamp(lixoColetado, 0, 10) + clamp(lixoReciclado, 0, 10) + clamp(arvoresPlantadas, 0, 10)
	if limpeza < 30:
		area_limpa.set_text("Limpeza da Área: {total}/30".format({"total": limpeza}))
	else:
		area_limpa.set_text("[color=green][s]-Limpeza da Área: {total}/30[/s][/color]".format({"total": limpeza}))
