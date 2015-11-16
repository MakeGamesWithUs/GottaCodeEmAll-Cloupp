//
//  MessageBox.swift
//  GottaCodeEmAll
//
//  Created by Dion Larson on 9/19/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

import Foundation

class LocalizedMessage: CCLabelTTF {
  var nextMessage = ""
  var localizer = CCBLocalizationManager.sharedManager()
}

class MessageBox: CCNode {

  var message: LocalizedMessage!
  var tapToContinue: CCLabelTTF!

  func handleTouch() {
    print("Touched message box!")
    if message.nextMessage == "" {
      goToAttackChoice()
    } else if message.nextMessage != message.string {
      self.animationManager.runAnimationsForSequenceNamed("UpdateMessageFinal")
    }
  }

  func goToAttackChoice() {
    self.animationManager.runAnimationsForSequenceNamed("EaseOut")
    GameState.sharedInstance.battle.attackBox.animationManager.runAnimationsForSequenceNamed("EaseIn")
    self.userInteractionEnabled = false
  }

  func setNextMessage(key: String, name: String = "") {
    message.nextMessage = name + message.localizer.localizedStringForKey(key)
  }

  func updateMessage() {
    message.string = message.nextMessage
  }

  #if os(iOS)
  override func touchBegan(touch: CCTouch, withEvent event: CCTouchEvent) {
    handleTouch()
  }
  #elseif os(OSX)
  override func mouseDown(event: NSEvent) {
    handleTouch()
  }
  #endif

  func touchActive() {
    self.userInteractionEnabled = true
  }

  func fadeOut() {
    self.animationManager.runAnimationsForSequenceNamed("EaseOut")
  }

  func fadeIn() {
    self.animationManager.runAnimationsForSequenceNamed("EaseInNoTouch")
  }

}
