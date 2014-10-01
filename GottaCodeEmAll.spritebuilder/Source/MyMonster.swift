
class MyMonster: Monster {
  
  // your code goes under here
  
  func addToBattle() {
    type = MonsterType.Leaf
    nickname = "Crabby"
  }
  
  
  
  func tackleAttack() {
    self.performAttack()
  }
  
  func elementalAttack() {
    if opponent.type == MonsterType.Leaf {
      self.performAttack(attackType: MonsterAttackType.Elemental)
    } else {
      self.performAttack()
    }
  }
  
  func swipeAttack(numberOfSwipes: Int) {
    for _ in 1...numberOfSwipes {
      self.performAttack(attackType: MonsterAttackType.Swipe)
    }
  }
  
  // your code goes above here
  
}