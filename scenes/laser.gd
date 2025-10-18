extends Area2D
var speed = 900

func _ready():
	$Sprite2D.scale = Vector2(0,0)
	var tween = create_tween()
	tween.tween_property($Sprite2D,'scale',Vector2(0.2,0.2),0.2)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y -=  delta * speed
	if position.y < -100:
		queue_free()
