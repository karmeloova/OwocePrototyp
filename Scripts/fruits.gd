extends Area2D
var speed = 200;
var what = 0;
var color = 0;
var lose = false;
# Called when the node enters the scene tree for the first time.
func _ready():
	color = randi_range(0,3)
	SignalManager.youLose.connect(_on_youLose)
	match color:
		0: $FruitSprite.modulate = Color.RED;
		1: $FruitSprite.modulate = Color.GREEN;
		2: $FruitSprite.modulate = Color.BLUE;
		3: $FruitSprite.modulate = Color.PURPLE;
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(not(lose)) : position.y += speed*delta;

func _on_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	match area.name :
		"Basket": what = 0; #Kolizja z koszykiem (graczem)
		"Floor": what = 1; #Kolizja z podłogą (gracz nie zdążył)
	SignalManager.fruitColor.emit(color);
	SignalManager.fruitColl.emit(what);
	queue_free();

func _on_youLose() :
	lose = true;
