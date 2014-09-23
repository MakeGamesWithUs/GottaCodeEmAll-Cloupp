//
//  Monster.swift
//  GottaCodeEmAll
//
//  Created by Dion Larson on 9/15/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

import Foundation

enum MonsterType {
  case Water, Fire, Leaf, None
}

class Monster: CCNode {
  
  var type = MonsterType.None
  var level = 5
  var health = 25
  let totalHealth = 25
  
  let opponent: Monster?
  let nextAttack = MonsterAttack()
  
  override init() {
    super.init()
  }
  
  func attack(attackType: MonsterAttackType) {
    var attack = GameState.sharedInstance.battle?.playerAttack
    switch attackType {
      case MonsterAttackType.Tackle:
        attack?.tackle()
      case MonsterAttackType.Elemental:
        attack?.elemental()
      case MonsterAttackType.Swipe:
        attack?.swipe()
      default:
        break
    }
  }
  
  func readyToBattle() {
    GameState.sharedInstance.player = self
  }
  
}