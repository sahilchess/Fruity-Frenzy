extends Label

func _process(delta):
	text = "🍓 You collected " + str(ScoreCounter.score) + " coins!"
