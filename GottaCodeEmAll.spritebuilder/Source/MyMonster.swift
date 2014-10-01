
class MyMonster: Monster {
  
  // your code goes under here
  
  func addToBattle() {
    type = MonsterType.Leaf
    monsterName = "Crabby"
  }
  
  
  
  func tackleAttack() {
    attack(MonsterAttackType.Tackle)
  }
  
  func elementalAttack() {
    if opponent.type == MonsterType.Leaf {
      attack(MonsterAttackType.Elemental)
    } else {
      attack(MonsterAttackType.Tackle)
    }
  }
  
  func swipeAttack(numberOfSwipes: Int) {
    for _ in 1...numberOfSwipes {
      attack(MonsterAttackType.Swipe)
    }
  }
  
  // your code goes above here
  
}