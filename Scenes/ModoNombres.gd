extends Node2D

var score = 0
var multiplier = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	score = 0
	multiplier = 1
	$HUD/MultiplierLabel.add_theme_font_size_override("font_size", 50)
	$HUD/MultiplierLabel.add_theme_color_override("font_color", Color(255,255,255))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if multiplier > 3:
		multiplier = 3
	$HUD/FPSLabel.set_text(str(Engine.get_frames_per_second()))


func _on_buenos_aires_line_edit_text_submitted(txt):		
	if txt.to_lower() == "buenos aires":
		updateScoreLabel(100 * multiplier)
		multiplier += 1
	else:
		multiplier = 1
	updateMultiplierLabeel()
	$BuenosAiresLineEdit.set_editable(false)
	$BuenosAiresLineEdit.set_focus_mode(Control.FOCUS_NONE)
	

func _on_entre_rios_line_edit_text_submitted(txt):
	if txt.to_lower() == "entre ríos":
		updateScoreLabel(100 * multiplier)
		multiplier += 1
	else:
		multiplier = 1
	updateMultiplierLabeel()
	$EntreRiosLineEdit.set_editable(false)
	$EntreRiosLineEdit.set_focus_mode(Control.FOCUS_NONE)
	
func updateScoreLabel(points):
	score += points
	$HUD/ScoreLabel.set_text(str(score))

func updateMultiplierLabeel():
	$HUD/MultiplierLabel.set_text(str(multiplier) + "X!")
	if multiplier == 1:
		$HUD/MultiplierLabel.add_theme_font_size_override("font_size", 50)
		$HUD/MultiplierLabel.add_theme_color_override("font_color", Color(255,255,255))
		$HUD/MultiplierLabel.set_rotation(0)
	elif multiplier == 2:
		$HUD/MultiplierLabel.add_theme_font_size_override("font_size", 60)
		$HUD/MultiplierLabel.add_theme_color_override("font_color", Color(251,255,0))
		$HUD/MultiplierLabel.set_rotation(deg_to_rad(15))
	elif multiplier == 3:
		$HUD/MultiplierLabel.add_theme_font_size_override("font_size", 75)
		$HUD/MultiplierLabel.add_theme_color_override("font_color", Color(255,0,0))
		$HUD/MultiplierLabel.set_rotation(deg_to_rad(30))

	

