using Godot;
using System;

[System.Serializable]
struct test{
	int a,b,c;
}

public partial class struct_test : Node
{
	[Export] public int number;
	[Export] private test _tes;
	
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}
}
