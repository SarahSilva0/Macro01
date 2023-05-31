//
//  CombatView.swift
//  Macro01
//
//  Created by Sarah dos Santos Silva on 30/05/23.
//

import SwiftUI

struct CombatView: View {
    @State var cards = ["ataque", "defesa", "recarga"]
    @State var player1 = "jogador1"
    @State var player2 = "jogador2"
    @State var selectedCard: String = ""
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
                        Image(cards.randomElement() ?? "")
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
                CardComponent(image: Image("ataque"))
                    .onTapGesture {
//                        selectedCard = cards[0]
                        isSheetVisible = true
                    }
                CardComponent(image: Image("defesa"))
                    .onTapGesture {
//                        selectedCard = cards[1]
                        isSheetVisible = true
                    }
                CardComponent(image: Image("recarga"))
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
                isSheetVisible = false
                isInteractionEnabled = false
                isCountdownVisible = false
                
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
