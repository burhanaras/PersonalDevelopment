//
//  Quiz.swift
//  BrainWork
//
//  Created by BURHAN ARAS on 11.03.2020.
//  Copyright © 2020 BURHAN ARAS. All rights reserved.
//

import Foundation


class Quiz{
  
  private var questions = [Question]()
  private var currentQuestion: Question?
  
  func setQuestions(_ quests: [Question]){
    self.questions = quests
    self.currentQuestion = nil
  }
  
  func isOver() -> Bool{
    return questions.count == 0
  }
  
  func current() -> Question?{
    return currentQuestion
  }
  
  func nextQuestion() -> Question? {
    currentQuestion = questions.first
    if questions.count > 0{
      questions.remove(at: 0)
    }
    return currentQuestion
  }
  
}
