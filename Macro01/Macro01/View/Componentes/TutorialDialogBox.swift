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
            HStack {
                VStack(alignment: .leading) {
                    Text(characterName)
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .padding(.bottom, 1)
                    
                    Text(dialogue)
                        .font(.system(size: 15))
                }
                .frame(width: geometry.size.width * 0.96, height: geometry.size.height * 0.83)
                
                .background(.red)
                
              
                
            }
            .frame(width: 533, height: 105)
            .background(Color(hex: colorBox))
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