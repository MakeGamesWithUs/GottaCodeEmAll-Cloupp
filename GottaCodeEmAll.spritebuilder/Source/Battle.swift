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
  case InitMonster, TeachTackle, TeachElemental, TeachSwipes
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
  
}

class Battle: CCScene {

  let playerAttack = MonsterAttack()
  
  var currentStep: CodeStep = CodeStep.InitMonster
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
    checkCodeForCurrentStep()
  }
  
  func didLoadFromCCB() {
    GameState.sharedInstance.player = player
    GameState.sharedInstance.enemy = enemy
    
    enemyHealth.opacity = 0.0
    playerHealth.opacity = 0.0
  }
  
  func checkCodeForCurrentStep() {
    switch currentStep {
      case CodeStep.InitMonster:
        if !player.respondsToSelector(Selector("addToBattle")) {
          messageBox.setNextMessage("noMonster")
        } else {
          // handle no monstertype
        }
      case CodeStep.TeachTackle:
        if !player.respondsToSelector(Selector("tackleAttack")) {
          messageBox.setNextMessage("noMoves")
        }
      case CodeStep.TeachElemental:
        if !player.respondsToSelector(Selector("elementalAttack")) {
          messageBox.setNextMessage("noElemental")
      }
      case CodeStep.TeachSwipes:
        if !player.respondsToSelector(Selector("swipeAttack")) {
          messageBox.setNextMessage("noSwipe")
      }
    }
  }
  
  func showMessage(message: String) {
    
  }
  
  func processAttacks() {
    state = BattleState.Attacking
    var player = GameState.sharedInstance.player
    var playerAttack = player.nextAttack
    switch playerAttack.attack {
      case MonsterAttackType.Tackle:
        player.performTackle()
      case MonsterAttackType.Elemental:
        player.performElemental()
      case MonsterAttackType.Swipe:
        player.performSwipe()
      case MonsterAttackType.None:
        GameState.sharedInstance.enemy.performTackle()
    }
  }
  
}