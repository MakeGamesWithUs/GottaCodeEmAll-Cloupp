//
//  Battle.swift
//  GottaCodeEmAll
//
//  Created by Dion Larson on 9/15/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

import Foundation

enum BattleState {
  case FixCode, ChooseAttack, Attacking, Win, Lose
}

enum CodeStep {
  case InitCritter, Customize, TeachTackle, TeachElemental, TeachSwipes, TeachSing
  
  func description() -> String {
    switch self {
      case .InitCritter:
        return "InitCritter"
      case .Customize:
        return "Customize"
      case .TeachTackle:
        return "TeachTackle"
      case .TeachElemental:
        return "TeachElemental"
      case .TeachSwipes:
        return "TeachSwipes"
      case .TeachSing:
        return "TeachSing"
    }
  }
}

class GameState {
  
  class var sharedInstance : GameState {
  struct Static {
    static let instance : GameState = GameState()
    }
    return Static.instance
  }
  
  var battle: Battle!
  var enemy: EnemyCritter!
  var player: MyCritter!
  var gameOver: Bool = false
  
}

class Battle: CCScene {

  let playerAttack = CritterAttack()
  
  var currentStep: CodeStep = CodeStep.InitCritter
  var state: BattleState = BattleState.FixCode
  
  var messageBox: MessageBox!
  var attackBox: AttackBox!
  var playerHealth: HealthBox!
  var enemyHealth: HealthBox!
  var player: MyCritter!
  var enemy: EnemyCritter!
  
  override init() {
    super.init()
    GameState.sharedInstance.battle = self
  }
  
  func didLoadFromCCB() {
    GameState.sharedInstance.player = player
    GameState.sharedInstance.enemy = enemy
    player.opponent = enemy
    player.healthBox = playerHealth
    enemy.opponent = player
    enemy.healthBox = enemyHealth
    enemy.isEnemy = true
    
    enemyHealth.opacity = 0.0
    
    checkCodeForCurrentStep()
  }
  
  func playerWins(playerWon: Bool) {
    GameState.sharedInstance.gameOver = true
    if playerWon {
      messageBox.setNextMessage("playerWon")
      enemy.runAction(CCActionFadeTo.actionWithDuration(0.5, opacity: 0.0) as CCAction)
      enemyHealth.runAction(CCActionFadeTo.actionWithDuration(0.5, opacity: 0.0) as CCAction)
    } else {
      messageBox.setNextMessage("playerLost")
      player.runAction(CCActionFadeTo.actionWithDuration(0.5, opacity: 0.0) as CCAction)
      playerHealth.runAction(CCActionFadeTo.actionWithDuration(0.5, opacity: 0.0) as CCAction)
    }
    messageBox.animationManager.runAnimationsForSequenceNamed("UpdateMessageNoTouch")
  }
  func checkCodeForCurrentStep() {
    switch currentStep {
      case CodeStep.InitCritter:
        if !player.respondsToSelector(Selector("initialize")) {
          messageBox.setNextMessage("noCritter")
        } else {
          player.initialize()
          var nameLabel = GameState.sharedInstance.battle.playerHealth.nameLabel.string
          if player.monsterElement == CritterElement.None {
            messageBox.setNextMessage("noCritterType")
          } else {
            setupBattlefield()
            messageBox.setNextMessage("customize")
          }
        }
        enemy.myLevel = player.myLevel
      case CodeStep.Customize:
        setupBattlefield()
        if player.monsterElement == CritterElement.None {
          messageBox.setNextMessage("noCritterType")
        } else {
          messageBox.setNextMessage("teachMoves")
        }
        enemy.myLevel = player.myLevel
      case CodeStep.TeachTackle:
        setupBattlefield()
        if !player.respondsToSelector(Selector("dashButtonPressed")) {
          // TODO: MAKE THIS WORK
          var nameLabel = GameState.sharedInstance.battle.playerHealth.nameLabel.string
          messageBox.setNextMessage("noMoves", name:nameLabel)
        } else {
          attackBox.tackleStep()
        }
        enemy.myLevel = player.myLevel
      case CodeStep.TeachElemental:
        setupBattlefield()
        enemy.myLevel = player.myLevel * 2
        if !player.respondsToSelector(Selector("elementalButtonPressed")) {
          // TODO: MAKE THIS WORK
            var nameLabel = GameState.sharedInstance.battle.playerHealth.nameLabel.string
          messageBox.setNextMessage("noElemental", name:nameLabel)
        } else {
          attackBox.elementalStep()
        }
      case CodeStep.TeachSwipes:
        setupBattlefield()
        enemy.myLevel = Int(Double(player.myLevel) * 1.5)
        if !player.respondsToSelector(Selector("swipeButtonPressed:")) {
          // TODO: MAKE THIS WORK
            var nameLabel = GameState.sharedInstance.battle.playerHealth.nameLabel.string
          messageBox.setNextMessage("noSwipe", name:nameLabel)
        } else {
          attackBox.swipeStep()
        }
      case CodeStep.TeachSing:
        setupBattlefield()
        enemy.myLevel = player.myLevel * 2
        if !player.respondsToSelector(Selector("singButtonPressed")) {
          // TODO: MAKE THIS WORK
            var nameLabel = GameState.sharedInstance.battle.playerHealth.nameLabel.string
          messageBox.setNextMessage("noSing", name:nameLabel)
        }
      default:
        break
    }
    player.opponentLevel = enemy.myLevel
  }
  
