extends Node2D
var points = 0;
var basketColor = 0;
var fruitColor = 0;
# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = "Score: 0" 
	SignalManager.addPoints.connect(_on_addPoints);
	SignalManager.basketColor.connect(_on_basketColor);
	SignalManager.fruitColor.connect(_on_fruitColor);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_addPoints() :
	if(basketColor==fruitColor) : 
		points += 1;
		$Label.text = "Score: " + str(points);

func _on_basketColor(color) :
	basketColor = color;
	
func _on_fruitColor(color) :
	fruitColor = color;
	

