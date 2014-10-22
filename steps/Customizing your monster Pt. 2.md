Why do I need functions?
========================
We know that variables store information to use later, but what about functions? A function stores code that can be run by other parts of the program. Code that it is going to be used more than once or in different parts of a program probably belongs in a function. <!-- We set our ```element``` and ```level``` variables in a function because the game tries to call the ```addToBattle``` function when it starts to set up your monster. -->

Changing the stats
========================
When you setup a Leaf-element monster you entered a battle against a Fire-element monster. What happens if you change that line to ```element = "Fire"``` or ```element = "Water"```? Changing what we store in the ```element``` variable changes both what our monster looks like and what our opponent looks like. This happens because the game code reads the ```element``` variable to help it decide how to set up the battle! Try it out and choose which monster you want to use.

We also want to make sure we are entering the battle with a monster that is prepared! We need to change the monster's level from 0 to 5. 

Both ```0``` and ```5``` are **integers**, which means they are whole numbers. Just like a string, an integer is a <!--special--> way for the computer to represent information. 

You can change the monster's level from 0 to 5 by changing the line:

	level = 0
to say:

	level = 5

Now run your code. Your monster should be ready for battle!

A little more on integers
========================


You can also produce **integers** in code with simple arithmetic. The computer understands the plus sign ```+```, the minus sign ```-```, the multiplication sign ```*```, and the division sign ```/```. That means that:

	level = 2 + 3
	
means the same thing as:
	
	level = 5
	
How convenient!