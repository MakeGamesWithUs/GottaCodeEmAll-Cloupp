Calling Functions
=====================

You can call functions inside of other functions. In the initalize function, we can call the ```setupMonsterStats``` function. 

Below the line where we assign the ```nickname``` variable in the ```initialize``` function, add the line:

	setupMonsterStats()
	
Now run your code! What changed?
	
When we run the program, the initalize function automatically gets run. When the initalize function calls ```setupMonsterStats()```, all the code in that function also gets run. You added the code defining ```level``` and ```element``` to the code that the computer will run. That is why when you run the program, you can now see a **Leaf, Fire, or Water element** monster -- not just a formless one!


Changing the element
========================
If you set up a Leaf-element monster, you entered a battle against a Fire-element monster. What happens if you change your monster to a different element? For example, if you set up a leaf, try setting ```element = "Fire" ```.

Changing what we store in the ```element``` variable changes both what our monster looks like and what our opponent looks like. This happens because the game code reads the ```element``` variable to help it decide how to set up the battle! Try it out and choose which monster you want to use.

Changing the level
========

We also want to make sure we are entering the battle with a monster that is prepared! The monster is too weak to battle at level 1. We need to change the monster's level from 1 to 5. 

Both ```1``` and ```5``` are **integers**, which means they are whole numbers. Just like a string, an integer is a <!--special--> way for the computer to represent information. 

You can change the monster's level from 1 to 5 by changing the line:

	level = 1
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