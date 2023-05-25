//
//  ComponentButton.swift
//  Macro01
//
//  Created by Sarah dos Santos Silva on 24/05/23.
//

import Foundation
import SwiftUI


struct ButtonComponent: View {
    var buttonText: String
    var action: () -> Void

    var body: some View {
        Button(action: {
            self.action()
        }) {
            Text(buttonText)
                .foregroundColor(.white)
                .padding()
                .frame(width: 200)
                .background(Color.blue)
                .cornerRadius(10)
        }
    }
}
