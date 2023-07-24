import SwiftUI

struct ScoreView: View {
    let maxDots = 5 // Bolinhas Total
    let inactiveColor = Color(hex: "FFF2D9") // Cor da bolinha inativa
    let centerDotSize: CGFloat = 30 // Tamanho da bolinha do centro
    
    let player1Wins: Int // Vitórias do player 1
    let player2Wins: Int // Vitórias do player 2
    
    var body: some View {
        HStack(spacing: 15) {
            // Bolinhas do lado esquerdo
            ForEach(0..<2) { index in
                Circle()
                    .fill(index < player1Wins ? Color(hex: "88BD8E") : inactiveColor)
                    .frame(width: 20, height: 20)
            }
            
            // Bolinha do centro
            Circle()
//                .fill((player1Wins >= 3 || player2Wins >= 3) ? Color(hex: "88BD8E") : inactiveColor)
            
                .fill(player1Wins >= 3 ? Color(hex: "88BD8E") : (player2Wins >= 3 ? Color(hex: "C27C7C") : inactiveColor))
                .frame(width: centerDotSize, height: centerDotSize)
            
            // Bolinhas do lado direito
            ForEach(0..<2) { index in
                Circle()
                    .fill((index == 0 && player2Wins >= 2) || (index == 1 && player2Wins >= 1) ? Color(hex: "C27C7C") : inactiveColor)
                    .frame(width: 20, height: 20)
            }
        }
    }
}
