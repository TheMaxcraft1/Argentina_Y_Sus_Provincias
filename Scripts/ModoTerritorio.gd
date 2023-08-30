extends Node2D

@export var province_scene: PackedScene
var on_province
var current_province
var province_list = ["BuenosAires", "Catamarca", "Chaco", "Chubut", "Cordoba", "Corrientes", "EntreRios", 
	"Formosa", "Jujuy", "LaPampa", "LaRioja", "Mendoza", "Misiones", "Neuquen", "RioNegro", "Salta", 
	"SanJuan", "SanLuis", "SantaCruz", "SantaFe", "SantiagoDelEstero", "TierraDelFuego", "Tucuman"]
#var province_list = ["BuenosAires", "LaPampa"]

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	#current_province = $BuenosAiresProvincia
	spawn_province()
	
func _process(delta):
	show_fps()
	
	province_matching_territory()
	
func show_fps():
	$HUD/FPSLabel.add_theme_color_override("font_color", Color.AQUAMARINE)
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

func check_province_name(province, province_name):
	return province.get_name() == province_name
		
func province_matching_territory():
	#Esto va a quedar muy largo, capaz se puede formatear de alguna manera...
	if current_province != null and current_province.get_is_selected() == false:
		if on_province:
			if check_province_name(current_province, "BuenosAiresProvincia"):
				$Argentina/BuenosAires/BuenosAiresSprite.set_visible(true)
			elif check_province_name(current_province, "LaPampaProvincia"):
				$Argentina/LaPampa/LaPampaSprite.set_visible(true)
			elif check_province_name(current_province, "EntreRiosProvincia"):
				$Argentina/EntreRios/EntreRiosSprite.set_visible(true)
			elif check_province_name(current_province, "CorrientesProvincia"):
				$Argentina/Corrientes/CorrientesSprite.set_visible(true)
			elif check_province_name(current_province, "MisionesProvincia"):
				$Argentina/Misiones/MisionesSprite.set_visible(true)
			elif check_province_name(current_province, "FormosaProvincia"):
				$Argentina/Formosa/FormosaSprite.set_visible(true)
			elif check_province_name(current_province, "JujuyProvincia"):
				$Argentina/Jujuy/JujuySprite.set_visible(true)
			elif check_province_name(current_province, "SaltaProvincia"):
				$Argentina/Salta/SaltaSprite.set_visible(true)
			elif check_province_name(current_province, "CatamarcaProvincia"):
				$Argentina/Catamarca/CatamarcaSprite.set_visible(true)
			elif check_province_name(current_province, "TucumanProvincia"):
				$Argentina/Tucuman/TucumanSprite.set_visible(true)
			elif check_province_name(current_province, "SantiagoDelEsteroProvincia"):
				$Argentina/SantiagoDelEstero/SantiagoDelEsteroSprite.set_visible(true)
			elif check_province_name(current_province, "ChacoProvincia"):
				$Argentina/Chaco/ChacoSprite.set_visible(true)
			elif check_province_name(current_province, "SantaFeProvincia"):
				$Argentina/SantaFe/SantaFeSprite.set_visible(true)
			elif check_province_name(current_province, "LaRiojaProvincia"):
				$Argentina/LaRioja/LaRiojaSprite.set_visible(true)
			elif check_province_name(current_province, "SanJuanProvincia"):
				$Argentina/SanJuan/SanJuanSprite.set_visible(true)
			elif check_province_name(current_province, "CordobaProvincia"):
				$Argentina/Cordoba/CordobaSprite.set_visible(true)
			elif check_province_name(current_province, "SanLuisProvincia"):
				$Argentina/SanLuis/SanLuisSprite.set_visible(true)
			elif check_province_name(current_province, "MendozaProvincia"):
				$Argentina/Mendoza/MendozaSprite.set_visible(true)
			elif check_province_name(current_province, "NeuquenProvincia"):
				$Argentina/Neuquen/NeuquenSprite.set_visible(true)
			elif check_province_name(current_province, "RioNegroProvincia"):
				$Argentina/RioNegro/RioNegroSprite.set_visible(true)
			elif check_province_name(current_province, "ChubutProvincia"):
				$Argentina/Chubut/ChubutSprite.set_visible(true)
			elif check_province_name(current_province, "SantaCruzProvincia"):
				$Argentina/SantaCruz/SantaCruzSprite.set_visible(true)
			elif check_province_name(current_province, "TierraDelFuegoProvincia"):
				$Argentina/TierraDelFuego/TierraDelFuegoSprite.set_visible(true)
			
			
			# $Argentina/<nombre de current_province menos la parte de "Provincia"
			#$Argentina/current_province.get_name().left(-9)/(current_province.get_name().left(-9) + "Sprite").set_visible(true)
			#$Argentina/BuenosAires/BuenosAiresSprite.set_visible(true)
			print("Acierto")
			$ComboUp.play()
		else:
			print("NO ES EL TERRITORIO DE LA PROVINCIA")
			$ComboMiss.play()
		
		current_province.queue_free()
		spawn_province()
		on_province = false
		
