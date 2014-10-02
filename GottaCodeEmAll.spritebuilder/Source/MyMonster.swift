
class MyMonster: Monster {
  
  // addToBattle goes below this
  
  override func addToBattle() {
    element = MonsterElement.Water
    nickname = "Morty"
  }
  
  // addToBattle goes above this
  
  
  
  // tackleMove goes below this
  
  override func tackleMove() {
    self.performTackle()
  }
  
  // tackleMove goes above this
  
  
  
  // elementalMove goes below this
  
  override func elementalMove() {
    if opponent.weakAgainst == self.element {
      self.performElemental()
    } else {
      self.performTackle()
    }
  }
  
  // elementalMove goes above this
  
  
  
  // swipeMove goes below this
  
  override func swipeMove(numberOfSwipes: Int) {
    for _ in 1...numberOfSwipes {
      self.performSwipe()
    }
  }
  
  // swipeMove goes above this
  
}