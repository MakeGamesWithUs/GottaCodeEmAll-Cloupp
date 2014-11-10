Introducing functions
=====================
In Swift, functions are declared like this:

	func functionName()
	{
		// Function definition goes here
	}

Look familiar? That's how the ```initialize``` function is declared.

Functions start off with the keyword ```func```. This tells the computer that you want to declare a new function. Then you provide a function name. In the example above, it’s ```functionName```. In your code, the function name is ```initialize```. After the function name comes a pair of parenthesis. Last comes the open and close curly braces. Anything in between those two curly braces is part of the function definition.

Why do I need functions?
========================
We know that variables store information to use later, but what about functions? A function stores code that can be run by other parts of the program. Code that it is going to be used more than once or in different parts of a program probably belongs in a function. 


Examining our set up function
=======================
Let's take a look at the code in the ```setupCritterStats()``` function.

It is formatted just like the ```initialize``` function. It begins with the keyword ```func``` and is followed by the function name, ```setupCritterStats ``` and a set of parenthesis ```()```:

    func setupCritterStats()
    {
        myElement = "None"
        myLevel = 1
    }
We define two different variables in this function: the critter’s ```myElement``` and its ```myLevel```.

Changing the stats
=====================
Right now, the variable ```myElement ``` is set to ```"None"```. Try changing the critter’s element type to ```"Fire"```, ```"Leaf"```, or ```"Water"```. 

Now run the code. Notice any changes? Don’t worry, you’re not supposed to.

Even though we changed the ```myElement ``` variable, the code in the ```setupCritterStats``` function is not actually getting run by the computer, because we never told the computer to look at the code in that function. 

We could do tons of crazy stuff in that function, but unless we tell the computer to run the code in that function, nothing will change -- so your critter is still formless!


How to make a function run
===============

Code inside a function will not get run by the computer unless a function is "called." That is how we tell the computer that it needs to pay attention to the code written in a function. To call a function, you need the function's name, followed by parentheses: ```functionName()```.

When you ran the code after changing your critter’s nickname, you saw that change reflected in the simulator -- that is because the ```initialize``` function is special, and it automatically gets called. 

When we tried changing the information in ```setupCritterStats ``` without calling the function first, we didn't see any changes in the simulator. 

Even though the ```setupCritterStats``` function has always been declared underneath the ```initialize``` function, it is not until we actually call ```setupCritterStats ``` that the code in that function gets read.