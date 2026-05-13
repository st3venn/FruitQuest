@tool
extends Node2D

var collected = false

@export_enum("apple", "banana", "cherry") var fruitType:String = "apple" :
	set(value):
		fruitType = value
		$animations.animation = fruitType

# Called when the node enters the scene tree for the first time.
func _ready():
	if not Engine.is_editor_hint():
		print("Frutas totales: ", Global.total_fruits)
		$animations.play(fruitType)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_collect_body_entered(body):
	if collected:
		return
	
	collected = true
	
	Global.collected_fruits += 1
	print("Frutas recogidas: ", Global.collected_fruits)
	
	if Global.collected_fruits >= Global.total_fruits:
		Global.puntuacion = body.fruitCount
		Global.frutas_recogidas = Global.collected_fruits
		Global.current_scene = get_tree().current_scene.scene_file_path
		get_tree().change_scene_to_file("res://escenas/MENU/nivelcompletado.tscn")
	
	if body.has_method("collectFruit"):
		body.collectFruit(fruitType)
	
	$animations.play("collected")

 	


func _on_animations_animation_finished():
	self.queue_free()
