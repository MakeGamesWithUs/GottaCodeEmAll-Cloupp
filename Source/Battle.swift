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
  var enemy: Monster?
  var player: Monster?
  
}

class Battle: CCScene {

  let playerAttack = MonsterAttack()
  
  var currentStep: CodeStep?
  var state: BattleState = BattleState.FixCode
  
  var tapToContinue: CCLabelTTF?
  
  override init() {
    super.init()
    GameState.sharedInstance.battle = self
    self.checkCodeForCurrentStep()
  }
  
  func checkCodeForCurrentStep() {
    
  }
  
  func showMessage(message: String) {
    
  }
  
}