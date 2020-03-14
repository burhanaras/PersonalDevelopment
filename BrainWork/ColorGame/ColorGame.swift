//
//  ColorGame.swift
//  BrainWork
//
//  Created by BURHAN ARAS on 2.03.2020.
//  Copyright © 2020 BURHAN ARAS. All rights reserved.
//

import Foundation
import SwiftUI
import AVFoundation

protocol ColorGameDeletage{
  func onNewGameStarted()
  func onGameEnded(with finalScore: Int)
  func onNextQuestion(of question: Question)
  func onWrongAnswer()
  func onCorrectAnswer()
  func onScoreChanged(with score: Int)
}

class ColorGame{

  var delegate: ColorGameDeletage?
  
  private(set) var score = 0 {
    didSet{ delegate?.onScoreChanged(with: score)}
  }
  private var texts = ["BLACK", "RED", "GREEN", "YELLOW", "BLUE", "WHITE"]
  private let colors = [Color.black, Color.red, Color.green, Color.yellow, Color.blue, Color.white]
  private var quiz = Quiz()
  private let totalQuestionColorInAGame = 3
  private let quizStrategy = QuizStrategyTwo()
  private var isLastQuestionAnswered = false
  private var validator = Validator()
  private var scoring = ScoringStrategyOne()
  
  
  func startNewGame(){
    quizStrategy.generateQuiz(of: totalQuestionColorInAGame, texts: texts, colors: colors){ quests in
      print(quests)
      scoring = ScoringStrategyOne()
      quiz = Quiz()
      quiz.setQuestions(quests)
      score = 0
      isLastQuestionAnswered = false
      delegate?.onNewGameStarted()
      if let thefirstQuestion = quiz.nextQuestion() {
        delegate?.onNextQuestion(of: thefirstQuestion)
      }
    }
  }
  
  func userHasMadeAChoice(choice userChoice:  UserChoice){
  
    guard isGameOn() else {
      delegate?.onGameEnded(with: scoring.currentScore())
      return
    }
    
    let result = validator.check(for: quiz.current(), with: userChoice)
    if result {
      delegate?.onCorrectAnswer()
    } else{
      delegate?.onWrongAnswer()
    }
    self.score = scoring.score(isCorrectAnswer: result)
    if let theNextQuestion = quiz.nextQuestion(){
      delegate?.onNextQuestion(of: theNextQuestion)
    } else{
      delegate?.onGameEnded(with: score)
    }
    
  }
  
  func isGameOn() -> Bool {
    if quiz.isOver() {
      if isLastQuestionAnswered {
        return false
      } else{
        isLastQuestionAnswered = true
        return true
      }
    }
    return true
  }
  
}

enum UserChoice {
  case OptionCorrect
  case OptionWrong
}


struct Question{
  var text: String
  var color: Color
}
