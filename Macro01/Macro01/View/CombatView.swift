//
//  CombatView.swift
//  Macro01
//
//  Created by Sarah dos Santos Silva on 30/05/23.
//

import SwiftUI

struct CombatView: View {
    

    @State var cards = ["attack", "defense", "recharge"]
    
    //Criando os players usando o objeto PlayerModel
    @State var player1 = Player(name: "jogador1", mana: 1, life: 0)
    @State var player2 = Player(name: "jogador2", mana: 1, life: 0)
    
    @State var selectedCard: String = ""
    @State private var selectedCard2: String = ""
    
    @State var countdown: Int = 5
    @State var isCountdownVisible = true
    @State var randomCard = ""
    @State var isSheetVisible = false
    @State private var isInteractionEnabled = true
   

    
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
                Image(player1.name)
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
                Image(player2.name)
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
    
    
    
    //Diminuiu a mana diretamente no player escolhido, por isso uso do inout
    func loseMana(for player: inout Player) {
           player.mana -= 1
       }
    
    //Diminuiu a vida diretamente no player escolhido, por isso uso do inout
    func loseLife(for player: inout Player) {
        player.life -= 1
    }
    
    //Recarrega a vida diretamente no player escolhido, por isso uso do inout
    func rechargeMana(for player: inout Player){
        player.mana += 1
    }
    
    
    
    //Compara as cartas
    func compareCardsInCenter(card1: String, card2: String) {
        switch (card1, card2) {
       
        case ("attack", "attack"):
            loseMana(for: &player1)
            loseMana(for: &player2)
            print("Ambos perdem 1 de Mana")
            
            print(player1.mana)
            print(player2.mana)
            
        case ("attack", "recharge"):
            loseLife(for: &player2)
            print("Vitória do atacante")
            
            print(player2.life)
            
        case ("attack", "defense"):
            loseMana(for: &player1)
            print("O atacante perde 1 de Mana")
            
            print(player1.mana)
            
        case ("defense", "defense"):
            print("Nada acontece")
            
        case ("defense", "recharge"):
            rechargeMana(for: &player1)
            print("O carregador ganha 1 de Mana")
            
            print(player1.mana)
            
        case ("recharge", "recharge"):
            rechargeMana(for: &player1)
            rechargeMana(for: &player2)
            print("Ambos ganham 1 de Mana")
            
            print(player1.mana)
            print(player2.mana)
            
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

