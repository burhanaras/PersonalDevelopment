//
//  File.swift
//  BrainWork
//
//  Created by BURHAN ARAS on 1.03.2020.
//  Copyright © 2020 BURHAN ARAS. All rights reserved.
//

import Foundation
import SwiftUI
import AVFoundation
import UIKit

class ColorGameViewModel: ObservableObject, ColorGameDeletage{
  @Published var text: String = ""
  @Published var color: Color = Color.green
  @Published var score: String = ""
  @Published var isNewGameButtonVisible = false
  
  private var game = ColorGame()
  private var audioPlayer: AVAudioPlayer!
  
  init() {
    game.delegate = self
    newGame()
  }
  
  func userHasMadeAChoice(with userChoice: UserChoice){
    game.userHasMadeAChoice(choice: userChoice)
  }
  
  func newGame(){
    game.startNewGame()
  }
  
  // MARK: ColorGameDelegate
  func onNewGameStarted() {
    self.isNewGameButtonVisible = false
  }
  
  func onGameEnded(with finalScore: Int) {
    self.text = "Game Over!"
    self.isNewGameButtonVisible = true
  }
  
  func onNextQuestion(of question: Question) {
    self.text = question.text
    self.color = question.color
  }
  
  func onWrongAnswer() {
    //bizzzt sound
    let musicPath = Bundle.main.path(forResource: "wrong", ofType: "mp3")
    let url = NSURL(fileURLWithPath: musicPath!)
    
    do{
      audioPlayer = try AVAudioPlayer(contentsOf: url as URL)
    }catch _ {
      audioPlayer = nil
    }
    audioPlayer.play()
  }
  
  func onCorrectAnswer() {
    // bingo! sound
    let musicPath = Bundle.main.path(forResource: "correct", ofType: "mp3")
    let url = NSURL(fileURLWithPath: musicPath!)
    
    do{
      audioPlayer = try AVAudioPlayer(contentsOf: url as URL)
    }catch _ {
      audioPlayer = nil
    }
    audioPlayer.play()
  }
  
  func onScoreChanged(with score: Int) {
    self.score = "Score: \(score)"
  }
  
}
