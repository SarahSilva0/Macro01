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
                ZStack {
                    Color(hex: "2D2828")
                    .edgesIgnoringSafeArea(.all)
                    
                    Rectangle()
                        Color(hex: colorBox)
                        .cornerRadius(10)
                        .frame(width: geometry.size.width * 0.975, height: geometry.size.height * 0.90)
                    
                    VStack(spacing: 0){
                        Text(characterName)
                            .font(.system(size: 15))
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                            .padding(.bottom, 1)
                            .frame(width: geometry.size.width * 0.95, height: geometry.size.height * 0.3, alignment: .leading)
                            

                        Text(dialogue)
                            .font(.system(size: 15))
                            .foregroundColor(.black)
                            .frame(width: geometry.size.width * 0.95, height: geometry.size.height * 0.6, alignment: .topLeading)
                            
                    }
                }
                .cornerRadius(10)
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
            
        }
    }
}
