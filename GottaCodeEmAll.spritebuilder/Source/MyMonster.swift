
class MyMonster: Monster {
  
  // your code goes under here
  
  func addToBattle() {
//    type = MonsterType.Leaf
//    nickname = "Crabby"
  }

  func tackleAttack() {
    self.performTackle()
  }
  
  func elementalAttack() {
    if opponent.weakAgainst == self.type {
      self.performElemental()
    } else {
      self.performTackle()
    }
  }
  
  func swipeAttack(numberOfSwipes: Int) {
    for _ in 1...numberOfSwipes {
      self.performSwipe()
    }
  }
  
  // your code goes above here
  
}