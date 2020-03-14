//
//  ContentView.swift
//  BrainWork
//
//  Created by BURHAN ARAS on 1.03.2020.
//  Copyright © 2020 BURHAN ARAS. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      NavigationView{
        VStack{
          Text("Hello, World!")
          NavigationLink(destination: ColorGameView()){
            Text("Color Game")
          }
        }
      }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
