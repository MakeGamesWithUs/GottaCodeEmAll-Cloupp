Introducing functions
=====================
In Swift, functions are declared like this:

	func functionName()
	{
	
	}

Look familiar? That's how the ```initialize``` function is declared.

 Functions start off with the keyword ```func```. This tells the computer that you want to declare a new function. Then you provide a function name, in this case it was ```initialize```. After the function name comes a pair of parenthesis. Last comes the open and close curly braces. Anything in between those two curly braces is part of the function definition.

Set up the stats!
=======================
If you run your code now, you'll notice that your monster doesn't have a shape or level -- let's fix that! We need to set the monster's stats.

In the initalize function, we can call other functions. 

Below the line where we assign the ```nickname``` variable in the ```initialize``` function, add the line:

	setupMonsterStats()
	
Now run your code! What changed?
	
When we run the program, the initalize function automatically gets run. When the initalize function calls ```setupMonsterStats()```, all the code in that function also gets run.

Calling functions
===============

Unless a function is called, the code inside that function will not get run by the computer. To call a function, you need the function's name, followed by parentheses: ```functionName()```.

When we ran the code the first time, our monster 


Examining our set up function
=======================
Let's take a look at the code in the ```setupMonsterStats()``` function.

It is formatted just like the ```initialize``` function. It begins with the keyword ```func``` and is followed by the function name, ```setupMonsterStats``` and a set of parenthesis ```()```:

    func setupMonsterStats() {
        level = 0
        element = "Leaf"
    }
We define two different variables in this function: the monster's ```level``` and its ```element```.

By adding the line ```setupMonsterStats()``` inside the ```initialize``` function, you added the code defining ```level``` and ```element``` to the code that the computer will run. That is why when you run the program, you can now see a **Leaf element** monster with a level of 0.

