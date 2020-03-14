//
//  Strategy.swift
//  BrainWork
//
//  Created by BURHAN ARAS on 8.03.2020.
//  Copyright © 2020 BURHAN ARAS. All rights reserved.
//

import Foundation
import SwiftUI

protocol QuizStrategy {
  func generateQuiz(of count: Int, texts: [String], colors: [Color], onComplete: ([Question]) -> ())
}
