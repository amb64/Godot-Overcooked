class_name States 
enum State{
	IGNORE 		= 0,
	RAW 		= 1 << 0,
	CHOPPED 	= 1 << 1,
	FRIED 		= 1 << 2,
	BOILED 		= 1 << 3,
	COOKED 		= 1 << 4,
	DONEUNCOOKED= 1 << 5,
	DONE 		= 1 << 6,
	OVERCOOKED 	= 1 << 7
}
var S : State
