extends AudioStreamPlayer2D

# Himno_index = 0
var HIMNO = load("res://Music/Argentina_8bits.ogg")
# Marcha_index = 1
var MARCHA = load("res://Music/Marcha_San_Lorenzo_8bits.ogg")
var current_music

func _ready():
	stream = HIMNO
	current_music = 0
	play()
	pitch_scale = 5

func _on_finished():
	if current_music == 0:
		stream = MARCHA
		current_music = 1
	else:
		stream = HIMNO
		current_music = 0
	play()
