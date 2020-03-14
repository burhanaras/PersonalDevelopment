//
//  ColorGameView.swift
//  BrainWork
//
//  Created by BURHAN ARAS on 1.03.2020.
//  Copyright © 2020 BURHAN ARAS. All rights reserved.
//

import Foundation
import SwiftUI


struct ColorGameView: View {
  
  @ObservedObject var viewModel = ColorGameViewModel()
  @State private var showText = true
  
  var body: some View{
    VStack(spacing: 20){
      
      Text(viewModel.text)
        .foregroundColor(viewModel.color)
        .font(.system(size: 72))
        .fontWeight(.bold)
        .multilineTextAlignment(.center)
        .transition(.identity)
        .animation(nil)
        .opacity(showText ? 1 : 0)
      
      
      
      Spacer()
      
      if self.viewModel.isNewGameButtonVisible{
        
        Button(action: {
          self.viewModel.newGame()
        }){
          Text("New Game").fontWeight(.bold)
          .modifier(PrimaryLabel())
        }
      } else{
        
        HStack{
          Button(action: {
            self.viewModel.userHasMadeAChoice(with: UserChoice.OptionCorrect)
            withAnimation(.easeInOut(duration: 0.2)) { self.showText.toggle() }
            withAnimation(.easeInOut(duration: 0.4)) { self.showText.toggle() }
          }){
            Text("CORRECT").fontWeight(.bold)
            .modifier(PrimaryLabel())
          }
          
          
          Button(action: {
            self.viewModel.userHasMadeAChoice(with: UserChoice.OptionWrong)
            withAnimation(.easeInOut(duration: 0.2)) { self.showText.toggle() }
            withAnimation(.easeInOut(duration: 0.4)) { self.showText.toggle() }
          }){
            Text("WRONG").fontWeight(.bold)
            .modifier(PrimaryLabel())
          }
        }
      }
      
      Text(viewModel.score)
      
    }.background(Image("bg-2"))
    
  }
}
