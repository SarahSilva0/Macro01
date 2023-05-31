//
//  CombatView.swift
//  Macro01
//
//  Created by Sarah dos Santos Silva on 30/05/23.
//

import SwiftUI

struct CombatView: View {
    @State var cards = ["attack", "defense", "recharge"]
    @State var player1 = "jogador1"
    @State var player2 = "jogador2"
    @State var manaPlayer1 = ["Mana": 1, "Vida": 0]
    @State var manaPlayer2 = ["Mana": 1, "Vida": 0]
    @State var selectedCard: String = ""
    @State var countdown: Int = 5
    @State var isCountdownVisible = true
    @State var randomCard = ""
    @State var isSheetVisible = false
    @State private var isInteractionEnabled = true
    @State private var selectedCard2: String = ""



    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 120)
            
            HStack {
                Image("pontos")
                Image("pontos")
                Image("pontos")
                    .resizable()
                    .frame(width: 20, height: 20)
                Image("pontos")
                Image("pontos")
            }
            
            if isCountdownVisible {
                Text("\(countdown)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(height: 10)
                    .offset(y: 150)
            }
            
            HStack {
                Image(player1)
                VStack {
                    Image(selectedCard)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120, height: 160)
                }
                Spacer()
                    .frame(width: 150)
                VStack {
                    if !isCountdownVisible{
                        
                        Image(selectedCard2)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 120, height: 160)
                    }
                    else{
                        Image("")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 120, height: 160)
                    }
                }
                Image(player2)
            }
            
            HStack {
                CardComponent(image: Image("attack"))
                    .onTapGesture {
//                        selectedCard = cards[0]
                        isSheetVisible = true
                    }
                CardComponent(image: Image("defense"))
                    .onTapGesture {
//                        selectedCard = cards[1]
                        isSheetVisible = true
                    }
                CardComponent(image: Image("recharge"))
                    .onTapGesture {
//                      selectedCard = cards[2]
                        isSheetVisible = true
                    }
            }
            .allowsHitTesting(isInteractionEnabled)
            .frame(width: 250, height: 150)
            
        }
        .onAppear {
            startCountdown()
        }
        .sheet(isPresented: $isSheetVisible, onDismiss: {
        }) {
            SheetView(cards: cards, player1Card: $selectedCard, isSheetVisible: $isSheetVisible).background(ClearBackgroundView())
        }
    }
    
    func startCountdown() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if countdown > 0 {
                countdown -= 1
            } else {
                timer.invalidate()
                selectedCard2 = cards.randomElement() ?? ""
                isSheetVisible = false
                isInteractionEnabled = false
                isCountdownVisible = false
                compareCardsInCenter(card1: selectedCard, card2: selectedCard2)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    isInteractionEnabled = true
                    selectedCard = ""
                    countdown = 5
                    isCountdownVisible = true
                    startCountdown()
                }
            }
        }
    }
    
    func loseMana(){
        
    }
    func loseLife(){
        
    }
    func rechargeMana(){
        
    }
    
    func compareCardsInCenter(card1: String, card2: String) {

        switch (card1, card2) {
        case ("attack", "attack"):
            print("Ambos perdem 1 de Mana")
            loseMana()
            
        case ("attack", "recharge"):
            print("Vitória do atacante")
            loseLife()
            loseMana()
            
        case ("attack", "defense"):
            print("O atacante perde 1 de Mana")
            loseMana()
            
        case ("defense", "defense"):
            print("Nada acontece")
            
        case ("defense", "recharge"):
            print("O carregador ganha 1 de Mana")
            rechargeMana()
            
        case ("recharge", "recharge"):
            print("Ambos ganham 1 de Mana")
            rechargeMana()
            
        default:
            print("Nada acontece")
        }
    }
}

struct SheetView: View {
    var cards: [String]
    @Binding var player1Card: String
    @Binding var isSheetVisible: Bool
    
    var body: some View {
            VStack {
                HStack {
                    ForEach(cards, id: \.self) { card in
                        Button(action: {
                            player1Card = card
                            isSheetVisible = false
                        }) {
                            Image(card)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 200, height: 250)
                        }
                    }
                }
            }
        
    }
}


struct CombatView_Previews: PreviewProvider {
    static var previews: some View {
        CombatView()
    }
}

struct ClearBackgroundView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        return InnerView()
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
    
    private class InnerView: UIView {
        override func didMoveToWindow() {
            super.didMoveToWindow()
            
            superview?.superview?.backgroundColor = .clear
        }
        
    }
}

//FUNCAO PERDER MANA
//FUNCAO PERDER VIDA
//FUNCAO RECARREGAR
