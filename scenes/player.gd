extends CharacterBody2D

# Global variables
@export var speed := 600 #export makes the property an adjustable variable via the inspector
# Create custom signal
signal laser(pos1, pos2)
var can_shoot := true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector2(100, 670)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var direction = Input.get_vector("left", "right","up","down")
	velocity = direction * speed
	move_and_slide()
	
	# Shoot input
	if Input.is_action_just_pressed("shoot") and can_shoot:
		laser.emit($Laser1Startposition.global_position, $Laser2Startposition.global_position )
		$LaserTimer.start()
		can_shoot = false

func _on_shoot_timer_timeout() -> void:
	can_shoot = true # Replace with function body.
