//
//  ScoringStrategy.swift
//  BrainWork
//
//  Created by BURHAN ARAS on 11.03.2020.
//  Copyright © 2020 BURHAN ARAS. All rights reserved.
//

import Foundation


protocol ScoringStrategy {
  func score(isCorrectAnswer: Bool) -> Int
  func currentScore() -> Int
}
