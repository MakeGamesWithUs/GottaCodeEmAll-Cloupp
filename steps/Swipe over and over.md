Multiple swipes!
================
Two battles down and one to go! This time your monster will be facing another monster that has an elemental advantage over it. You will not be able to rely on your old moves to win. This is where Swipe comes in to save the day!

Swipe is a move that randomly attacks between three and five times. It can be extremely powerful and will help you win this last battle. Let's add in the code and then talk about what it is doing. Add the following code ```// swipeMove goes below this``` and ```// swipeMove goes above this```:

	override func swipeMove(numberOfSwipes: Int)
	{
		for swipe in 1...numberOfSwipes
		{
			self.performSwipe()
		}
	}

Functions with parameters
=======================
As usual, we are declaring a function but this time our function takes in a parameter! This means that when the game calls ```swipeMove```, it will also have to include the number of times your monster should perform swipe. This syntax for this is:

	func functionName(parameterName: parameterType)
	{
		// function code goes here
	}

In our case, the parameter name is ```numberOfSwipes```. We can access ```numberOfSwipes``` and do anything to it that we could do to a normal variable. Our parameter type is ```Int``` -- this is just a fancy name for a whole number.

For-loops
=========
The second thing we see in this is a for-loop. For-loops allow us to run code multiple times, even if we do not know how many times we will want to run it when we are writing the code. This is good since our monster will be performing swipe a random number of times! The syntax for a for-loop is:

	for counter in startingNumber...endingNumber
	{
		// for-loop code goes here
	}

```counter``` should be a new variable name -- in our case it is ```swipe```. A for-loop will execute once for each number from ```startingNumber``` until ```endingNumber``` inclusive. Each execution, it will update ```counter``` to the current number. In our case, ```swipe``` will equal 1, then 2, then 3 and so on until we reach ```numberOfSwipes```. Each time execution it will run ```self.performSwipe()``` since it is inside the for-loop's curly braces.

Now that your monster knows it's final move, run the code and see if you can win the third and most challenging battle. Good luck!