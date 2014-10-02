What just happened?
===================
You just finished declaring a function named ```addToBattle```. In Swift, functions are declared like this:

	func functionName() {
	
	}

Functions start off with the keyword ```func```. This tells the computer that you want to declare a new function. Then you provide a function name, in this case ```functionName```. Since function names can not contain spaces, they are usually written in "camel case" -- written without no spaces and with every word after the first capitalized. After the function name comes a pair of parathensis, for now we'll keep those empty. Last comes the open and close curly braces. Anything in between those two curly braces is part of the function definition.

In our case, our function definition was one line of code: ```element = MonsterElement.Leaf```. When the game calls your ```addToBattle``` function it sets your monster's ```element``` variable to ```MonsterElement.Leaf```. A variable is a place to store information in to use later in code. Your monster also has variables for it's health, it's moves, it's level, and a whole bunch of other things the game needs to keep track of. When you setup a Leaf-type monster you enter a battle against a Fire-type monster. What happens if you change that line to ```element = MonsterElement.Fire``` or ```element = MonsterElement.Water```?

Naming your monster
===================
While your monster already has a name, we can replace it with a nickname. If we wanted to nickname our monster Morty, we would add the following line between ```// monster setup code goes below here``` and ```// monster setup code goes above here```:

	nickname = "Morty"

This time, instead of storing a ```MonsterType``` in the variable, we are storing a ```String```. ```String``` is just a fancy way of saying letters. A ```String``` is always between a pair of quotation marks. They can be as short as ```"a"``` or as long as the complete works of Shakespeare. Nickname your monster and run the code to make sure it worked.