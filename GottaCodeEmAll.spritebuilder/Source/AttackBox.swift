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
    print("Touched Tackle")
    let player = GameState.sharedInstance.player
    player.dashButtonPressed()
    self.startAttacks()
  }

  func touchedElement() {
    print("Touched Element")
    let player = GameState.sharedInstance.player
    player.elementalButtonPressed()
    self.startAttacks()
  }

  func touchedSwipe() {
    print("Touched Swipe")
    let player = GameState.sharedInstance.player
    let numberOfSwipes: Int = Int(arc4random_uniform(3)) + 3
    player.swipeButtonPressed(numberOfSwipes)
    self.startAttacks()
  }
  
  func touchedSing() {
    print("Touched Sing")
    let player = GameState.sharedInstance.player
    let oldLevel = player.myLevel
    player.singButtonPressed()
    if oldLevel != player.myLevel {
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
