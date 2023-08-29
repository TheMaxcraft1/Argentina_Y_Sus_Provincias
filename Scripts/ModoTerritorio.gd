extends Node2D

@export var province_scene: PackedScene
var on_province
var current_province
#var province_list = ["BuenosAires", "Catamarca", "Chaco", "Chubut", "Cordoba", "Corrientes", "EntreRios", 
#	"Formosa", "Jujuy", "LaPampa", "LaRioja", "Mendoza", "Misiones", "Neuquen", "RioNegro", "Salta", 
#	"SanJuan", "SanLuis", "SantaCruz", "SantaFe", "SantiagoDelEstero", "TierraDelFuego", "Tucuman"]
var province_list = ["BuenosAires", "LaPampa"]

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	#current_province = $BuenosAiresProvincia
	spawn_province()
	
func _process(delta):
	show_fps()
	
	province_matching_territory()
	
func show_fps():
	$HUD/FPSLabel.set_text(str(Engine.get_frames_per_second()))

func spawn_province():
	if province_list.size() > 0:
		var rand_int = randi_range(0, province_list.size()-1)
		var province_name = province_list[rand_int]
		province_list.pop_at(rand_int)
		var sprite = load("res://Textures/%s.png" % province_name)
		
		current_province = province_scene.instantiate()
		current_province.position = $ProvinciasSpawner.position
		current_province.set_sprite(sprite)
		current_province.set_name(province_name + "Provincia")
		
		add_child(current_province)


		
func province_matching_territory():
	#Esto va a quedar muy largo, capaz se puede formatear de alguna manera...
	if current_province != null and current_province.get_is_selected() == false:
		if on_province:
			if current_province.get_name() == "BuenosAiresProvincia":
				$Argentina/BuenosAires/BuenosAiresSprite.set_visible(true)
			elif current_province.get_name() == "LaPampaProvincia":
				$Argentina/LaPampa/LaPampaSprite.set_visible(true)
			
			
			# $Argentina/<nombre de current_province menos la parte de "Provincia"
			#$Argentina/current_province.get_name().left(-9)/(current_province.get_name().left(-9) + "Sprite").set_visible(true)
			#$Argentina/BuenosAires/BuenosAiresSprite.set_visible(true)
			print("Acierto")
			$ComboUp.play()
		else:
			print("NO ES EL TERRITORIO DE LA PROVINCIA")
		
		current_province.queue_free()
		spawn_province()
		on_province = false
		
func _on_buenos_aires_area_entered(area):
	if area.get_name() == "BuenosAiresProvincia":
		on_province = true
		#$BuenosAires/BuenosAiresSprite.set_visible(true)
	

func _on_buenos_aires_area_exited(area):
	if area.get_name() == "BuenosAiresProvincia":
		on_province = false


func _on_la_pampa_area_entered(area):
	if area.get_name() == "LaPampaProvincia":
		on_province = true


func _on_la_pampa_area_exited(area):
	if area.get_name() == "LaPampaProvincia":
		on_province = false