  func setupBattlefield() {
    enemyHealth.opacity = 1.0
    playerHealth.opacity = 1.0
    player.initialize()
  }
  
  func processAttacks() {
    state = BattleState.Attacking
    var player = GameState.sharedInstance.player
    var playerAttack = player.nextMove
    switch playerAttack.attack {
      case CritterAttackType.Tackle:
        player.executeTackle()
      case CritterAttackType.Elemental:
        player.executeElemental()
      case CritterAttackType.Swipe:
        player.executeSwipe()
      case CritterAttackType.Sing:
        player.executeSing()
      case CritterAttackType.PowerUp:
        player.executePowerUp()
      case CritterAttackType.None:
        GameState.sharedInstance.enemy.executeTackle()
    }
  }
  
  func setupEnemy(playerType: CritterElement) {
    if GameState.sharedInstance.battle.currentStep == CodeStep.TeachSwipes || GameState.sharedInstance.battle.currentStep == CodeStep.TeachSing {
      switch playerType {
        case CritterElement.None:
          break
        case CritterElement.Leaf:
          enemy.sprite = CCBReader.load("FireFront", owner:enemy)
          enemy.addChild(enemy.sprite)
          enemy.weakAgainst = CritterElement.Water
          player.elementMyOpponentIsWeakAgainst = "water"
          enemyHealth.setupFire()
        case CritterElement.Fire:
          enemy.sprite = CCBReader.load("WaterFront", owner:enemy)
          enemy.addChild(enemy.sprite)
          enemy.weakAgainst = CritterElement.Leaf
          player.elementMyOpponentIsWeakAgainst = "leaf"
          enemyHealth.setupWater()
        case CritterElement.Water:
          enemy.sprite = CCBReader.load("LeafFront", owner:enemy)
          enemy.addChild(enemy.sprite)
          enemy.weakAgainst = CritterElement.Fire
          player.elementMyOpponentIsWeakAgainst = "fire"
          enemyHealth.setupLeaf()
      }
    } else {
      switch playerType {
        case CritterElement.None:
          break
        case CritterElement.Water:
          enemy.sprite = CCBReader.load("FireFront", owner:enemy)
          enemy.addChild(enemy.sprite)
          enemy.weakAgainst = CritterElement.Water
          player.elementMyOpponentIsWeakAgainst = "water"
          enemyHealth.setupFire()
        case CritterElement.Leaf:
          enemy.sprite = CCBReader.load("WaterFront", owner:enemy)
          enemy.addChild(enemy.sprite)
          enemy.weakAgainst = CritterElement.Leaf
          player.elementMyOpponentIsWeakAgainst = "leaf"
          enemyHealth.setupWater()
        case CritterElement.Fire:
          enemy.sprite = CCBReader.load("LeafFront", owner:enemy)
          enemy.addChild(enemy.sprite)
          enemy.weakAgainst = CritterElement.Fire
          player.elementMyOpponentIsWeakAgainst = "fire"
          enemyHealth.setupLeaf()
      }
    }
  }
  
}