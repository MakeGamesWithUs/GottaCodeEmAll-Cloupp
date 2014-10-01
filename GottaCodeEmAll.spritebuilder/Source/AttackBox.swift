//
//  AttackBox.swift
//  GottaCodeEmAll
//
//  Created by Dion Larson on 9/19/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

import Foundation

class AttackButton: CCButton {
  
  var attackType: MonsterAttackType = MonsterAttackType.None
  
}

class AttackBox: CCNode {
  
  var tackleButton: AttackButton!
  var elementalButton: AttackButton!
  var swipeButton: AttackButton!
  
  func didLoadFromCCB() {
    tackleButton.attackType = MonsterAttackType.Tackle
    elementalButton.attackType = MonsterAttackType.Elemental
    swipeButton.attackType = MonsterAttackType.Swipe
  }
  
  func touchedTackle() {
    println("Touched Tackle")
    GameState.sharedInstance.player.tackleMove()
  }
  
  func touchedElement() {
    println("Touched Element")
    var player = GameState.sharedInstance.player
    player.elementalMove()
  }
  
  func touchedSwipe() {
    println("Touched Swipe")
    var player = GameState.sharedInstance.player
    var numberOfSwipes: Int = Int(arc4random_uniform(5)) + 1
    player.swipeMove(numberOfSwipes)
  }
  
}