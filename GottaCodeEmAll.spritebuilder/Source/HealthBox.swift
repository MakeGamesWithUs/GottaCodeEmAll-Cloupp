//
//  HealthBox.swift
//  GottaCodeEmAll
//
//  Created by Dion Larson on 9/19/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

import Foundation

class HealthBox: CCNode {
  
  var health: String?
  
  func updateHealth(newHealth: Int) {
    health = String(newHealth)
    
    // update health bar
  }
  
}