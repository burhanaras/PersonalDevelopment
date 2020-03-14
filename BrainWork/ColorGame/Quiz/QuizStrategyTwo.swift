//
//  StrategyTwo.swift
//  BrainWork
//
//  Created by BURHAN ARAS on 8.03.2020.
//  Copyright © 2020 BURHAN ARAS. All rights reserved.
//

import Foundation
import SwiftUI

class QuizStrategyTwo: QuizStrategy {
  
  private var texts = [String]()
  private var colors = [Color]()
  
  func generateQuiz(of count: Int, texts: [String], colors: [Color], onComplete: ([Question]) -> ()) {
    self.texts = texts
    self.colors = colors
    let randomNumbers = (1...count).map{_ in Int.random(in: 1...4)}
    
    var questions = [Question]()
    
    var counter = 0
    while questions.count < count {
      questions = questions + correct(of: randomNumbers[counter])
      counter += 1
      questions = questions + wrong(of: randomNumbers[counter])
    }
    onComplete(Array(questions.prefix(count)))
  }
  
  func correct(of count: Int) -> [Question]{
    var random = 0
    
    var questions = [Question]()
    for _ in 0..<count{
      random = Int.random(in: 0..<texts.count)
      let question = Question(text: self.texts[random], color: self.colors[random])
      questions.append(question)
    }
    return questions
  }
  
  func wrong(of count: Int) -> [Question]{
    
    var questions = [Question]()
    for _ in 0..<count{
      let textsRandom = Int.random(in: 0..<texts.count)
      let random = Int.random(in: 1..<texts.count - 1)
      let colorRandom = (textsRandom + random) % texts.count
      let question = Question(text: self.texts[textsRandom], color: self.colors[colorRandom])
      questions.append(question)
    }
    return questions
  }
  
}
