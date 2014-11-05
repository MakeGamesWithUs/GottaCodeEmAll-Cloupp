Let's get elemental!
====================
Now that you've won your first battle, let's teach your monster its elemental move. The elemental move will help your monster take advantage of strengths it has over monsters with different elements. 

We have to be careful though, if our monster tries to use it's elemental attack against a monster that is not susceptible to it, then the move will not do anything! We will solve this by coding it so your monster will revert back to using its Tackle if the opponent is not weak to its elemental.

Add the following code between ```// elementalButtonPressed goes below this``` and ```// elementalButtonPressed goes above this```:

	func elementalButtonPressed()
	{
    	if opponentWeakAgainst == element
    	{
    		performElemental()
    	}
    	else
    	{
    		performTackle()
    	}
	}

Again, some of this should look familiar to you. We are declaring a new function called ```elementalButtonPressed```. In this function we are using something new -- an if-then-else statement.

If-then-else statements
=======================
If-then-else statements allow our code to react to things. In this case, we only want to use our elemental move if our opponent is weak to it. If we accidentally used it on an opponent that was not weak to it, our monster's attack will miss and nothing will happen. An if-then-else statement looks like:

	if statement
	{
		// code to execute if the statement is true
	}
	else
	{
		// code to execute if the statement is false
	}

The part to pay attention to here is the ```statement```. ```statement``` can be any sort of comparison. We can use greater-than (```>```) and less-than (```<```) to compare numbers. In our function we are using equal-to (```==```) to check if two things are the same. 

```opponentWeakAgainst``` is the ```MonsterElement``` that your opponent is weak to. ```element``` is *your* ```MonsterElement```. The part with ```==``` is essentially asking: "Is ```oponentWeakAgainst``` equal to ```element```?"

If the two are equal, your monster will perform an elemental attack --  the code inside the first pair of curly brackets before the ```else```. If they are not, your monster will Tackle since according to the rules, it would miss it's attack if it tried to use an elemental -- the code in the curly brackets *after* the ```else```.

Now that your monster knows it's elemental attack, run the code and see if you can win the second battle. Be careful, your opponent is a much higher level than you this time!
