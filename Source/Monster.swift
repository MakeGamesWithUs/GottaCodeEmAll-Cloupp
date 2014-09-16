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

enum AttackType {
  case Tackle, Swipe, Elemental
}

class Monster: CCNode {
  
  var type = MonsterType.None
  var level = 5
  var health = 25
  let totalHealth = 25
  
  override init() {
    super.init()
  }
  
  func attack(attackType: AttackType) {
    Battle.sharedInstance.queueAttackForPlayer(attackType)
  }
  
}