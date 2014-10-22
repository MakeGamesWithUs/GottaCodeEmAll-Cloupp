Teaching to tackle
==================
It's pretty great to have our monster all set up but we still have to teach it when to use its moves! Let's start off with Tackle, a simple move. Add the following code between ```// tackleButtonPressed goes below this``` and ```// tackleButtonPressed goes above this```:

	func tackleButtonPressed()
	{
    	performTackle()
    }

Some of this code should look familiar. We are declaring a new function called ```tackleButtonPressed```. We know this because of the ```func``` keyword. Inside that function we are doing something new -- calling a function.

Now that your monster knows Tackle, run the code and see if you can win the first battle!