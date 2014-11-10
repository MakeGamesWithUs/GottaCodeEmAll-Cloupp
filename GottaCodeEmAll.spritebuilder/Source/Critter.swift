//
//  Critter.swift
//  GottaCodeEmAll
//
//  Created by Dion Larson on 9/15/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

import Foundation
//import Cocoa

enum CritterElement {
  case Water, Fire, Leaf, None
}

class Critter: CCNode {
  
  var monsterElement = CritterElement.None
  
  var myElement: String = "none" {
    didSet {
      myElement = myElement.lowercaseString
      switch myElement {
        case "fire":
          self.removeAllChildren()
          sprite = CCBReader.load("FireBack", owner:self)
          self.addChild(sprite)
          monsterElement = CritterElement.Fire
          weakAgainst = CritterElement.Water
          GameState.sharedInstance.battle.playerHealth.setupFire()
        case "water":
          self.removeAllChildren()
          sprite = CCBReader.load("WaterBack", owner:self)
          self.addChild(sprite)
          monsterElement = CritterElement.Water
          weakAgainst = CritterElement.Leaf
          GameState.sharedInstance.battle.playerHealth.setupWater()
        case "leaf":
          self.removeAllChildren()
          sprite = CCBReader.load("LeafBack", owner:self)
          self.addChild(sprite)
          monsterElement = CritterElement.Leaf
          weakAgainst = CritterElement.Fire
          GameState.sharedInstance.battle.playerHealth.setupLeaf()
        default:
          monsterElement = CritterElement.None
          myElement = "none"
      }
      if monsterElement != CritterElement.None {
        GameState.sharedInstance.battle.setupEnemy(monsterElement)
      }
    }
  }
  var myLevel: Int = 1 {
    didSet {
      if isEnemy {
        GameState.sharedInstance.battle.enemyHealth.levelLabel.string = "Level \(Int(myLevel))"
      } else if GameState.sharedInstance.battle.playerHealth.levelLabel.string == "Level 1" {
        if myLevel < 1 {
          myLevel = 1
        } else if myLevel > 99 {
          myLevel = 99
        }
        GameState.sharedInstance.battle.playerHealth.levelLabel.string = "Level \(Int(myLevel))"
      }
      var oldHealthPercent = health / totalHealth
      totalHealth = Double(myLevel) * 5.0
      health = totalHealth * oldHealthPercent
    }
  }
  
  var opponentLevel = 1
  var levelDifference = 0
  
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
  var opponent: Critter!
  var elementMyOpponentIsWeakAgainst: String!
  let nextMove = CritterAttack()
  var weakAgainst = CritterElement.None
  var damageToDo = 0.0
  var sprite: CCNode!
  var isEnemy = false
  var healthBox: HealthBox!
  var attackAnimationNode: CCNode!
  
  override init() {
    super.init()
    self.cascadeOpacityEnabled = true
  }
  
  func performDash() {
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
    damageToDo = Double(myLevel) * 1.5
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
      damageToDo = Double(myLevel) * 5
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
    damageToDo = Double(myLevel)
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
    if opponent.myLevel < myLevel {
      messageBox.setNextMessage("sing", name:nameString)
      messageBox.animationManager.runAnimationsForSequenceNamed("UpdateMessageNoTouch")
      sprite.animationManager.runAnimationsForSequenceNamed("Sing")
      damageToDo = Double(myLevel) * 2
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
      case CritterElement.Fire:
        anim = CCBReader.load("FireElemental")
      case CritterElement.Water:
        anim = CCBReader.load("WaterElemental")
      case CritterElement.Leaf:
        anim = CCBReader.load("LeafElemental")
      case CritterElement.None:
        anim = CCBReader.load("FireElemental")
    }
    opponent.attackAnimationNode.addChild(anim)
  }
  
  func addTackleToOpponent() {
    var anim: CCNode!
    switch monsterElement {
    case CritterElement.Fire:
      anim = CCBReader.load("TackleRed")
    case CritterElement.Water:
      anim = CCBReader.load("TackleBlue")
    case CritterElement.Leaf:
      anim = CCBReader.load("TackleGreen")
    case CritterElement.None:
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
  
  func dashButtonPressed() {
    
  }

  func swipeButtonPressed(numberOfSwipes: Int) {
    
  }
  
  func elementalButtonPressed() {
    
  }
  
  func singButtonPressed() {
    
  }

}