Calling Functions
=====================

You can call functions inside of other functions. In the initialize function, we can call the ```setupCritterStats``` function. 

Below the line where we assign the ```nickname``` variable in the ```initialize``` function, add the line:

	setupCritterStats()
	
Now run your code! What changed?
	
When we run the program, the initialize function automatically gets run. When the initialize function calls ```setupCritterStats()```, all the code in that function also gets run. You added the code defining ```myLevel``` and ```myElement``` to the code that the computer will run. That is why when you run the program, you can now see a **Leaf, Fire, or Water element** critter -- not just a formless one!


Changing the element
========================
If you set up a Leaf-element critter, you entered a competition against a Fire-element critter. What happens if you change your critter to a different element? For example, if you set up a leaf, try setting ```myElement = "Fire" ```.

Changing what we store in the ```myElement``` variable changes both what our critter looks like and what our opponent looks like. This happens because the game code reads the ```myElement``` variable to help it decide how to set up the competition! Try it out and choose which critter you want to use.

Changing the level
========

We also want to make sure we are entering the competition with a critter that is prepared! The critter is too weak to compete at level 1. We need to change the critter’s level from 1 to 5. 

Both ```1``` and ```5``` are **integers**, which means they are whole numbers. Just like a string, an integer is a <!--special--> way for the computer to represent information. 

You can change the critter’s level from 1 to 5 by changing the line:

	myLevel = 1
to say:

	myLevel = 5

Now run your code. Your critter should be ready to compete with a worthy opponent!

A little more on integers
========================

You can also produce **integers** in code with simple arithmetic. The computer understands the plus sign ```+```, the minus sign ```-```, the multiplication sign ```*```, and the division sign ```/```. That means that:

	myLevel = 2 + 3
	
means the same thing as:
	
	myLevel = 5
	
How convenient!