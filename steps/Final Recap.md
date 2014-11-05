Leveling-Up!
=====

We want the monster's level to increase by 1. That means we need to *add 1* to the monster's level. We can do this with the line:

	level = level + 1
	
That sets the variable level to the value of the monster's current level, plus 1! Add that line underneath where it says ```//YOUR CODE HERE```. This is what your ```singButtonPressed``` function should look like:

	function singButtonPressed {
	 	if level > enemyLevel 
	 	{
	 		for counter in 1...(level-enemyLevel) 
	 		{
	 			singMove()
	 		}
	 	}
	 	else {
	 		level = level + 1
	 	}
	 }
	 
Try beating the enemy monster!

Final Recap
========
Congratulations! You have beat the final and hardest monster!

Let's quickly summarize what you have learned today:

- **Variables**: an easy way to store information

- **Functions**: an easy way to reuse code or call code from other parts of the program


- **Handlers**: functions that are called when a specific event occurs



- **Libraries**: libraries store functions that someone else wrote for you



- **If-then-else statements**: alter the flow of the program based on different conditions <!--IS THERE A BETTER WAY TO PHRASE THIS??-->



- **For-loops**: repeat the same chunk of code multiple times


These fundamentals are found in all programming languages. Your journey as a programmer has only just begun!