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
  var elementFire: CCSprite!
  var elementWater: CCSprite!
  var elementLeaf: CCSprite!
  
  override init() {
    super.init()
    self.cascadeOpacityEnabled = true
  }
  
  func updateHealth(newHealth: Int) {
    hpLabel.string = String(newHealth)
    
    // update health bar
  }
  
  func setupFire() {
    if nameLabel.string == "Missingno." {
      nameLabel.string = "Phoenix"
    }
    elementFire.visible = true
    elementLeaf.visible = false
    elementWater.visible = false
  }
  
  func setupWater() {
    if nameLabel.string == "Missingno." {
      nameLabel.string = "Crabby"
    }
    elementFire.visible = false
    elementLeaf.visible = false
    elementWater.visible = true
  }
  
  func setupLeaf() {
    if nameLabel.string == "Missingno." {
      nameLabel.string = "Leafy"
    }
    elementFire.visible = false
    elementLeaf.visible = true
    elementWater.visible = false
  }
  
}