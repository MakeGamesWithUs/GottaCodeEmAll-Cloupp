//
//  CritterAttack.swift
//  GottaCodeEmAll
//
//  Created by Dion Larson on 9/17/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

import Foundation

enum CritterAttackType {
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

class CritterAttack {
  var attack = CritterAttackType.None
  var numberOfTimes = 0 // only relevant for swipe
  
  func resetAttack() {
    attack = CritterAttackType.None
    numberOfTimes = 0
  }
  
  func tackle() {
    resetAttack()
    attack = CritterAttackType.Tackle
  }
  
  func swipe() {
    if attack != CritterAttackType.Swipe {
      resetAttack()
      attack = CritterAttackType.Swipe
    }
    numberOfTimes++
    
    if numberOfTimes > 5 {
      // handle cheating?
    }
  }
  
  func elemental() {
    resetAttack()
    attack = CritterAttackType.Elemental
  }
  
  func powerUp() {
    resetAttack()
    attack = CritterAttackType.PowerUp
  }
  
  func sing() {
    if attack != CritterAttackType.Sing {
      resetAttack()
      attack = CritterAttackType.Sing
    }
    numberOfTimes++
  }
  
}