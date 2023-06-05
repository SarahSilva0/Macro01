//
//  CombatView.swift
//  Macro01
//
//  Created by Sarah dos Santos Silva on 30/05/23.
//

import SwiftUI

//MARK: VIEW DO COMBATE. ESSA VIEW PRECISA SER REFATORADA DEPOIS E DEIXADA MAIS RESPONSIVA
struct CombatView: View {
    
    @StateObject private var combatViewModel = CombatViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 120)
            
            HStack {
                Text("ROUND " + String(combatViewModel.turn))
                    .fontWeight(.bold)
                    .offset(y: 100)
            }
            .offset(y: 100)
            
            if combatViewModel.isCountdownVisible {
                Text("\(combatViewModel.countdown)")
                    .font(.largeTitle)
                    .foregroundColor(.green)
                    .fontWeight(.bold)
                    .frame(height: 10)
                    .offset(y: 300)
            }
            
            HStack {
                VStack{
                    Text("Ganhou: \(combatViewModel.player1.winTurno)")
                        .foregroundColor(.red)
                        .offset(y: 200)
                    Text("Mana: \(combatViewModel.player1.mana)")
                        .foregroundColor(.red)
                        .offset(y: 200)
                    Image(combatViewModel.player1.image)
                        .offset(y: 170)
                }
                VStack {
                    Image(combatViewModel.player1.selectedCard)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120, height: 160)
                        .offset(y: 100)
                }
                Spacer()
                    .frame(width: 150)
                VStack {
                    if !combatViewModel.isCountdownVisible{
                        Image(combatViewModel.player2.selectedCard)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 120, height: 160)
                            .offset(y:100)
                    }
                    else{
                        Image("")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 120, height: 160)
                    }
                }
                VStack{
                    Text("Ganhou: \(combatViewModel.player2.winTurno)")
                        .foregroundColor(.red)
                        .offset(y: 200)
                    Text("Mana: \(combatViewModel.player2.mana)")
                        .foregroundColor(.red)
                        .offset(y: 200)
                    Image(combatViewModel.player2.image)
                        .offset(y: 170)
                }
            }
            
            HStack {
                ForEach(combatViewModel.player1.cards, id: \.self) { card in
                    CardComponent(image: Image(card))
                        .onTapGesture {
                            combatViewModel.isSheetVisible = true
                        }
                }
            }
            .offset(y: -150)
            .allowsHitTesting(combatViewModel.isInteractionEnabled)
            .frame(width: 300, height: 300)
            
        }
        .background(Color.white)
        .onAppear {
            combatViewModel.startCountdown()
        }
        .sheet(isPresented: $combatViewModel.isSheetVisible, onDismiss: {
        }) {
            SheetView(combatViewModel: combatViewModel, isSheetVisible: $combatViewModel.isSheetVisible).background(ClearBackgroundView())
        }
        .alert(isPresented: $combatViewModel.isGameEndAlertPresented) {
                 Alert(title: Text("Fim do Jogo"),
                       message: Text("\(combatViewModel.getScore())"),
                       dismissButton: .default(Text("OK"), action: {
                     presentationMode.wrappedValue.dismiss()
                 }))
             }
    }
}

struct CombatView_Previews: PreviewProvider {
    static var previews: some View {
        CombatView()
    }
}



