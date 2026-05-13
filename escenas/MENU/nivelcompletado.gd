extends Control

func _ready():
	$PanelContainer/Label.text = "puntuación:" + str(Global.puntuacion)
	

	

func _on_siguientenivel_pressed():
	Global.total_fruits = 0
	Global.collected_fruits = 0
	# Cambia aquí según el nivel actual
	if Global.current_scene.ends_with("pantalla1.tscn"):
		get_tree().change_scene_to_file("res://escenas/pantallas/pantalla2.tscn")
	if Global.current_scene.ends_with("pantalla2.tscn"):
		get_tree().change_scene_to_file("res://escenas/pantallas/pantalla3.tscn")


func _on_salir_pressed():
	get_tree().quit()
