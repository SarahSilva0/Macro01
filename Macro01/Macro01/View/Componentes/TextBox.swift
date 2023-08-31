//
//  TextBox.swift
//  Macro01
//
//  Created by Julia Mendes on 24/05/23.
//

import SwiftUI

struct TextBox: View {
    public var textContent: String
    
    var body: some View {
        ZStack{
            GeometryReader { geometry in
                rectangle
                text
            }
        }
    }

    var rectangle: some View {
        Rectangle().fill(.gray)
            .frame(width: 700, height: 120)
            .cornerRadius(20)
            .padding([.top,.leading])
    }
    
    var text: some View {
        Text(textContent)
            .font(.title2)
            .foregroundColor(.black)
            .multilineTextAlignment(.center)
            .padding([.leading, .trailing], 40)
            .padding([.top, .bottom], 30)
    }
}

struct TextBox_Previews: PreviewProvider {
    static var previews: some View {
        TextBox(textContent: "blalblablablalblablablalblablablalblablablalblablablalblablablalblablablalblablablalblablablalblablablalblablablalblablablalblablablalblablablalblablablalblablablalblabla")
    }
}
