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
  
  var type: MonsterType = MonsterType.None {
    didSet {
      switch type {
        case MonsterType.None:
          break
        case MonsterType.Fire:
          sprite = CCBReader.load("FireBack")
          self.addChild(sprite)
          weakAgainst = MonsterType.Water
          GameState.sharedInstance.battle.playerHealth.setupFire()
        case MonsterType.Water:
          sprite = CCBReader.load("WaterBack")
          self.addChild(sprite)
          weakAgainst = MonsterType.Leaf
          GameState.sharedInstance.battle.playerHealth.setupWater()
        case MonsterType.Leaf:
          sprite = CCBReader.load("LeafBack")
          self.addChild(sprite)
          weakAgainst = MonsterType.Fire
          GameState.sharedInstance.battle.playerHealth.setupLeaf()
      }
      GameState.sharedInstance.battle.setupEnemy(type)
    }
  }
  var level = 5.0
  var health = 25.0
  let totalHealth = 25.0
  var nickname: String = "" {
    didSet {
      if nickname != "" {
        GameState.sharedInstance.battle.playerHealth.nameLabel.string = nickname
      }
    }
  }
  
  // TODO: refactor to use this more often
  var opponent: Monster!
  let nextAttack = MonsterAttack()
  var weakAgainst = MonsterType.None
  var damageToDo = 0.0
  var sprite: CCNode!
  
  override init() {
    super.init()
  }
  
  func performTackle() {
    nextAttack.tackle()
  }
  
  func performElemental() {
    nextAttack.elemental()
  }
  
  func performSwipe() {
    nextAttack.swipe()
  }
  
  func executeTackle() {
    self.animationManager.runAnimationsForSequenceNamed("Tackle")
    damageToDo = level * 2
  }
  
  func executeElemental() {
    self.animationManager.runAnimationsForSequenceNamed("Elemental")
    damageToDo = level * 5
  }
  
  func executeSwipe() {
    self.animationManager.runAnimationsForSequenceNamed("Swipe")
    damageToDo = level
  }
  
  func damageOpponent() {
    if self !== GameState.sharedInstance.enemy! {
      GameState.sharedInstance.enemy.takeDamage(damageToDo)
    } else {
      GameState.sharedInstance.player.takeDamage(damageToDo)
    }
  }
  
  func takeDamage(damage: Double) {
    health = health - damage
    var healthBar: CCNode
    
    if self !== GameState.sharedInstance.enemy! {
      healthBar = GameState.sharedInstance.battle.enemyHealth.hpBar
    } else {
      healthBar = GameState.sharedInstance.battle.playerHealth.hpBar
    }
    
    if health <= 0 {
      // trigger win
      var scaleAction = CCActionScaleTo.actionWithDuration(0.5, scale:0.0) as CCActionFiniteTime
      var endAction: CCActionFiniteTime
      
      var callBlock: () -> Void
      
      if self !== GameState.sharedInstance.enemy! {
        callBlock = { GameState.sharedInstance.battle.playerWins(false) }
      } else {
        callBlock = { GameState.sharedInstance.battle.playerWins(true) }
      }
      
      endAction = CCActionCallBlock.actionWithBlock(callBlock) as CCActionInstant
      var hpShrinkSequence = CCActionSequence.actionOne(scaleAction, two: endAction) as CCAction
      healthBar.runAction(hpShrinkSequence)
    } else {
      var hpScale = Float(health / totalHealth)
      var hpShrink = CCActionScaleTo.actionWithDuration(0.5, scale:hpScale) as CCAction
      healthBar.runAction(hpShrink)
    }
  }
  
  

}