//
//  ButtonPlayAgain.swift
//  Macro01
//
//  Created by Julia Mendes on 22/08/23.
//

import SwiftUI

struct ButtonPlayAgain: View {
    
    let action: () -> Void
    var btnName: String

    
    var body: some View {
        Button(action: action) {
            Text(btnName)
                .font(Font.custom("CooperBlackStd", size: 16))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: 165, height: 15)
                .padding()
                .background(Color(hex: "242020"))
                .cornerRadius(5)
        }
        .offset(y: 85)
    }
}

