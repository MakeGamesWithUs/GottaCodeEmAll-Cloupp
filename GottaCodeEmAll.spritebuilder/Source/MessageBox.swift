//
//  MessageBox.swift
//  GottaCodeEmAll
//
//  Created by Dion Larson on 9/19/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

import Foundation

class LocalizedMessage: CCLabelTTF {
  
}

class MessageBox: CCNode {
  
  var message: LocalizedMessage?
  var tapToContinue: LocalizedMessage?
  
  func touchActive() {
    self.userInteractionEnabled = true
  }
  
#if os(iOS)
  override func touchBegan(touch: UITouch, withEvent event: UIEvent) {
    self.animationManager.runAnimationsForSequenceNamed("EaseOut")
    self.userInteractionEnabled = false
  }
#endif
  
  func updateMessage() {
    
  }
  
}