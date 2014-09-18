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

class Battle: CCScene {
  
  var enemy: Monster?
  var player: Monster?
  let playerAttack = MonsterAttack()
  
  var currentStep: CodeStep?
  var state: BattleState = BattleState.FixCode
  
  class var sharedInstance : Battle {
    struct Static {
      static let instance : Battle = Battle()
    }
    return Static.instance
  }
  
  override init() {
    super.init()
    self.checkCodeForCurrentStep()
  }
  
  func checkCodeForCurrentStep() {
    
  }
  
  func showMessage(message: String) {
    
  }
  
}