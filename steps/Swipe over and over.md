Multiple swipes!
================
Two battles down and one to go! This time your monster will be facing another monster that has an elemental advantage over it. You will not be able to rely on your old moves to win. This is where Swipe comes in to save the day!

Swipe is a move that randomly attacks between three and five times. It can be extremely powerful and will help you win this last battle. Let's add in the code and then talk about what it is doing. Somewhere after the closing curly brace for ```elementalAttack``` and above ```// your code goes above here``` add the following code:

	func swipeAttack(numberOfSwipes: Int) {
		for _ in 1...numberOfSwipes {
			self.performSwipe()
		}
	}