func on_province_area_entered(area, province):
	if area.get_name() == province:
		on_province = true
		
func on_province_area_exited(area, province):
	if area.get_name() == province:
		on_province = false

			
		
func _on_buenos_aires_area_entered(area):
	on_province_area_entered(area, "BuenosAiresProvincia")

func _on_buenos_aires_area_exited(area):
	on_province_area_exited(area, "BuenosAiresProvincia")

func _on_la_pampa_area_entered(area):
	on_province_area_entered(area, "LaPampaProvincia")

func _on_la_pampa_area_exited(area):
	on_province_area_exited(area, "LaPampaProvincia")

func _on_entre_rios_area_entered(area):
	on_province_area_entered(area, "EntreRiosProvincia")

func _on_entre_rios_area_exited(area):
	on_province_area_exited(area, "EntreRiosProvincia")
	
func _on_corrientes_area_entered(area):
	on_province_area_entered(area, "CorrientesProvincia")

func _on_corrientes_area_exited(area):
	on_province_area_exited(area, "CorrientesProvincia")

func _on_misiones_area_entered(area):
	on_province_area_entered(area, "MisionesProvincia")

func _on_misiones_area_exited(area):
	on_province_area_exited(area, "MisionesProvincia")

func _on_formosa_area_entered(area):
	on_province_area_entered(area, "FormosaProvincia")

func _on_formosa_area_exited(area):
	on_province_area_exited(area, "FormosaProvincia")

func _on_jujuy_area_entered(area):
	on_province_area_entered(area, "JujuyProvincia")

func _on_jujuy_area_exited(area):
	on_province_area_exited(area, "JujuyProvincia")

func _on_salta_area_entered(area):
	on_province_area_entered(area, "SaltaProvincia")

func _on_salta_area_exited(area):
	on_province_area_exited(area, "SaltaProvincia")

func _on_catamarca_area_entered(area):
	on_province_area_entered(area, "CatamarcaProvincia")

func _on_catamarca_area_exited(area):
	on_province_area_exited(area, "CatamarcaProvincia")

func _on_tucuman_area_entered(area):
	on_province_area_entered(area, "TucumanProvincia")

func _on_tucuman_area_exited(area):
	on_province_area_exited(area, "TucumanProvincia")

func _on_santiago_del_estero_area_entered(area):
	on_province_area_entered(area, "SantiagoDelEsteroProvincia")

func _on_santiago_del_estero_area_exited(area):
	on_province_area_exited(area, "SantiagoDelEsteroProvincia")

func _on_chaco_area_entered(area):
	on_province_area_entered(area, "ChacoProvincia")

func _on_chaco_area_exited(area):
	on_province_area_exited(area, "ChacoProvincia")

func _on_santa_fe_area_entered(area):
	on_province_area_entered(area, "SantaFeProvincia")

func _on_santa_fe_area_exited(area):
	on_province_area_exited(area, "SantaFeProvincia")

func _on_la_rioja_area_entered(area):
	on_province_area_entered(area, "LaRiojaProvincia")

func _on_la_rioja_area_exited(area):
	on_province_area_exited(area, "LaRiojaProvincia")

func _on_san_juan_area_entered(area):
	on_province_area_entered(area, "SanJuanProvincia")

func _on_san_juan_area_exited(area):
	on_province_area_exited(area, "SanJuanProvincia")

func _on_cordoba_area_entered(area):
	on_province_area_entered(area, "CordobaProvincia")

func _on_cordoba_area_exited(area):
	on_province_area_exited(area, "CordobaProvincia")

func _on_san_luis_area_entered(area):
	on_province_area_entered(area, "SanLuisProvincia")

func _on_san_luis_area_exited(area):
	on_province_area_exited(area, "SanLuisProvincia")

func _on_mendoza_area_entered(area):
	on_province_area_entered(area, "MendozaProvincia")

func _on_mendoza_area_exited(area):
	on_province_area_exited(area, "MendozaProvincia")

func _on_neuquen_area_entered(area):
	on_province_area_entered(area, "NeuquenProvincia")

func _on_neuquen_area_exited(area):
	on_province_area_exited(area, "NeuquenProvincia")

func _on_rio_negro_area_entered(area):
	on_province_area_entered(area, "RioNegroProvincia")

func _on_rio_negro_area_exited(area):
	on_province_area_exited(area, "RioNegroProvincia")

func _on_chubut_area_entered(area):
	on_province_area_entered(area, "ChubutProvincia")

func _on_chubut_area_exited(area):
	on_province_area_exited(area, "ChubutProvincia")

func _on_santa_cruz_area_entered(area):
	on_province_area_entered(area, "SantaCruzProvincia")

func _on_santa_cruz_area_exited(area):
	on_province_area_exited(area, "SantaCruzProvincia")

func _on_tierra_del_fuego_area_entered(area):
	on_province_area_entered(area, "TierraDelFuegoProvincia")

func _on_tierra_del_fuego_area_exited(area):
	on_province_area_exited(area, "TierraDelFuegoProvincia")
