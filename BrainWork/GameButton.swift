//
//  GameButton.swift
//  BrainWork
//
//  Created by BURHAN ARAS on 13.03.2020.
//  Copyright © 2020 BURHAN ARAS. All rights reserved.
//

import Foundation
import SwiftUI

struct PrimaryLabel: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .padding()
            .background(Color.blue)
            .foregroundColor(Color.white)
            .border(Color.blue, width: 5)
            .cornerRadius(10)
            .padding(10)
    }
}
