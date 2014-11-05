//
//  MonsterAttack.swift
//  GottaCodeEmAll
//
//  Created by Dion Larson on 9/17/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

import Foundation

enum MonsterAttackType {
  case None, Tackle, Elemental, Swipe, Sing, PowerUp
  
  func description() -> String {
    switch self {
      case .None:
        return "None"
      case .Tackle:
        return "Tackle"
      case .Elemental:
        return "Elemental"
      case .Swipe:
        return "Swipe"
      case .Sing:
        return "Sing"
      case .PowerUp:
        return "PowerUp"
    }
  }
}

class MonsterAttack {
  var attack = MonsterAttackType.None
  var numberOfTimes = 0 // only relevant for swipe
  
  func resetAttack() {
    attack = MonsterAttackType.None
    numberOfTimes = 0
  }
  
  func tackle() {
    resetAttack()
    attack = MonsterAttackType.Tackle
  }
  
  func swipe() {
    if attack != MonsterAttackType.Swipe {
      resetAttack()
      attack = MonsterAttackType.Swipe
    }
    numberOfTimes++
    
    if numberOfTimes > 5 {
      // handle cheating?
    }
  }
  
  func elemental() {
    resetAttack()
    attack = MonsterAttackType.Elemental
  }
  
  func powerUp() {
    resetAttack()
    attack = MonsterAttackType.PowerUp
  }
  
  func sing() {
    if attack != MonsterAttackType.Sing {
      resetAttack()
      attack = MonsterAttackType.Sing
    }
    numberOfTimes++
  }
  
}