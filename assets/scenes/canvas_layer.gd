extends CanvasLayer

var time = Global.speedrun_time

func _physics_process(delta):
	time += delta
	update_ui()

func update_ui():
	var minutes = int(time) / 60
	var seconds = int(fmod(time, 60))  # whole seconds only
	
	# Format as mm:ss
	var formatted_time = "%02d:%02d " % [minutes, seconds]
	
	Global.speedrun_time = formatted_time
	$Label.text = formatted_time
