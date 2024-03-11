extends Node2D
var points = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = "Score: 0" 
	SignalManager.addPoints.connect(_on_addPoints);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_addPoints() :
	points += 1;
	$Label.text = "Score: " + str(points);
