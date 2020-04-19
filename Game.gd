extends Node2D

var game_end = false
var moves = 0

func _process(delta):
	$MovesLabel.text = 'Moves: ' + str(moves)
	if game_end == false:
		var goals = $Goals.get_child_count()
		for i in $Goals.get_children():
			if i.occupied:
				goals -= 1
	
		if goals == 0:
			$AcceptDialog.popup()
			game_end = true


func _on_AcceptDialog_confirmed():
	get_tree().reload_current_scene()
