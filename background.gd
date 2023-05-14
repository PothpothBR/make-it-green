extends ParallaxBackground
var velocidade_giro = 100

func _process(delta):
	scroll_offset.x -= velocidade_giro * delta
