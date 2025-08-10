extends CharacterBody2D

const SPEED = 300.0
const CLIMB_SPEED = -400.0
const JUMP_VELOCITY = -350.0

var animation_timer := 0.0
var frame_toggle := 0

@onready var sprite = $Sprite2D

enum player_state {RUN, LADDER} # I added this so you can add more states in the future, e.g. swimming
var current_state := player_state.RUN

func _on_area_2d_body_entered(body: Node2D) -> void:
	current_state = player_state.LADDER

func _on_area_2d_body_exited(body: Node2D) -> void:
	current_state = player_state.RUN


func _physics_process(delta: float) -> void:
	if current_state == player_state.RUN:
		if is_on_floor():
			velocity.y = 0.0
		else:
			velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_pressed("jump"):
		if current_state == player_state.RUN and is_on_floor():
			velocity.y += JUMP_VELOCITY
			# $JumpSound.play()
		elif current_state == player_state.LADDER:
			velocity.y = CLIMB_SPEED
	else:
		if current_state == player_state.LADDER:
			velocity += get_gravity() * delta

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction  * SPEED
		
		sprite.flip_h = direction > 0


		# Only animate walk if on the floor**
		if is_on_floor():

			animation_timer += delta
			if animation_timer > 0.08:
				frame_toggle = 1 - frame_toggle
				sprite.frame = frame_toggle
				animation_timer = 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		sprite.frame = 0  # Idle frame

	move_and_slide()
