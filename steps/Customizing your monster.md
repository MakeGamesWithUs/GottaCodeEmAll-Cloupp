What's the rest of this mean?
=============================
Okay, so, we know that we just set our first variable, but why did we add that other stuff into the code?

Introducing functions
=====================
You may not have realized it yet, but you also just finished declaring your first function. In Swift, functions are declared like this:

	func functionName()
	{
	
	}

Look familiar? Functions start off with the keyword ```func```. This tells the computer that you want to declare a new function. Then you provide a function name, in this case it was ```addToBattle```. Since function names can not contain spaces, they are usually written in "camel case" -- written without any spaces and with every word after the first capitalized. After the function name comes a pair of parathensis. Last comes the open and close curly braces. Anything in between those two curly braces is part of the function definition.

Why do I need functions?
========================
We know that variables store information to use later, but what does a function do? A function stores code that can be run from other parts of the program. Code that it is going to be used more than once or in different parts of a program probably belongs in a function. We set our ```element``` variable in a function because the game tries to call the ```addToBattle``` function when it starts to set up your monster.

When you setup a Leaf-element monster you entered a battle against a Fire-element monster. What happens if you change that line to ```element = MonsterElement.Fire``` or ```element = MonsterElement.Water```? Changing what we store in the ```element``` variable changes both what our monster looks like and what our opponent looks like. This happens because the game code reads the ```element``` variable to help it decide how to set up the battle! Try it out and choose what monster you want to use.

Naming your monster
===================
While your monster already has a name, we can replace it with a nickname by setting another variable. If we wanted to nickname our monster Morty, we would add the following line right after the ```element = MonsterElement``` line:

	nickname = "Morty"

This time, instead of storing a ```MonsterElement``` in the variable, we are storing a ```String```. ```String``` is just a fancy way of saying letters. A ```String``` is always surrounded by a pair of quotation marks. They can be as short as ```"a"``` or as long as the complete works of Shakespeare. Nickname your monster and run the code to make sure it worked. Once you have a nickname, move on to the next step so we can teach our monster it's first move!