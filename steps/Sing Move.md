Put the opponent to sleep
==========
You are going to use your critter’s powerful **Sing** move to damage your opponent by putting it to sleep. This is going to require the use of everything you have learned so far, so get ready!

The Sing move is only effective if your critter has a higher level than the opponent critter -- otherwise pressing the Sing button will make your critter level up over the opponent’s level!

Add the following code between ```// singButtonPressed goes below this``` and ```// singButtonPressed goes above this```:


	func singButtonPressed() 
	{
	 	if myLevel > opponentLevel 
	 	{
	 		for counter in 1...(myLevel - opponentLevel) 
	 		{
	 			performSing()
	 		}
	 	}
	 	else 
	 	{
	 		//YOUR CODE HERE
	 	}
	}
	 
That is a lot to digest, so let's break it down into smaller chunks while we take a look at it.

Sing Button Handler 
====

The very first part is the function declaration of the Sing Button Handler. ```singButtonPressed()``` is what automatically gets called by the computer when it notices someone pressed the Sing button. 

If-then-else statement 
=========

Next is the if-then-else statement. This time, we are checking to see if our critter’s level is greater than the opponent critter’s level. The statement ```myLevel > opponentLevel``` is like asking the question: "is ```myLevel ``` a bigger number than ```opponentLevel```?" If the answer to that question is true, then the computer will run the code inside of the first pair of curly brackets, before the ```else```.

Otherwise, if the answer to that question is false, then the computer will run the code inside the second pair of curly brackets, after the ```else```.

For-loop with performSing()
=====
The code that gets run if the answer to "is ```myLevel ``` a bigger number than ```opponentLevel```?" is ```YES``` has a for-loop. This for-loop means that ```singMove()``` will get called from the **Move Library** once for each level that your critter is above the opponent level. If your critter is level 7 and the opponent is level 4, then the code will get run 3 times  (```myLevel - opponentLevel = 7 - 4 = 3```).

	for counter in 1...(myLevel - opponentLevel) 
	{
		performSing()
	}
	 	
Variable change with addition
========

Earlier, we mentioned that the computer is able to perform algebraic operations like addition and subtraction --  you are going to need to use this to complete the next step. When someone presses the Sing button, we want to make sure their level is higher than the opponent level -- otherwise, we want the critter’s level to be five higher then the opponent’s level!

That means that in between the curly brackets after the ```else```, where it says ```//YOUR CODE HERE```, you need to write code that sets the critter’s level equal to the opponent’s level, plus five. Remember, we store the critter’s level as an ```Int``` in the variable ```myLevel ```, and the opponent critter’s level is stored in the variable ```opponentLevel```. 

Try your hand at leveling the critter up! If you need some help, head to the next step. 
