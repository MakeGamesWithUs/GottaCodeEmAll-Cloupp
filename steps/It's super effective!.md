Let's get elemental!
====================
Now that you've won your first battle, let's teach your monster it's elemental move. The elemental move will help your monster take advantage of strengths it has over other types of monsters. We have to be careful though, if our monster tries to use it's elemental attack against a monster that is not weak to it then the move will not do anything! We will solve this by coding it so your monster will just tackle if the opponent is not weak to it's elemental.

Somewhere after the closing curly brace for ```tackleAttack``` and above ```// your code goes above here``` add the following code:

	func elementalAttack() 	{
    	if opponent.weakAgainst == self.type {
    		self.performElemental())
    	} else {
      		self.performTackle()
    	}
	}
	
Again, a some of this should look familiar to you. We are declaring a new method called ```elementalAttack```. In this method we are using something new -- an if-then-else statement.

If-then-else statements
=======================
If-then-else statements allow our code to react to things. In this case, we only want to use our elemental move if our opponent is weak to it. If we accidentally used it on an opponent that was not weak to it, our monster's attack will miss and nothing will happen. An if-then-else statement looks like:

	if statement {
		// code to execute if true
	} else {
		// code to execute if false
	}
	
The part to pay attention to here is the ```statement```. ```statement``` can be any sort of comparision. We can use greater-than (```>```) and less-than (```<```) to compare numbers. In our method we are using equal-to (```==```) to check if two things are the same. ```opponent.weakAgainst``` is the ```MonsterType``` that your opponent is weak to. ```self.type``` is your ```MonsterType```. If the two are the same, your monster will perform an elemental attack. If they are not, your monster will Tackle since according to the rules, it would miss it's attack if it tried to use an elemental.

Now that your monster knows it's elemental attack, run the code and see if you can win the second battle. Be careful, your opponent is a much higher level than you this time!