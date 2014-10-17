Teaching to tackle
==================
It's pretty great to have our monster all set up but now we need to teach it some moves! Let's start off with, Tackle, a simple move. Add the following code between ```// tackleMove goes below this``` and ```// tackleMove goes above this```:

	func tackleMove()
	{
    	self.performTackle()
  }

Some of this code should look familiar. We are declaring a new function called ```tackleMove```. We know this because of the ```func``` keyword. Inside that function we are doing something new -- calling a function.

Calling functions
===============

We have declared and defined functions before, but never called them. When you want to call a function, you need two things: a receiver and a function name. We combine the receive and function name with a period between the two and add a pair of parenthesis to the end. This gives us ```receiver.functionName()```.

In this case, we want the receiver to be our monster since we want our monster to perform the attack. You can refer to yourself with the keyword ```self```. The function we are calling is ```performTackle```.  Chained together with a period and parenthesis we get ```self.performTackle()```.

Now that your monster knows Tackle, run the code and see if you can win the first battle!
