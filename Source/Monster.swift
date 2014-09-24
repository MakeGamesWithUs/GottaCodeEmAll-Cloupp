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
    switch attackType {
      case MonsterAttackType.Tackle:
        nextAttack.tackle()
      case MonsterAttackType.Elemental:
        nextAttack.elemental()
      case MonsterAttackType.Swipe:
        nextAttack.swipe()
      default:
        break
    }
  }
  
  func performTackle() {
    var tackleDamage = level * 2
    damageOpponent(tackleDamage)
  }
  
  func performElemental() {
    var elementalDamage = level * 5
    damageOpponent(elementalDamage)
  }
  
  func performSwipe() {
    var swipeDamage = level
    damageOpponent(swipeDamage)
  }
  
  func damageOpponent(damage: Int) {
    if self !== GameState.sharedInstance.enemy! {
      GameState.sharedInstance.enemy!.takeDamage(damage)
    } else {
      GameState.sharedInstance.player!.takeDamage(damage)
    }
  }
  
  func takeDamage(damage: Int) {
    health -= damage
  }
  
  func readyToBattle() {
    GameState.sharedInstance.player = self as? MyMonster
  }
  
}