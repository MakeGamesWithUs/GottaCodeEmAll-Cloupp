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
  var singButton: CCButton!

  func touchedTackle() {
    println("Touched Tackle")
    var player = GameState.sharedInstance.player
    player.tackleButtonPressed()
    self.startAttacks()
  }

  func touchedElement() {
    println("Touched Element")
    var player = GameState.sharedInstance.player
    player.elementalButtonPressed()
    self.startAttacks()
  }

  func touchedSwipe() {
    println("Touched Swipe")
    var player = GameState.sharedInstance.player
    var numberOfSwipes: Int = Int(arc4random_uniform(3)) + 3
    player.swipeButtonPressed(numberOfSwipes)
    self.startAttacks()
  }
  
  func touchedSing() {
    println("Touched Sing")
    var player = GameState.sharedInstance.player
    var oldLevel = player.level
    player.singButtonPressed()
    if oldLevel != player.level {
      player.performPowerup()
    }
    self.startAttacks()
  }
  
  func tackleStep() {
    elementalButton.state = CCControlState.Disabled
    elementalButton.cascadeOpacityEnabled = true
    elementalButton.opacity = 0.25
    elementalStep()
  }
  
  func elementalStep() {
    swipeButton.state = CCControlState.Disabled
    swipeButton.cascadeOpacityEnabled = true
    swipeButton.opacity = 0.25
    swipeStep()
  }
  
  func swipeStep() {
    singButton.state = CCControlState.Disabled
    singButton.cascadeOpacityEnabled = true
    singButton.opacity = 0.25
  }
  
  func startAttacks() {
    GameState.sharedInstance.battle.processAttacks()
    self.fadeOut()
    GameState.sharedInstance.battle.messageBox.fadeIn()
  }
  
  func fadeOut() {
    self.animationManager.runAnimationsForSequenceNamed("EaseOut")
    tackleButton.userInteractionEnabled = false
    elementalButton.userInteractionEnabled = false
    swipeButton.userInteractionEnabled = false
    singButton.userInteractionEnabled = false
  }
  
  func fadeIn() {
    self.animationManager.runAnimationsForSequenceNamed("EaseIn")
    tackleButton.userInteractionEnabled = true
    elementalButton.userInteractionEnabled = true
    swipeButton.userInteractionEnabled = true
    singButton.userInteractionEnabled = true
  }

}
