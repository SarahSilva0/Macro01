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
            ZStack {
                HStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(characterName)
                                .font(.system(size: 15))
                                .fontWeight(.bold)
                                .padding(.bottom, 1)
                            
                            Text(dialogue)
                                .font(.system(size: 15))
                        }
                        .frame(width: geometry.size.width * 1.5, height: geometry.size.height * 0.83)
//                        .background(.red)
                    }
                    .frame(width: geometry.size.width * 0.39, height: geometry.size.height * 0.65)
                    //                .background(.blue)
                    Spacer()
                    
                }
                .frame(width: 533, height: 105)
                .background(Color(hex: colorBox))
                .cornerRadius(10)
            }
            .frame(width: 547, height: 119)
            .background(Image("backgroundGeral"))
            .cornerRadius(10)
        }
    }
}
