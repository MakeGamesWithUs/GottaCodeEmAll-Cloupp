//
//  Monster.swift
//  GottaCodeEmAll
//
//  Created by Dion Larson on 9/15/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

import Foundation
import Cocoa

enum MonsterElement {
  case Water, Fire, Leaf, None
}

class Monster: CCNode {
  
  var element: MonsterElement = MonsterElement.None {
    didSet {
      switch element {
        case MonsterElement.None:
          break
        case MonsterElement.Fire:
          sprite = CCBReader.load("FireBack", owner:self)
          self.addChild(sprite)
          weakAgainst = MonsterElement.Water
          GameState.sharedInstance.battle.playerHealth.setupFire()
        case MonsterElement.Water:
          sprite = CCBReader.load("WaterBack", owner:self)
          self.addChild(sprite)
          weakAgainst = MonsterElement.Leaf
          GameState.sharedInstance.battle.playerHealth.setupWater()
        case MonsterElement.Leaf:
          sprite = CCBReader.load("LeafBack", owner:self)
          self.addChild(sprite)
          weakAgainst = MonsterElement.Fire
          GameState.sharedInstance.battle.playerHealth.setupLeaf()
      }
      GameState.sharedInstance.battle.setupEnemy(element)
    }
  }
  var level: Double = 5.0 {
    didSet {
      health = level * 5.0
      totalHealth = health
      if isEnemy {
        GameState.sharedInstance.battle.enemyHealth.levelLabel.string = "Level \(Int(level))"
      } else {
        GameState.sharedInstance.battle.playerHealth.levelLabel.string = "Level \(Int(level))"
      }
    }
  }
  var health = 25.0
  var totalHealth = 25.0
  var nickname: String = "" {
    didSet {
      if nickname != "" {
        GameState.sharedInstance.battle.playerHealth.nameLabel.string = nickname
      }
    }
  }
  
  // TODO: refactor to use this more often
  var opponent: Monster!
  let nextMove = MonsterAttack()
  var weakAgainst = MonsterElement.None
  var damageToDo = 0.0
  var sprite: CCNode!
  var isEnemy = false
  var healthBox: HealthBox!
  
  override init() {
    super.init()
    self.cascadeOpacityEnabled = true
  }
  
  func performTackle() {
    nextMove.tackle()
  }
  
  func performElemental() {
    nextMove.elemental()
  }
  
  func performSwipe() {
    nextMove.swipe()
  }
  
  func executeTackle() {
    var messageBox = GameState.sharedInstance.battle.messageBox
    if isEnemy {
      messageBox.setNextMessage("enemyTackle")
      
    } else {
      messageBox.setNextMessage("tackle")
    }
    messageBox.animationManager.runAnimationsForSequenceNamed("UpdateMessageNoTouch")
    sprite.animationManager.runAnimationsForSequenceNamed("Tackle")
    damageToDo = level * 1.5
    nextMove.resetAttack()
  }
  
  func executeElemental() {
    var messageBox = GameState.sharedInstance.battle.messageBox
    messageBox.setNextMessage("elemental")
    messageBox.animationManager.runAnimationsForSequenceNamed("UpdateMessageNoTouch")
    sprite.animationManager.runAnimationsForSequenceNamed("Elemental")
    damageToDo = level * 5
    nextMove.resetAttack()
  }
  
  func executeSwipe() {
    var messageBox = GameState.sharedInstance.battle.messageBox
    messageBox.setNextMessage("swipe")
    messageBox.animationManager.runAnimationsForSequenceNamed("UpdateMessageNoTouch")
    sprite.animationManager.runAnimationsForSequenceNamed("Swipe")
    damageToDo = level
    nextMove.numberOfTimes--
    if nextMove.numberOfTimes == 0 {
      nextMove.resetAttack()
    }
  }
  
  func damageOpponent() {
    if isEnemy {
      GameState.sharedInstance.player.takeDamage(damageToDo)
    } else {
      GameState.sharedInstance.enemy.takeDamage(damageToDo)
    }
  }
  
  func nextAttack() {
    if !GameState.sharedInstance.gameOver {
      GameState.sharedInstance.battle.processAttacks()
    }
  }
  
  func attacksDone() {
    if !GameState.sharedInstance.gameOver {
      GameState.sharedInstance.battle.messageBox.fadeOut()
      GameState.sharedInstance.battle.attackBox.fadeIn()
    }
  }
  
  func takeDamage(damage: Double) {
    health = health - damage
    var healthBar = healthBox.hpBar
    
    if health <= 0 {
      // trigger win
//      var scaleAction = CCActionScaleTo.actionWithDuration(0.5, scale:0.0) as CCActionFiniteTime
//      var endAction: CCActionFiniteTime
//      
//      var callBlock: () -> Void
//      
//      if isEnemy {
//        callBlock = { GameState.sharedInstance.battle.playerWins(true) }
//      } else {
//        callBlock = { GameState.sharedInstance.battle.playerWins(false) }
//      }
//
//      endAction = CCActionCallBlock.actionWithBlock(callBlock) as CCActionInstant
//      var hpShrinkSequence = CCActionSequence.actionOne(scaleAction, two: endAction) as CCAction
//      healthBar.runAction(hpShrinkSequence)
      healthBar.scaleX = 0.0
      if isEnemy {
        GameState.sharedInstance.battle.playerWins(true)
      } else {
        GameState.sharedInstance.battle.playerWins(false)
      }
    } else {
      var hpScale = Float(health / totalHealth)
//      var hpShrink = CCActionScaleTo.actionWithDuration(0.5, scale:hpScale) as CCAction
//      healthBar.runAction(hpShrink)
      healthBar.scaleX = hpScale
    }
  }
  
  func addToBattle() {
    
  }
  
  func tackleMove() {
    
  }
  
  func elementalMove() {
    
  }
  
  func swipeMove(numberOfSwipes: Int) {
    
  }
  
  

}