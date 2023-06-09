//
//  SheetView.swift
//  Macro01
//
//  Created by Sarah dos Santos Silva on 05/06/23.
//

import SwiftUI

//MARK: SHEET VIEW EM QUE AS VIEWS APARECEM. PRECISA SER SEPARADA EM OUTRO ARQUIVO
struct SheetView: View {
    
    @ObservedObject var combatViewModel: CombatViewModel
    @Binding var isSheetVisible: Bool
    
    @State private var countdown: Int = 5
   
    
    var body: some View {
        HStack {
            ForEach(combatViewModel.player1.cards, id: \.self) { card in
                CardComponent(image: Image(card))
                    .onTapGesture {
                        combatViewModel.player1.selectedCard = card
                        isSheetVisible = false
                        combatViewModel.selectedCardPlayer2()
                        combatViewModel.endTurn()
                    }
            }
            
            VStack {
                Spacer()
                
                ZStack(alignment: .bottom) {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 20, height: 100)
                        .foregroundColor(.gray)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 20, height: 100 * countdownFraction())
                        .foregroundColor(.green)
                
                }
                
                Spacer()
            }
        }
        .onAppear {
            startCountdown()
        }
    }
    
    func startCountdown() {
        var timer: Timer?
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak timer] _ in
            if countdown > 0 {
                countdown -= 1
            } else {
                timer?.invalidate()
                self.closeSheet()
            }
        }
    }
       
    
    func countdownFraction() -> CGFloat {
        let totalDuration: CGFloat = 5
        let remainingTime: CGFloat = CGFloat(countdown)
        return (totalDuration - remainingTime) / totalDuration
    }
    
    func closeSheet() {
           isSheetVisible = false
       }
}
