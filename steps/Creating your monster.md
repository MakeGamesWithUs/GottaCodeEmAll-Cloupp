Getting started
===============
Before we get started, let's breifly look over the code that has been provided. We'll come back to this at the end and explain it in greater detail so don't worry too much if it does not make sense yet.

The first thing to notice is the main code block:
	
	class MyMonster: Monster {
	
	}
	
This tells the computer we are defining a class called ```MyMonster``` and it is a new kind of ```Monster```. The definition for ```Monster``` has been written by us. You will be filling out the ```MyMonster``` class to create your own monster! In Swift (and many other programming languages), code is structured using curly braces: ```{``` and ```}```. Anything between those two curly braces is part of the ```MyMonster``` class scope.

In between those curly braces you'll notice ```// your code goes under here``` and ```// your code goes above here```. These are called comments. Any line that starts with ```//``` is ignored by the computer. This allows you to make notes to yourself and other programmers who read your code. Now we know enough to get started!

Let's create a monster!
=======================
If you run your code now, you'll notice that you don't have a monster -- let's fix that! You will need to set up your monster in a method. Methods are pieces of code that other parts of the program can run. Code probably belongs in a method if it is going to be used in different parts of a program.

Our game is expecting ```MyMonster``` to have a method named ```addToBattle```. Let's start off by declaring that method. Add the following lines between ```// your code goes under here``` and ```// your code goes above here```:

    func addToBattle() {
      // monster setup code goes below here
      
      // monster setup code goes above here
    }
    
Great! You have just defined your first method. Now the game will be able to call ```addToBattle``` on your monster. There is one problem though -- ```addToBattle``` does not do anything yet!

So, what can we do in ```addToBattle```? Put the following line between ```// monster setup code goes below here``` and ```// monster setup code goes above here```:

	type = MonsterType.Leaf
	
Now run the program. What is different?