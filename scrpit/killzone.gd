extends Area2D

@onready var timer = $Timer

func _on_body_entered(body):
	var player=get_tree().get_first_node_in_group("player")
	var tween=get_tree().create_tween()
	
	Engine.time_scale=0.7
	body.get_node("CollisionShape2D").queue_free()
	
	tween.parallel().tween_property(player,"velocity",Vector2(0,-150),0.5)
	tween.parallel().tween_property(player,"modulate:a",0,0.5)
	
	await get_tree().create_timer(0.5).timeout

	timer.start()
	
	
func _on_timer_timeout():
	Engine.time_scale=1
	get_tree().reload_current_scene()
	
