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
    
    @Binding var countdownSheet: Int
    
    //Controlar o estado do timer
    @State private var timer: Timer?
   
    
    var body: some View {
        HStack {
            ForEach(combatViewModel.player1.cards, id: \.self) { card in
                CardComponent(image: Image(card))
                    .onTapGesture {
                        combatViewModel.player1.selectedCard = card
                        isSheetVisible = false
                        combatViewModel.selectedCardPlayer2()
                        combatViewModel.endTurn()
                        closeSheet()
                        
                    }
            }
            
            VStack {
                Spacer()
                
                ZStack(alignment: .bottom) {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 20, height: 100)
                        .foregroundColor(Color(hex: "FFF2D9"))
                    
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 20, height: 100 * countdownFraction())
                        .foregroundColor(Color(hex: "688869"))
                
                }
                
                Spacer()
            }
        }
        .onAppear {
            startCountdownSheet()
        }
    }
    
    
    func startCountdownSheet() {
            if timer != nil {
                timer?.invalidate()
                timer = nil
            }
            
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                if countdownSheet > 0 {
                    countdownSheet -= 1
                } else {
                    timer?.invalidate()
//                    timer = nil
                    
                    self.countdownSheet = 5
                    self.closeSheet()
                    //Falar que jogador 1 perdeu
                    combatViewModel.selectedCardPlayer2()
                    combatViewModel.endTurn()
                }
            }
        }
       
    
    func countdownFraction() -> CGFloat {
        let totalDuration: CGFloat = 5
        let remainingTime: CGFloat = CGFloat(countdownSheet)
        return (totalDuration - remainingTime) / totalDuration
    }
    
    func closeSheet() {
        timer?.invalidate()
        timer = nil
        countdownSheet = 5
        isSheetVisible = false
    }

    
  
}
