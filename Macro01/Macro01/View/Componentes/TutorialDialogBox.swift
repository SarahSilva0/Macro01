//
//  TutorialDialogBox.swift
//  Macro01
//
//  Created by Higor  Lo Castro on 07/08/23.
//

import SwiftUI

struct TutorialDialogBox: View {
    var characterName: String
    var dialogue: String
    var colorBox: String

    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack{
                    Image("backgroundGeral")
                        .resizable()
                    
                    Rectangle()
                        Color(hex: colorBox)
                        .cornerRadius(10)
                        .frame(width: geometry.size.width * 0.975, height: geometry.size.height * 0.90)
                    
                    VStack(spacing: 0){
                        Text(characterName)
                            .font(.system(size: 15))
                            .fontWeight(.bold)
                            .padding(.bottom, 1)
                            .frame(width: geometry.size.width * 0.95, height: geometry.size.height * 0.3, alignment: .leading)
                            .background(.blue)

                        Text(dialogue)
                            .font(.system(size: 15))
                            .frame(width: geometry.size.width * 0.95, height: geometry.size.height * 0.6, alignment: .topLeading)
                            .background(.red)
                    }
                }
                .cornerRadius(10)
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
            
        }
    }
}
