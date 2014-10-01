Let's get elemental!
====================
Now that you've won your first battle, let's teach your monster it's elemental move. It will be able to use this to take advantage of strengths it has against other types of monsters. Somewhere after the closing curly brace for ```tackleAttack``` and above ```// your code goes above here``` add the following code:

	func elementalAttack() {
    	if opponent.type == MonsterType.Leaf {
    		attack(MonsterAttackType.Elemental)
    	} else {
      		attack(MonsterAttackType.Tackle)
    	}
	}