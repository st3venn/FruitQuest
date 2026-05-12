extends CharacterBody2D

var collected = false
const SPEED = 300.0
const JUMP_VELOCITY = -450.0
var health = 100
var fruitCount = 0
var allow_animation:bool = false
var leaved_floor: bool = false
var had_jump: bool = false
var max_jumps: int = 2
var count_jumps: int = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	$animaciones.play("appear")

func _physics_process(delta):
	
	if is_on_floor():
		leaved_floor = false
		had_jump = false
		count_jumps = 0
	
	
	# Add the gravity.
	if not is_on_floor():
		if not leaved_floor:
			$coyote_timer.start()
			leaved_floor = true
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and right_to_jump():
		if count_jumps == 1:
			allow_animation = false
			$animaciones.play("double_jump")
			$audioDoublejump.play()
		else:
			$audio_jump.play()
		count_jumps += 1
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()
	decide_animation()


func decide_animation():
	
	if not allow_animation: return
	#Eje de las X
	if velocity.x == 0:
		$animaciones.play("idle")
	elif velocity.x < 0:
		$animaciones.flip_h = true
		$animaciones.play("run")
	elif velocity.x > 0:
		$animaciones.flip_h = false
		$animaciones.play("run")
	
	#Eje de las Y
	if velocity.y > 0:
		$animaciones.play("jump_down")
	elif velocity.y < 0:
		$animaciones.play("jump_up")

func right_to_jump():
	if had_jump:
		if count_jumps < max_jumps: return true
		else: return false
	if is_on_floor():
		had_jump = true
		return true
	elif not $coyote_timer.is_stopped():
		had_jump = true
		return true
func collectFruit(fruitType):
	var auxString = fruitType + "Points"
	var gainedPoints = GeneralRules[auxString]
	fruitCount += gainedPoints
	print(fruitCount)
	$audioDoublejump.play()

func _on_animaciones_animation_finished():
	allow_animation = true

func _on_coyote_timer_timeout():
	print("jump!")




func _on_damage_detection_area_shape_entered(_area_rid, _area, _area_shape_index, _local_shape_index):

	$audioDamage.play()
	allow_animation = false
	velocity.y = -150
	$animaciones.play("hit")
	health -= 10
	if health <= 0:
		get_tree().change_scene_to_file("res://escenas/MENU/gameover.tscn")


@warning_ignore("unused_parameter")
func _on_muerte_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	health -= 100
	if health <= 0:
		Global.current_scene = get_tree().current_scene.scene_file_path
		get_tree().change_scene_to_file("res://escenas/MENU/gameover.tscn")
	print("daño")
