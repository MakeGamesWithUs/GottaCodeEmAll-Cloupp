
class MyMonster: Monster {
  
  // addToBattle goes below this
  
  func addToBattle() {
    type = MonsterType.Water
    nickname = "Morty"
  }
  
  // addToBattle goes above this
  
  
  
  // tackleMove goes below this
  
  func tackleMove() {
    self.performTackle()
  }
  
  // tackleMove goes above this
  
  
  
  // elementalMove goes below this
  
  func elementalMove() {
    if opponent.weakAgainst == self.type {
      self.performElemental()
    } else {
      self.performTackle()
    }
  }
  
  // elementalMove goes above this
  
  
  
  // swipeMove goes below this
  
  func swipeMove(numberOfSwipes: Int) {
    for _ in 1...numberOfSwipes {
      self.performSwipe()
    }
  }
  
  // swipeMove goes above this
  
}