extends Node2D
var points = 0;
var basketColor = 0;
var fruitColor = 0;
var lives = 3;
# Called when the node enters the scene tree for the first time.
func _ready():
	$Score.text = "Wynik: 0" 
	$Lives.text = "Życia: 3"
	SignalManager.addPoints.connect(_on_addPoints);
	SignalManager.basketColor.connect(_on_basketColor);
	SignalManager.fruitColor.connect(_on_fruitColor);
	SignalManager.lossLife.connect(_on_lossLife);
	SignalManager.youLose.connect(_on_youLose);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_addPoints() :
	if(basketColor==fruitColor) : 
		points += 1;
		$Score.text = "Wynik: " + str(points);
	else : SignalManager.lossLife.emit();

func _on_basketColor(color) :
	basketColor = color;
	
func _on_fruitColor(color) :
	fruitColor = color;
	
func _on_lossLife() :
	lives -= 1;
	$Lives.text = "Życia: " + str(lives);
	if(lives==0) : SignalManager.youLose.emit()

func _on_youLose() :
	$LoseText.text = "Przegrałeś";
