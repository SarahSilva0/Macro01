//
//  ComponentButton.swift
//  Macro01
//
//  Created by Sarah dos Santos Silva on 24/05/23.
//


import SwiftUI


struct ButtonComponentImage: View {
    var action: () -> Void
    var image: String
    
    var body: some View {
        Button(action: {
            self.action()
        }) {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 42, height: 42)
        }
    }
}
