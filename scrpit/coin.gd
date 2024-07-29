extends Area2D

@onready var manager = %Manager

@onready var animation_player = $AnimationPlayer

func _on_body_entered(body):
	animation_player.play("pick")
	manager.add_score()
	
