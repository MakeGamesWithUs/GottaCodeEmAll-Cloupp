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
  
  func didLoadFromCCB() {
    self.userInteractionEnabled = true
  }
  
  func buttonTouched() {
    println("Touched \(attackType.description())")
//    var player = GameState.sharedInstance.player?
//    switch attackType {
//      case MonsterAttackType.Tackle:
//        player?.tackleAttack()
//      case MonsterAttackType.Elemental:
//        switch player!.type {
//          case MonsterType.Fire:
//            player?.fireAttack()
//          case MonsterType.Water:
//            player?.waterAttack()
//          case MonsterType.Leaf:
//            player?.leafAttack()
//          case MonsterType.None:
//            println("MonsterType.None! This should not have happened...")
//        }
//      case MonsterAttackType.Swipe:
//        var numberOfSwipes: Int = Int(arc4random_uniform(5)) + 1
//        player?.swipeAttack(numberOfSwipes)
//        
//      case MonsterAttackType.None:
//        println("\(attackType.description()) touched! This should not have happened...")
//    }
  }
  
}

class AttackBox: CCNode {
  
  var tackleButton: AttackButton?
  var elementalButton: AttackButton?
  var swipeButton: AttackButton?
  
  func didLoadFromCCB() {
    tackleButton?.attackType = MonsterAttackType.Tackle
    elementalButton?.attackType = MonsterAttackType.Elemental
    swipeButton?.attackType = MonsterAttackType.Swipe
  }
  
}