//
//  ScoringStrategyOne.swift
//  BrainWork
//
//  Created by BURHAN ARAS on 11.03.2020.
//  Copyright © 2020 BURHAN ARAS. All rights reserved.
//

import Foundation


class ScoringStrategyOne : ScoringStrategy {
  
  private var score = 0
  
  func score(isCorrectAnswer: Bool) -> Int {
    if isCorrectAnswer {
      score += 1
    } else {
      score -= 1
    }
    return score
  }
  
  func currentScore() -> Int {
    return score
  }
  
  
}
