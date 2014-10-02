//
//  AttackBox.swift
//  GottaCodeEmAll
//
//  Created by Dion Larson on 9/19/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

import Foundation

class AttackBox: CCNode {
  
  var tackleButton: CCButton!
  var elementalButton: CCButton!
  var swipeButton: CCButton!

  func touchedTackle() {
    println("Touched Tackle")
    var player = GameState.sharedInstance.player
    player.tackleMove()
    GameState.sharedInstance.battle.processAttacks()
    self.fadeOut()
    GameState.sharedInstance.battle.messageBox.fadeIn()
  }

  func touchedElement() {
    println("Touched Element")
    var player = GameState.sharedInstance.player
    player.elementalMove()
    GameState.sharedInstance.battle.processAttacks()
    self.fadeOut()
    GameState.sharedInstance.battle.messageBox.fadeIn()
  }

  func touchedSwipe() {
    println("Touched Swipe")
    var player = GameState.sharedInstance.player
    var numberOfSwipes: Int = Int(arc4random_uniform(3)) + 3
    player.swipeMove(numberOfSwipes)
    GameState.sharedInstance.battle.processAttacks()
    self.fadeOut()
    GameState.sharedInstance.battle.messageBox.fadeIn()
  }
  
  func fadeOut() {
    self.animationManager.runAnimationsForSequenceNamed("EaseOut")
    tackleButton.userInteractionEnabled = false
    elementalButton.userInteractionEnabled = false
    swipeButton.userInteractionEnabled = false
  }
  
  func fadeIn() {
    self.animationManager.runAnimationsForSequenceNamed("EaseIn")
    tackleButton.userInteractionEnabled = true
    elementalButton.userInteractionEnabled = true
    swipeButton.userInteractionEnabled = true
  }

}
