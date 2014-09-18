//
//  MyMonster.swift
//  GottaCodeEmAll
//
//  Created by Dion Larson on 9/16/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

import Foundation

class MyMonster: Monster {
  
  func addToBattle() {
    type = MonsterType.Leaf
    readyToBattle()
  }
  
  func tackleAttack() {
    attack(MonsterAttackType.Tackle)
  }
  
  func fireAttack() {
    if opponent?.type == MonsterType.Leaf {
      attack(MonsterAttackType.Elemental)
    }
  }
  
  func waterAttack() {
    if opponent?.type == MonsterType.Fire {
      attack(MonsterAttackType.Elemental)
    }
  }
  
  func leafAttack() {
    if opponent?.type == MonsterType.Water {
      attack(MonsterAttackType.Elemental)
    }
  }
  
  func swipeAttack(numberOfSwipes: Int) {
    for _ in 1...numberOfSwipes {
      attack(MonsterAttackType.Swipe)
    }
  }
  
}