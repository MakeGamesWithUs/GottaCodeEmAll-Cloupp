Teaching to swipe
==================
It's pretty great to have our monster all set up but we still have to teach it when to use its moves! Let's start off with Swipe, a simple move. 

There are different forms of functions that you will encounter in programming. We're going to take a look at two of them while you code your monster's Swipe:

1. Functions that automatically get called when something happens, that you have to fill in
2. Functions that have already been filled in for you, and you have to call when something happens

Functions of the first kind are **Handlers**. An app has a number of unique **Handlers**, each made to "handle" a specific situation. A ***Touch* Handler** handles your touches. When you touch the screen, it calls the **Touch Handler** function, and runs whatever code is in that function.

*These are functions that you don't need to call yourself. They will automatically get called for you when the situation arises, you just need to fill in the function's body.*

Functions of the second kind come from **Libraries**. Other programmers write code that they put in a **Library**. You can add **Libraries** to your code so that you don't have to rewrite code someone else already wrote. 

*These are functions you don't need to write yourself. Someone already wrote it for you, you just need to call it when the sitation arises.*


Functions that get called for you
====
We are going to implement a **Handler** that handles the situation of the **Swipe Button** being pressed. When someone presses the **Swipe Button**, the **Swipe Button Handler** will automatically get called. 

Add the following code between ```// swipeButtonPressed goes below this``` and ```// swipeButtonPressed goes above this```:

	func swipeButtonPressed()
	{
    	
    }

This code should look familiar. We are declaring a new function called ```swipeButtonPressed```. We know this because of the ```func``` keyword. 

This function will automatically get called whenever the **Swipe Button** is pressed. Any code we put in the body of this function will automatically run whenever someone presses that button. 

Functions that were written for you
=====

Your monster has a set of attacks in its **Attack Library**, attacks that someone else coded for you. You need to call these attacks at the right times so that your monster can win the battle!

The function ```performSwipe``` comes from the **Attack Library**. We want a swipe to be performed when someone presses the **Swipe Button**. Can you figure out how to make that happen?

You need to call the ```performSwipe``` function inside your **Swipe Button Handler**. Inside the ```swipeButtonPressed``` function, add:

	performSwipe()	
	
This is what your ```swipeButtonPressed``` function should look like:

	// swipeButtonPressed goes below this
	
	func swipeButtonPressed()
	{
    	performSwipe()	
    }
    
    // swipeButtonPressed goes above this

Now that your monster knows when to Swipe, run the code and see if you can win the first battle!