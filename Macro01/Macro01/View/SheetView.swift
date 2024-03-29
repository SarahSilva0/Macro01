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
    
    @State private var timer: Timer?
    
    var body: some View {
        GeometryReader { geometry in
            
            ZStack {
                Color(.black)
                    .opacity(0.65)
                
                VStack {
                    HStack {
                        Circle()
                            .frame(width: 45, height: 45)
                            .foregroundColor(Color(hex: "FFF2D9"))
                            .overlay(
                                Text("\(combatViewModel.player1.mana)")
                                    .font(Font.custom("CooperBlackStd", size: 30))
                                    .foregroundColor(.black)
                            )
                    }
                    .frame(width: geometry.size.width * 1, height: geometry.size.height * 0.14, alignment: .leading)
                    .padding(.trailing)
                    Spacer()
                }
                .frame(width: geometry.size.width * 0.1, height: geometry.size.height)
                
                HStack {
                    
                    VStack {
                        Text("Escolha uma carta".localizedLanguage())
                            .font(Font.custom("CooperBlackStd", size: 30))
                            .foregroundColor(Color(hex: "FFF2D9"))
                          
                        HStack {
                            ForEach(combatViewModel.player1.cards, id: \.self) { card in
                                CardComponent(image: Image(card.name))
                                    .frame(width: geometry.size.width * 0.29, height: geometry.size.height * 0.1, alignment: .leading)
                                    .onTapGesture {
                                        combatViewModel.player1.selectedCard = card
                                        combatViewModel.selectedCardPlayer2()
                                        self.closeSheet()
                                        combatViewModel.endTurn()
                                    }
                            }
                        }
                        .frame(width: geometry.size.width * 0.85, height: geometry.size.height * 0.8)
                    }
                    
                    HStack {
                        ZStack(alignment: .bottomLeading) {
                            CountdownBar(countdownFraction: countdownFraction())
                        }
                        
                    }
                    .frame(width: geometry.size.width * 0.06, height: geometry.size.height * 0.71,alignment: .bottomTrailing)
                    
                }
                .frame(width: geometry.size.width , height: geometry.size.height, alignment: .trailing)
            }
            .ignoresSafeArea(.all)
            
            .onAppear {
                updateCounter()
                startCountdownSheet()
            }
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
        isSheetVisible = false
    }
    
    func updateCounter() {
        countdownSheet = 5
        return
    }
}






