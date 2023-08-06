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
                                Text("\(combatViewModel.SP.mana)")
                                    .font(.system(size: 30, weight: .bold))
                                    .foregroundColor(.black)
                            )
                        Spacer()
                    }
                    .frame(width: geometry.size.width * 1.03, height: geometry.size.height * 0.1)
                    Spacer()
                }
                .frame(width: geometry.size.width * 0.1, height: geometry.size.height * 0.98)
                
                HStack {
                    
                    VStack {
                        Text("Escolha uma carta")
                            .font(Font.custom("CooperBlackStd", size: 30))
                            .foregroundColor(Color(hex: "FFF2D9"))
                          
                        HStack {
                            ForEach(combatViewModel.SP.cards, id: \.self) { card in
                                CardComponent(image: Image(card.name))
                                    .frame(width: geometry.size.width * 0.29, height: geometry.size.height * 0.1, alignment: .leading)
                                    .onTapGesture {
                                        combatViewModel.SP.selectedCard = card
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
                    .frame(width: geometry.size.width * 0.06, height: geometry.size.height * 0.1,alignment: .trailing)
                    
                }
                .frame(width: geometry.size.width * 1, height: geometry.size.height, alignment: .trailing)
            }
            .ignoresSafeArea(.all)
            
            .onAppear {
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
    
    //O CONTADOR VOLTA A SER 5 E A BARRA FICA VERDE
    func closeSheet() {
        timer?.invalidate()
        timer = nil
        countdownSheet = 5
        isSheetVisible = false
    }
}



