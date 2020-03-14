//
//  StrategyOne.swift
//  BrainWork
//
//  Created by BURHAN ARAS on 8.03.2020.
//  Copyright © 2020 BURHAN ARAS. All rights reserved.
//

import Foundation
import SwiftUI


class QuizStrategyOne: QuizStrategy{
  func generateQuiz(of totalQuestionColorInAGame: Int, texts: [String], colors: [Color], onComplete: ([Question]) -> ()) {
    var colorNmes = [String: Color]()
    
    let count = min(texts.count, colors.count)
    
    for index in 0..<count{
      let key = texts[index]
      let value = colors[index]
      colorNmes[key] = value
    }
    
    var gameItems = [Question]()
    for _ in 0..<totalQuestionColorInAGame{
      var random = Int.random(in: 0..<colors.count)
      let text = texts[random]
      random = Int.random(in: 0..<colors.count)
      let color = colors[random]
      gameItems.append(Question(text: text, color:color))
    }
    
    onComplete(gameItems)
    
  }
  
  
}
