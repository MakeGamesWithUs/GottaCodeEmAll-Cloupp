Let's get elemental!
====================
Now that you've won your first competition, let's teach your critter its elemental move. The elemental move will help your critter take advantage of strengths it has over critters with different elements. 

We have to be careful though: each critter is susceptible to only one kind of elemental move. In Rock-Paper-Scissors, Rock is damaged by Paper, but not damaged at all by Scissors. Similarly, Fire-element creatures are damaged by Water-elemental moves, but a Leaf-elemental move won’t do anything! 

We will solve this by coding it so your critter will revert back to using its Dash if the opponent is not weak to its elemental. We can check what element damages our opponent with the variable ```elementMyOpponentIsWeakAgainst```. 

If our critter is competing against a Fire-element critter, then the variable ```elementMyOpponentIsWeakAgainst``` would be set to ```“Water”```. If our critter’s variable ```myElement``` is also equal to ```“Water”```, then we want to use its Elemental move. Otherwise, we want to use the Dash move.

Add the following code between ```// elementalButtonPressed goes below this``` and ```// elementalButtonPressed goes above this```:

	func elementalButtonPressed()
	{
    	if elementMyOpponentIsWeakAgainst == myElement
    	{
    		performElemental()
    	}
    	else
    	{
    		performDash()
    	}
	}

Again, some of this may look familiar to you. We are declaring a new function called ```elementalButtonPressed```. In this function we are using something new -- an if-then-else statement.

If-then-else statements
=======================
If-then-else statements allow our code to react to things. In this case, we only want to use our elemental move if our opponent is damaged by it. If we accidentally used it on an opponent that was not damaged by it, our critter’s move will miss and nothing will happen. An if-then-else statement looks like:

	if statement
	{
		// code that runs if the statement is true
	}
	else
	{
		// code that runs if the statement is false
	}

The part to pay attention to here is the ```statement```. ```statement``` can be any sort of comparison. We can use greater-than (```>```) and less-than (```<```) to compare numbers. In our function we are using equal-to (```==```) to check if two things are the same. 

```elementMyOpponentIsWeakAgainst ``` is the ```CritterElement``` that your opponent is weak to. ```myElement``` is *your* ```CritterElement```. The part with ```==``` is essentially asking: "Is ```elementMyOpponentIsWeakAgainst ``` equal to ```myElement```?"

If the two are equal, your critter will perform an Elemental move --  the code inside the first pair of curly brackets before the ```else```. If they are not, your critter will Dash -- the code in the curly brackets *after* the ```else``` —- since according to the rules, it would miss its move if it tried to use an Elemental .

Now that your critter knows it's Elemental move, run the code and see if you can win the second round. Be careful, your opponent is a much higher level than you this time!
