extends Node

var score:=0
@onready var label = $Label

func add_score():
	score+=1
	label.text="你收集了"+str(score)+"枚金币。"

func _physics_process(delta: float) -> void:
	if score==11:
		label.text="你赢了，随意死亡重新开始游戏。"


	
	
