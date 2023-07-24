////
////  ScoreView.swift
////  Macro01
////
////  Created by Higor  Lo Castro on 10/06/23.
////

import SwiftUI

struct ScoreView: View {
    let maxDots = 5 // Bolinhas Total
    let activeColorPlayOne = Color(hex: "88BD8E")
    let activeColorPlayTwo = Color(hex: "C27C7C")
    let inactiveColor = Color(hex: "FFF2D9") // Cor da bolinha inativa
    let centerDotSize: CGFloat = 30 // Tamanho da bolinha do centro
    
    let player1Wins: Int // Vitórias do player 1
    let player2Wins: Int // Vitórias do player 2
    
    var body: some View {
        HStack(spacing: 15) {
            // Bolinhas do lado esquerdo
            ForEach(0..<2) { index in
                Circle()
                    .fill(index < player1Wins ? activeColorPlayOne : inactiveColor)
                    .frame(width: 20, height: 20)
            }
            
            // Bolinha do centro
            Circle()
                .fill((player1Wins >= 3 || player2Wins >= 3) ? activeColorPlayOne : inactiveColor)
                .frame(width: centerDotSize, height: centerDotSize)
            
            // Bolinhas do lado direito
            ForEach(0..<2) { index in
                Circle()
                    .fill((index == 0 && player2Wins >= 2) || (index == 1 && player2Wins >= 1) ? activeColorPlayTwo : inactiveColor)
                    .frame(width: 20, height: 20)
            }
        }
    }
}




