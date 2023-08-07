//
//  TutorialDialogBox.swift
//  Macro01
//
//  Created by Higor  Lo Castro on 06/08/23.
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
            .frame(width: 548, height: 120)
            .background(Image("backgroundGeral"))
            .cornerRadius(10)
        }
    }
}
            
                



//struct TutorialDialogBox_Previews: PreviewProvider {
//    static var previews: some View {
//        TutorialDialogBox(characterName: "SP",
//                          dialogue: "Após os 3 segundos você deverá selecionar uma das cartas, mas atenção, um temporizador de 5 Segundos marcará seu tempo na direita.",
//                          colorBox: "FFC097")
//            
//    }
//}
