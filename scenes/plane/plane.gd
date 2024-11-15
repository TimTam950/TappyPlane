extends CharacterBody2D

class_name Tappy

@onready var anim_sprite: AnimatedSprite2D = $AnimSprite
@onready var anim_player: AnimationPlayer = $AnimationPlayer
@onready var sound: AudioStreamPlayer2D = $Sound

const GRAVITY: float = 1000.0
const POWER: float = -350.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:	
	# acceleration due to gravity
	velocity.y += GRAVITY * delta
	fly()
	move_and_slide()
	if is_on_floor():
		die()

func fly() -> void:
	# if fly is pressed, give it upward velocity vector
	if Input.is_action_just_pressed("fly"):
		velocity.y = POWER 
		anim_player.play("power")

func die() -> void:
	anim_sprite.stop()
	set_physics_process(false)
	SignalManager.on_plane_died.emit()
	sound.stop()
