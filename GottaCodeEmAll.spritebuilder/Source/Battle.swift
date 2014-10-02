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
  case InitMonster, Customize, TeachTackle, TeachElemental, TeachSwipes
  
  func description() -> String {
    switch self {
      case .InitMonster:
        return "InitMonster"
      case .Customize:
        return "Customize"
      case .TeachTackle:
        return "TeachTackle"
      case .TeachElemental:
        return "TeachElemental"
      case .TeachSwipes:
        return "TeachSwipes"
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
  var enemy: EnemyMonster!
  var player: MyMonster!
  var gameOver: Bool = false
  
}

class Battle: CCScene {

  let playerAttack = MonsterAttack()
  
  var currentStep: CodeStep = CodeStep.TeachTackle
  var state: BattleState = BattleState.FixCode
  
  var messageBox: MessageBox!
  var attackBox: AttackBox!
  var playerHealth: HealthBox!
  var enemyHealth: HealthBox!
  var player: MyMonster!
  var enemy: EnemyMonster!
  
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
    playerHealth.opacity = 0.0
    
    checkCodeForCurrentStep()
  }
  
  func playerWins(playerWon: Bool) {
    GameState.sharedInstance.gameOver = true
    if playerWon {
      messageBox.setNextMessage("playerWon")
    } else {
      messageBox.setNextMessage("playerLost")
    }
    messageBox.animationManager.runAnimationsForSequenceNamed("UpdateMessageNoTouch")
  }
  
  func checkCodeForCurrentStep() {
    switch currentStep {
      case CodeStep.InitMonster:
        if !player.respondsToSelector(Selector("addToBattle")) {
          messageBox.setNextMessage("noMonster")
        } else {
          player.addToBattle()
          if player.type == MonsterType.None {
            messageBox.setNextMessage("noMonsterType")
          } else {
            setupBattlefield()
            messageBox.setNextMessage("customize")
          }
        }
      case CodeStep.Customize:
        setupBattlefield()
        messageBox.setNextMessage("teachMoves")
      case CodeStep.TeachTackle:
        setupBattlefield()
        if !player.respondsToSelector(Selector("tackleMove")) {
          messageBox.setNextMessage("noMoves")
        }
      case CodeStep.TeachElemental:
        setupBattlefield()
        if !player.respondsToSelector(Selector("elementalMove")) {
          messageBox.setNextMessage("noElemental")
        }
      case CodeStep.TeachSwipes:
        setupBattlefield()
        if !player.respondsToSelector(Selector("swipeMove")) {
          messageBox.setNextMessage("noSwipe")
        }
      default:
        break
    }
  }
  
  func setupBattlefield() {
    enemyHealth.opacity = 1.0
    playerHealth.opacity = 1.0
    player.addToBattle()
  }
  
  func processAttacks() {
    state = BattleState.Attacking
    var player = GameState.sharedInstance.player
    var playerAttack = player.nextMove
    switch playerAttack.attack {
      case MonsterAttackType.Tackle:
        player.executeTackle()
      case MonsterAttackType.Elemental:
        player.executeElemental()
      case MonsterAttackType.Swipe:
        player.executeSwipe()
      case MonsterAttackType.None:
        GameState.sharedInstance.enemy.executeTackle()
    }
  }
  
  func setupEnemy(playerType: MonsterType) {
    switch playerType {
      case MonsterType.None:
        break
      case MonsterType.Water:
        enemy.sprite = CCBReader.load("FireFront", owner:enemy)
        enemy.addChild(enemy.sprite)
        enemy.weakAgainst = MonsterType.Water
        enemyHealth.setupFire()
      case MonsterType.Leaf:
        enemy.sprite = CCBReader.load("WaterFront", owner:enemy)
        enemy.addChild(enemy.sprite)
        enemy.weakAgainst = MonsterType.Leaf
        enemyHealth.setupWater()
      case MonsterType.Fire:
        enemy.sprite = CCBReader.load("LeafFront", owner:enemy)
        enemy.addChild(enemy.sprite)
        enemy.weakAgainst = MonsterType.Fire
        enemyHealth.setupLeaf()
    }
  }
  
  
  
}