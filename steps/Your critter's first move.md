Teaching to Dash
==================
It's pretty great to have our critter all set up but we still have to teach it when to use its moves! Let's start off with Dash, a simple move. 

There are different forms of functions that you will encounter in programming. We're going to take a look at two of them while you code your critter’s Dash:

1. Functions that automatically get called when something happens, that you have to fill in
2. Functions that have already been filled in for you, and you have to call when something happens


Functions of the first kind are **Handlers**. An app has a number of unique **Handlers**, each made to "handle" a specific situation. A ***Touch* Handler** handles your touches. When you touch the screen, it calls the **Touch Handler** function, and runs whatever code is in that function.

*These are functions that you don't need to call yourself. They will automatically get called for you when the situation arises, you just need to fill in the function's body.*

Functions of the second kind come from **Libraries**. Other programmers write code that they put in a **Library**. You can add **Libraries** to your code so that you don't have to rewrite code someone else already wrote. 

*These are functions you don't need to write yourself. Someone already wrote it for you, you just need to call it when the situation arises.*


Functions that get called for you
====
We are going to implement a **Handler** that handles the situation of the **Dash Button** being pressed. When someone presses the **Dash Button**, the **Dash Button Handler** will automatically get called. 

Add the following code between ```// dashButtonPressed goes below this``` and ```// dashButtonPressed goes above this```: 

	func dashButtonPressed()
	{
    	
    }

This code may look familiar. We are declaring a new function called ```dashButtonPressed```. We know this because of the ```func``` keyword. 

This function will automatically get called whenever the **Dash Button** is pressed. Any code we put in the body of this function will automatically run whenever someone presses that button. 

Functions that were written for you
=====

Your critter has a set of moves in its **Move Library**, moves that someone else coded for you. You need to call these moves at the right times so that your critter can win the competition!

The function ```performDash``` comes from the **Move Library**. We want a Dash to be performed when someone presses the **Dash Button**. Can you figure out how to make that happen?

You need to call the ```performDash``` function inside your **Dash Button Handler**. Inside the ```dashButtonPressed``` function, add:

	performDash()	
	
This is what your ```dashButtonPressed``` function should look like:
	
	func dashButtonPressed()
	{
    	performDash()	
    }

Now that your critter knows when to Dash, run the code and see if you can win the first competition!