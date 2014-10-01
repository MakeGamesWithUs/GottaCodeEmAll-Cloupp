Teaching to tackle
==================
It's pretty great to have a monster but now we need to teach it some moves! Let's start off with, Tackle, a simple move. Somewhere after the closing curly brace for ```addToBattle``` and above ```// your code goes above here``` add the following code:

	func tackleAttack() {
    	self.performTackle()
  	}

Some of this code should look familiar. We are declaring a new method called ```tackleAttack```. We know this because of the ```func``` keyword. Inside that method we are doing something new -- calling a method.

Calling methods
===============

We have declared and defined methods before, but never called them. When you want to call a method, you need two things: a receiver and a method name. We combine the receive and method name with a period between the two and add a pair of parenthesis to the end. This gives us ```receiver.methodName()```.

In this case, we want the receiver to be our monster since we want our monster to perform the attack. You can refer to yourself with the keyword ```self```. The method we are calling is ```performTackle```.  Chained together with a period and parenthesis we get ```self.performTackle()```.

Now that your monster knows Tackle, run the code and see if you can win the first battle!