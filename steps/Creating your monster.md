Getting started
===============
Let's quickly look over the code that has been provided to get started with your monster.

There are already two blocks of code. Let's take a look at the first one: 
	
	func initialize()
	{
		// The code in this function runs first
		
		nickname = "Morty"
	}
	
This is the ```initialize``` function. This is the first, *initial* piece of code that the computer will automatically run when you press the **run button**.


There are lines starting with ```//``` -- like ```// tackleButtonPressed goes below this``` and ```// tackleButtonPressed goes above this```. These are called comments. Any line that starts with ```//``` is ignored by the computer. This allows you to make notes for yourself and other programmers who read your code. Let's get started!


Name your monster!
=======================
Inside ```initizalize```, we are storing a ```String``` in the ```nickname``` variable. ```String``` is just a fancy way of saying *a sequence of letters*. A ```String``` is always surrounded by a pair of quotation marks. It can be as short as ```"a"``` or as long as the complete works of Shakespeare. 

Change ```Morty``` to a new nickname for your monster and run the code to make sure it worked.


The importance of variables
===========================
A variable is a place to store information to be used in code. Once you save information to a variable, you can come back to it later. You can read the information, you can manipulate it and you can even replace it. Variables are a powerful tool.

We had originally set a variable with the line ```nickname = "Morty"```. We took ```"Morty"``` and saved it to the ```nickname``` variable. By changing the nickname to something else, you changed what was stored in the ```nickname``` variable. Once you did that, the new name showed up on screen! Your monster has a lot of variables -- it has variables for its health, its animations, its level, and a whole bunch of other things the game needs to keep track of.

Let's go onto the next step so we can customize your monster with an element type.