extends Control

func _ready():
	$PanelContainer/VBoxContainer/LabelPuntuacion.text = "Puntuación: " + str(Global.puntuacion)
	$PanelContainer/VBoxContainer/LabelFrutas.text = "Frutas recogidas: " + str(Global.frutas_recogidas)

	

func _on_siguientenivel_pressed():
	Global.total_fruits = 0
	Global.collected_fruits = 0
	# Cambia aquí según el nivel actual
	if Global.current_scene.contains("pantalla1"):
		get_tree().change_scene_to_file("res://escenas/pantallas/pantalla2.tscn")
	elif Global.current_scene.contains("pantalla2"):
		get_tree().change_scene_to_file("res://escenas/pantallas/pantalla3.tscn")


func _on_salir_pressed():
	get_tree().quit()
