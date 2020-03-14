//
//  Validator.swift
//  BrainWork
//
//  Created by BURHAN ARAS on 11.03.2020.
//  Copyright © 2020 BURHAN ARAS. All rights reserved.
//

import Foundation

class Validator{
  
  func check(for question: Question?, with userChoice: UserChoice) -> Bool{
    
    if let question = question{
      return (question.color.description.lowercased() == question.text.lowercased() && userChoice == UserChoice.OptionCorrect) || (question.color.description.lowercased() != question.text.lowercased() && userChoice == UserChoice.OptionWrong)
    }
    
    return false
  }
}
