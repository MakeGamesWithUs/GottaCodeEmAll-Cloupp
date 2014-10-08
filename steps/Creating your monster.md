Getting started
===============
Before we get started, let's quickly look over the code that has been provided. We'll come back to this at the end and explain it in greater detail so do not worry too much about what it means.

The first thing to notice is the main code block:
	
	class MyMonster: Monster
	{
	
	}
	
All of the code we write today will go in between those two curly braces (```{``` and ```}```).

In between those curly braces you'll notice a there are already a bunch of lines starting with ```//``` like ```// addToBattle goes below this``` and ```// addToBattle goes above this```. These are called comments. Any line that starts with ```//``` is ignored by the computer. This allows you to make notes to yourself and other programmers who read your code. Let's get started!

Let's create a monster!
=======================
If you run your code now, you'll notice that you don't have a monster -- let's fix that! Add the following lines between ```// addToBattle goes below this``` and ```// addToBattle goes above this```:

    override func addToBattle()
    {
        element = MonsterElement.Leaf
    }

Now run your code! What changed?

The importance of variables
===========================
A variable is a place to store information in to use later in code. Once you save information to a variable, you can come back to it later. You can read the information, you can manipulate it and you can even replace it. Variables are a powerful tool.

Why does this matter? Well, our monster is going to need an element -- leaf, fire, or water. What better way to save this element for later than a variable! That's exactly what we just did with the line ```element = MonsterElement.Leaf```. We took ```MonsterElement.Leaf``` and saved it to the ```element``` variable. Once we did that, our monster showed up on screen! Your monster has variables a lot of variables -- it has variables for it's health, it's animations, it's level, and a whole bunch of other things the game needs to keep track of.

Let's go onto the next step so we can talk about those other two lines of code around the line we set the ```element``` variable in.