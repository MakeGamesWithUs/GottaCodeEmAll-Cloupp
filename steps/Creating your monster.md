Getting started
===============
Before we get started, let's quickly look over the code that has been provided to get started with your monster.

The first thing to notice is the main code block:
	
	class MyMonster: Monster
	{
		...
	}
	
All of the code we write today will go in between those two curly braces (```{``` and ```}```).

In between those curly braces you will notice there are already two functions defined for you. Let's take a look at the first one: 
	
	func initialize()
	{
		// The code in this function runs first
		
		nickname = "Morty"
	}
	
This function is the ```initialize``` function. This is the first, *initial* function that the computer will automatically run when you press the **run button**. 


There are lines starting with ```//``` -- like ```// addToBattle goes below this``` and ```// addToBattle goes above this```. These are called comments. Any line that starts with ```//``` is ignored by the computer. This allows you to make notes for yourself and other programmers who read your code. Let's get started!


Name your monster!
=======================
In the initizalize method, we are storing a ```String``` in the ```nickname``` variable. ```String``` is just a fancy way of saying *a sequence of letters*. A ```String``` is always surrounded by a pair of quotation marks. It can be as short as ```"a"``` or as long as the complete works of Shakespeare. 

Assign a new nickname to your monster and run the code to make sure it worked.


The importance of variables
===========================
A variable is a place to store information to be used in code. Once you save information to a variable, you can come back to it later. You can read the information, you can manipulate it and you can even replace it. Variables are a powerful tool.

We just set a variable with the line ```nickname = "Morty"```. We took ```"Morty"``` and saved it to the ```nickname``` variable. Once we did that, the name "Morty" showed up on screen! Your monster has a lot of variables -- it has variables for its health, its animations, its level, and a whole bunch of other things the game needs to keep track of.

Let's go onto the next step so we can customize your monster with an element type.