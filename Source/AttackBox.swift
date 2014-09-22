//
//  AttackBox.swift
//  GottaCodeEmAll
//
//  Created by Dion Larson on 9/19/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

import Foundation

class AttackButton: CCNodeColor {
  
  var attackType: MonsterAttackType = MonsterAttackType.None
  
  func didLoadFromCCB() {
    self.userInteractionEnabled = true
  }
  
  override func touchBegan(touch: UITouch, withEvent event: UIEvent) {
    println("Touched \(attackType.description())")
  }
  
}

class AttackBox: CCNode {
  
  var tackleButton: AttackButton?
  var elementalButton: AttackButton?
  var swipeButton: AttackButton?
  
  func didLoadFromCCB() {
    
    tackleButton?.attackType = MonsterAttackType.Tackle
    elementalButton?.attackType = MonsterAttackType.Elemental
    swipeButton?.attackType = MonsterAttackType.Swipe
    
  }
  
}