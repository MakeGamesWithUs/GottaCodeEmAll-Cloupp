Leveling-Up!
=====

We want the critter’s level to be the opponent critter’s level increased by 5. That means we need to set our critter’s level equal to the *opponent critter’s level* and *add 5*. We can do this with the line:

	myLevel = opponentLevel + 5
	
That sets the variable level to the value of the critter’s current level, plus 5! Add that line underneath where it says ```//YOUR CODE HERE```. This is what your ```singButtonPressed``` function should look like:

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
	 		myLevel = opponentLevel + 5
	 	}
	 }
	 
Try beating the opponent critter!

Final Recap
========
Congratulations! You have beat the final and hardest critter!

Let's quickly summarize what you have learned today:


- **Variables**: an easy way to store information


- **Functions**: an easy way to reuse code or call code from other parts of the program


- **Handlers**: functions that are called when a specific event occurs



- **Libraries**: libraries store functions that someone else wrote for you



- **If-then-else statements**: alter the flow of the program based on different conditions <!--IS THERE A BETTER WAY TO PHRASE THIS??-->



- **For-loops**: repeat the same chunk of code multiple times


These fundamental concepts are found in all programming languages. You are well on your way to becoming a coding master!