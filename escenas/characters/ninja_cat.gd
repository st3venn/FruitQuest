extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var appeared:bool = false

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	$animaciones.play("appear")
	
func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y += gravity * delta
	
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	
	
	var direction = Input.get_axis("ui_left","ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	decide_animation()
	
	
func decide_animation():
	
	if not appeared: return
	if  velocity.x == 0:
		$animaciones.play("idle")
	elif velocity.x < 0:
		$animaciones.flip_h = true
		$animaciones.play("run")
	elif velocity.x > 0:
		$animaciones.flip_h = false
		$animaciones.play("run")
		
		
		
	#eje de las Y
	if velocity.y > 0:
		$animaciones.play("jump_down")
	elif velocity.y < 0:
		$animaciones.play("jump_up")
		
	
func _on_animaciones_animation_finished():	
	if $animaciones.animation == "appear":
		appeared = true
	
