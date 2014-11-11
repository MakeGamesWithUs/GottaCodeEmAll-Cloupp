class MyCritter: Critter
{


    func initialize()
    {
        // The code in this function runs first
        nickname = "Cloud"
        setupCritterStats()
    }
  
    func setupCritterStats()
    {
        myElement = "Fire"
        myLevel = 5
    }
  
    // dashButtonPressed goes below this
    
    override func dashButtonPressed() {
        performDash()
    }
    
    // dashButtonPressed goes above this
    
    
    
    // elementalButtonPressed goes below this
    
    
    
    // elementalButtonPressed goes above this
    
    
    
    // swipeButtonPressed goes below this
    
    
    
    // swipeButtonPressed goes above this
    
    
    
    // singButtonPressed goes below this
    
    
    
    // singButtonPressed goes above this
    
    
}
