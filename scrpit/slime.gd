extends Node2D

var speed=60

@onready var ray_cast_left = $RayCast_left
@onready var ray_cast_right = $RayCast_right

var direction:=1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ray_cast_left.is_colliding():
		direction=1
		$AnimatedSprite2D.flip_h=false
	if ray_cast_right.is_colliding():
		direction=-1
		$AnimatedSprite2D.flip_h=true
	#position.x+=direction*speed*delta
