extends Node2D

var score = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_buenos_aires_line_edit_text_submitted(txt):
	var was_submitted = false
		
	if txt.to_lower() == "buenos aires":
		if was_submitted == false:
			updateScoreLabel(100)
			was_submitted = true
	$BuenosAiresLineEdit.set_editable(false)
	$BuenosAiresLineEdit.set_focus_mode(Control.FOCUS_NONE)
	

func _on_entre_rios_line_edit_text_submitted(txt):
	if txt.to_lower() == "entre ríos":
		updateScoreLabel(100)
	$EntreRiosLineEdit.set_editable(false)
	$EntreRiosLineEdit.set_focus_mode(Control.FOCUS_NONE)
	
func updateScoreLabel(points):
	score += points
	$HUD/ScoreLabel.set_text(str(score))



