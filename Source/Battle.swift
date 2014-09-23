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
  
  var battle: Battle?
  var enemy: EnemyMonster?
  var player: MyMonster?
  
}

class Battle: CCScene {

  let playerAttack = MonsterAttack()
  
  var currentStep: CodeStep = CodeStep.InitMonster
  var state: BattleState = BattleState.FixCode
  
  var messageBox: MessageBox?
  var attackBox: AttackBox?
  var playerHealth: HealthBox?
  var enemyHealth: HealthBox?
  
  override init() {
    super.init()
    GameState.sharedInstance.battle = self
    self.checkCodeForCurrentStep()
  }
  
  func didLoadFromCCB() {
    
  }
  
  func checkCodeForCurrentStep() {
    switch currentStep {
      case CodeStep.InitMonster:
        break
      case CodeStep.TeachTackle:
        break
      case CodeStep.TeachElemental:
        break
      case CodeStep.TeachSwipes:
        break
    }
  }
  
  func showMessage(message: String) {
    
  }
  
}