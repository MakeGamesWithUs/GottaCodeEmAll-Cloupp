//
//  EnemyMonster.swift
//  GottaCodeEmAll
//
//  Created by Dion Larson on 9/19/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

import Foundation

class EnemyMonster: Monster {
  
  override init() {
    super.init()
    GameState.sharedInstance.enemy = self
    nextAttack.tackle()
  }
  
}