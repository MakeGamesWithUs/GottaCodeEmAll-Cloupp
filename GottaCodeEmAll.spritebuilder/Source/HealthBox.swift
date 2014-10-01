//
//  HealthBox.swift
//  GottaCodeEmAll
//
//  Created by Dion Larson on 9/19/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

import Foundation

class HealthBox: CCNode {
  
  var nameLabel: CCLabelTTF!
  var levelLabel: CCLabelTTF!
  var hpLabel: CCLabelTTF!
  var hpBar: CCSprite!
  
  override init() {
    super.init()
    self.cascadeOpacityEnabled = true
  }
  
  func updateHealth(newHealth: Int) {
    hpLabel.string = String(newHealth)
    
    // update health bar
  }
  
}