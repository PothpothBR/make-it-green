extends CanvasLayer

@onready var coleta = get_node("Control/VBoxContainer/coleta_lixo")
@onready var reciclagem = get_node("Control/VBoxContainer/reciclar_lixo")
@onready var arvores_plantadas = get_node("Control/VBoxContainer/plantar_arvore")
@onready var arbustos_plantadas = get_node("Control/VBoxContainer/plantar_arbusto")
@onready var area_limpa = get_node("Control/VBoxContainer/limpar_area")
var lixoColetado: int = 0
var lixoReciclado: int = 0
var arvoresPlantadas: int = 0
var arbustosPlantadas: int = 0

var total_lixo = 0

func _ready():
	coleta.set_text("Coleta do lixo: 0/{total}".format({"total": total_lixo - (total_lixo / 10)}))
	reciclagem.set_text("Reciclagem do lixo: 0/{total}".format({"total": total_lixo - (total_lixo / 10)}))
	arvores_plantadas.set_text("Árvores Plantadas: 0/{total}".format({"total": total_lixo - (total_lixo / 20)}))
	arbustos_plantadas.set_text("Arbustos Plantados: 0/{total}".format({"total": total_lixo - (total_lixo / 20)}))
	
func _physics_process(delta):
#	if lixoColetado < total_lixo - (total_lixo / 10):
#		coleta.set_text("Coleta do lixo: {atual}/{total}".format({"total": total_lixo - (total_lixo / 10), "atual": lixoColetado}))
#	else:
#		coleta.set_text("[color=green][s]-Coleta do Lixo: {atual}/{total}[/s][/color]".format({"total": total_lixo - (total_lixo / 10), "atual": lixoColetado}))
#	if lixoReciclado < total_lixo - (total_lixo / 10):
#		reciclagem.set_text("Reciclagem do lixo: {atual}/{total}".format({"total": total_lixo - (total_lixo / 10), "atual": lixoReciclado}))
#	else:
#		reciclagem.set_text("[color=green][s]-Reciclagem do Lixo: {atual}/{total}[/s][/color]".format({"total": total_lixo - (total_lixo / 10), "atual": lixoReciclado}))
#	if arvoresPlantadas < total_lixo - (total_lixo / 5):
#		arvores_plantadas.set_text("Arvores plantadas: {atual}/{total}".format({"total": total_lixo - (total_lixo / 5), "atual": arvoresPlantadas}))
#	else:
#		arvores_plantadas.set_text("[color=green][s]-Arvores plantadas: {atual}/{total}[/s][/color]".format({"total": total_lixo - (total_lixo / 5), "atual": arvoresPlantadas}))
#
	if lixoColetado >= total_lixo - (total_lixo / 10) and lixoReciclado >= total_lixo - (total_lixo / 10) and arvoresPlantadas >= total_lixo - (total_lixo / 5) and arbustosPlantadas >= total_lixo - (total_lixo / 5):
		var plantas = get_tree().get_nodes_in_group("planta")
		for i in plantas:
			i.timer.stop()
		get_node("/root/Raiz/Final").visible = true

func atualiza():
	coleta.set_text("Coleta do lixo: 0/{total}".format({"total": total_lixo - (total_lixo / 10)}))
	reciclagem.set_text("Reciclagem do lixo: 0/{total}".format({"total": total_lixo - (total_lixo / 10)}))
	arvores_plantadas.set_text("Árvores Plantadas: 0/{total}".format({"total": total_lixo - (total_lixo / 20)}))
	arbustos_plantadas.set_text("Arbustos Plantados: 0/{total}".format({"total": total_lixo - (total_lixo / 20)}))
	
func coletar(lixo: int) -> void:
	lixoColetado += lixo
	if lixoColetado < total_lixo - (total_lixo / 10):
		coleta.set_text("Coleta do lixo: {atual}/{total}".format({"total": total_lixo - (total_lixo / 10), "atual": lixoColetado}))
	else:
		coleta.set_text("[color=green][s]-Coleta do Lixo: {atual}/{total}[/s][/color]".format({"total": total_lixo - (total_lixo / 10), "atual": lixoColetado}))
	limpar()

func reciclar(lixo: int) -> void:
	lixoReciclado += lixo
	if lixoReciclado < total_lixo - (total_lixo / 10):
		reciclagem.set_text("Reciclagem do lixo: {atual}/{total}".format({"total": total_lixo - (total_lixo / 10), "atual": lixoReciclado}))
	else:
		reciclagem.set_text("[color=green][s]-Reciclagem do Lixo: {atual}/{total}[/s][/color]".format({"total": total_lixo - (total_lixo / 10), "atual": lixoReciclado}))
	limpar()

func plantarArvore(arvore: int) -> void:
	arvoresPlantadas += arvore
	if arvoresPlantadas < total_lixo - (total_lixo / 5):
		arvores_plantadas.set_text("Arvores Plantadas: {atual}/{total}".format({"total": total_lixo - (total_lixo / 5), "atual": arvoresPlantadas}))
	else:
		arvores_plantadas.set_text("[color=green][s]-Arvores Plantadas: {atual}/{total}[/s][/color]".format({"total": total_lixo - (total_lixo / 5), "atual": arvoresPlantadas}))
	limpar()
	
func plantarArbusto(arvore: int) -> void:
	arbustosPlantadas += arvore
	if arbustosPlantadas < total_lixo - (total_lixo / 5):
		arbustos_plantadas.set_text("Arbustos Plantados: {atual}/{total}".format({"total": total_lixo - (total_lixo / 5), "atual": arbustosPlantadas}))
	else:
		arbustos_plantadas.set_text("[color=green][s]-Arbustos Plantados: {atual}/{total}[/s][/color]".format({"total": total_lixo - (total_lixo / 5), "atual": arbustosPlantadas}))
	limpar()

func limpar() -> void:
	var limpeza: int = clamp(lixoColetado, 0, 10) + clamp(lixoReciclado, 0, 10) + clamp(arvoresPlantadas, 0, 10)
	if limpeza < 30:
		area_limpa.set_text("Limpeza da Área: {total}/30".format({"total": limpeza}))
	else:
		area_limpa.set_text("[color=green][s]-Limpeza da Área: {total}/30[/s][/color]".format({"total": limpeza}))
