//
//  Monster.swift
//  GottaCodeEmAll
//
//  Created by Dion Larson on 9/15/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

import Foundation
//import Cocoa

enum MonsterElement {
  case Water, Fire, Leaf, None
}

class Monster: CCNode {
  
  var monsterElement = MonsterElement.None
  
  var element: String = "none" {
    didSet {
      element = element.lowercaseString
      switch element {
        case "fire":
          sprite = CCBReader.load("FireBack", owner:self)
          self.addChild(sprite)
          monsterElement = MonsterElement.Fire
          weakAgainst = MonsterElement.Water
          GameState.sharedInstance.battle.playerHealth.setupFire()
        case "water":
          sprite = CCBReader.load("WaterBack", owner:self)
          self.addChild(sprite)
          monsterElement = MonsterElement.Water
          weakAgainst = MonsterElement.Leaf
          GameState.sharedInstance.battle.playerHealth.setupWater()
        case "leaf":
          sprite = CCBReader.load("LeafBack", owner:self)
          self.addChild(sprite)
          monsterElement = MonsterElement.Leaf
          weakAgainst = MonsterElement.Fire
          GameState.sharedInstance.battle.playerHealth.setupLeaf()
        default:
          monsterElement = MonsterElement.None
          element = "none"
      }
      GameState.sharedInstance.battle.setupEnemy(monsterElement)
    }
  }
  var level: Double = 1.0 {
    didSet {
      if isEnemy {
        GameState.sharedInstance.battle.enemyHealth.levelLabel.string = "Level \(Int(level))"
      } else {
        if level < 1.0 {
          level = 1.0
        } else if level > 99.0 {
          level = 99.0
        }
        GameState.sharedInstance.battle.playerHealth.levelLabel.string = "Level \(Int(level))"
      }
      health = level * 5.0
      totalHealth = health
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
  var opponentWeakAgainst: String!
  let nextMove = MonsterAttack()
  var weakAgainst = MonsterElement.None
  var damageToDo = 0.0
  var sprite: CCNode!
  var isEnemy = false
  var healthBox: HealthBox!
  var attackAnimationNode: CCNode!
  
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
  
  func performSing() {
    nextMove.sing()
  }
  
  func performPowerup() {
    nextMove.powerUp()
  }
  
  func executeTackle() {
    var messageBox = GameState.sharedInstance.battle.messageBox
    var nameString: String!
    if isEnemy {
      nameString = GameState.sharedInstance.battle.enemyHealth.nameLabel.string
    } else {
      nameString = GameState.sharedInstance.battle.playerHealth.nameLabel.string
    }
    messageBox.setNextMessage("tackle", name:nameString)
    messageBox.animationManager.runAnimationsForSequenceNamed("UpdateMessageNoTouch")
    sprite.animationManager.runAnimationsForSequenceNamed("Tackle")
    damageToDo = level * 1.5
    nextMove.resetAttack()
  }
  
  func executeElemental() {
    var messageBox = GameState.sharedInstance.battle.messageBox
    var nameString: String!
    if isEnemy {
      nameString = GameState.sharedInstance.battle.enemyHealth.nameLabel.string
    } else {
      nameString = GameState.sharedInstance.battle.playerHealth.nameLabel.string
    }
    // TODO: Consider changing this to use the string
    if opponent.weakAgainst == monsterElement {
      messageBox.setNextMessage("elemental", name:nameString)
      messageBox.animationManager.runAnimationsForSequenceNamed("UpdateMessageNoTouch")
      sprite.animationManager.runAnimationsForSequenceNamed("Elemental")
      damageToDo = level * 5
      nextMove.resetAttack()
    } else {
      messageBox.setNextMessage("missed", name:nameString)
      messageBox.animationManager.runAnimationsForSequenceNamed("UpdateMessageNoTouch")
      sprite.animationManager.runAnimationsForSequenceNamed("Missed")
      damageToDo = 0
      nextMove.resetAttack()
    }
  }
  
  func executeSwipe() {
    var messageBox = GameState.sharedInstance.battle.messageBox
    var nameString: String!
    if isEnemy {
      nameString = GameState.sharedInstance.battle.enemyHealth.nameLabel.string
    } else {
      nameString = GameState.sharedInstance.battle.playerHealth.nameLabel.string
    }
    messageBox.setNextMessage("swipe", name:nameString)
    messageBox.animationManager.runAnimationsForSequenceNamed("UpdateMessageNoTouch")
    sprite.animationManager.runAnimationsForSequenceNamed("Swipe")
    damageToDo = level
    nextMove.numberOfTimes--
    if nextMove.numberOfTimes == 0 {
      nextMove.resetAttack()
    }
  }
  
  func executeSing() {
    var messageBox = GameState.sharedInstance.battle.messageBox
    var nameString: String!
    if isEnemy {
      nameString = GameState.sharedInstance.battle.enemyHealth.nameLabel.string
    } else {
      nameString = GameState.sharedInstance.battle.playerHealth.nameLabel.string
    }
    if opponent.level < level {
      messageBox.setNextMessage("sing", name:nameString)
      messageBox.animationManager.runAnimationsForSequenceNamed("UpdateMessageNoTouch")
      sprite.animationManager.runAnimationsForSequenceNamed("Sing")
      damageToDo = level * 2
      nextMove.numberOfTimes--
      if nextMove.numberOfTimes == 0 {
        nextMove.resetAttack()
      }
    } else {
      messageBox.setNextMessage("missed", name:nameString)
      messageBox.animationManager.runAnimationsForSequenceNamed("UpdateMessageNoTouch")
      sprite.animationManager.runAnimationsForSequenceNamed("Missed")
      damageToDo = 0
      nextMove.resetAttack()
    }
  }
  
  func executePowerUp() {
    var messageBox = GameState.sharedInstance.battle.messageBox
    var nameString: String!
    if isEnemy {
      nameString = GameState.sharedInstance.battle.enemyHealth.nameLabel.string
    } else {
      nameString = GameState.sharedInstance.battle.playerHealth.nameLabel.string
    }
    messageBox.setNextMessage("powerUp", name:nameString)
    messageBox.animationManager.runAnimationsForSequenceNamed("UpdateMessageNoTouch")
    sprite.animationManager.runAnimationsForSequenceNamed("PowerUp")
    damageToDo = level * 1.5
    nextMove.resetAttack()
  }
  
  func damageOpponent() {
    if isEnemy {
      GameState.sharedInstance.player.takeDamage(damageToDo)
    } else {
      GameState.sharedInstance.enemy.takeDamage(damageToDo)
    }
  }
  
  func nextAttack() {
    if opponent.health > 0 {
      GameState.sharedInstance.battle.processAttacks()
    } else {
      if !isEnemy {
        GameState.sharedInstance.battle.playerWins(true)
      } else {
        GameState.sharedInstance.battle.playerWins(false)
      }
    }
  }
  
  func attacksDone() {
    if opponent.health > 0 {
      GameState.sharedInstance.battle.messageBox.fadeOut()
      GameState.sharedInstance.battle.attackBox.fadeIn()
    } else {
      if !isEnemy {
        GameState.sharedInstance.battle.playerWins(true)
      } else {
        GameState.sharedInstance.battle.playerWins(false)
      }
    }
  }
  
  func takeDamage(damage: Double) {
    health = health - damage
    var healthBar = healthBox.hpBar
    
    if health <= 0 {
      var hpShrink = CCActionScaleTo.actionWithDuration(1.0, scaleX:0.0, scaleY:1.0) as CCAction
      healthBar.runAction(hpShrink)
    } else {
      var hpScale = Float(health / totalHealth)
      var hpShrink = CCActionScaleTo.actionWithDuration(1.0, scaleX:hpScale, scaleY:1.0) as CCAction
      healthBar.runAction(hpShrink)
    }
  }
  
  func addElementalToOpponent() {
    var anim: CCNode!
    switch monsterElement {
      case MonsterElement.Fire:
        anim = CCBReader.load("FireElemental")
      case MonsterElement.Water:
        anim = CCBReader.load("WaterElemental")
      case MonsterElement.Leaf:
        anim = CCBReader.load("LeafElemental")
      case MonsterElement.None:
        anim = CCBReader.load("FireElemental")
    }
    opponent.attackAnimationNode.addChild(anim)
  }
  
  func addTackleToOpponent() {
    var anim: CCNode!
    switch monsterElement {
    case MonsterElement.Fire:
      anim = CCBReader.load("TackleRed")
    case MonsterElement.Water:
      anim = CCBReader.load("TackleBlue")
    case MonsterElement.Leaf:
      anim = CCBReader.load("TackleGreen")
    case MonsterElement.None:
      anim = CCBReader.load("TackleRed")
    }
    opponent.attackAnimationNode.addChild(anim)
  }
  
  func addSwipeToOpponent() {
    var anim: CCNode = CCBReader.load("Slash")
    opponent.attackAnimationNode.addChild(anim)
  }
  
  func addSingToOpponent() {
    var anim: CCNode = CCBReader.load("Sing")
    opponent.attackAnimationNode.addChild(anim)
  }
  
  func initialize() {
    
  }

  func setupMonsterStats() {

  }
  
  func tackleButtonPressed() {
    
  }

  func swipeButtonPressed(numberOfSwipes: Int) {
    
  }
  
  func elementalButtonPressed() {
    
  }
  
  func powerUpButtonPressed() {
    
  }
  
  func singButtonPressed() {
    
  }

}