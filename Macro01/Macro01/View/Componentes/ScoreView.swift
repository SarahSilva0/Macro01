//
//  ScoreView.swift
//  Macro01
//
//  Created by Higor  Lo Castro on 10/06/23.
//

import SwiftUI

struct ScoreView:View {
   
    let maxDots = 5 // Número máximo de bolinhas
    let activeColor = Color.red // Cor da bolinha ativa
    let inactiveColor = Color.gray // Cor da bolinha inativa

    let activeDotCount: Int // Número de bolinhas ativas

    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<maxDots) { index in
                Circle()
                    .fill(index < activeDotCount ? activeColor : inactiveColor)
                    .frame(width: 10, height: 10)
            }
        }
    }
}



//struct ScoreView_Previews: PreviewProvider {
//    static var previews: some View {
//        ScoreView(maxScore: 5, currentScore: 1)
//    }
//}

