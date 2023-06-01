import SwiftUI

struct CombatView: View {
    @StateObject private var combatViewModel = CombatViewModel()

    var body: some View {
        VStack {
            Spacer()
                .frame(height: 120)

            HStack {
                Text("ROUND " + String(combatViewModel.round))
            }.offset(y: 100)

            if combatViewModel.isCountdownVisible {
                Text("\(combatViewModel.countdown)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(height: 10)
                    .offset(y: 200)
            }

            HStack {
                VStack{
                    Text("Ganhou: \(combatViewModel.player1.winTurno)")
                        .offset(y: 150)
                    Text("Mana: \(combatViewModel.player1.mana)")
                        .offset(y: 150)
                    Image(combatViewModel.player1.image)
                        .offset(y: 150)
                }
                VStack {
                    Image(combatViewModel.selectedCard)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120, height: 160)
                        .offset(y: 100)
                }
                Spacer()
                    .frame(width: 150)
                VStack {
                    if !combatViewModel.isCountdownVisible{
                        Image(combatViewModel.selectedCard2)
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
                        .offset(y: 150)
                    Text("Mana: \(combatViewModel.player2.mana)")
                        .offset(y: 150)
                    Image(combatViewModel.player2.image)
                        .offset(y: 160)
                }
            }

            HStack {
                CardComponent(image: Image("attack"))
                    .onTapGesture {
                        combatViewModel.isSheetVisible = true
                        //mudar a carta quando ela for jogada
                    }
                CardComponent(image: Image("defense"))
                    .onTapGesture {
                        combatViewModel.isSheetVisible = true

                    }
                CardComponent(image: Image("recharge"))
                    .onTapGesture {
                        combatViewModel.isSheetVisible = true
                    }
            }
            .offset(y: -50)
            .allowsHitTesting(combatViewModel.isInteractionEnabled)
            .frame(width: 300, height: 300)

        }
        .onAppear {
            combatViewModel.startCountdown()
        }
        .sheet(isPresented: $combatViewModel.isSheetVisible, onDismiss: {
        }) {
            SheetView(cards: combatViewModel.cards, selectedCard: $combatViewModel.selectedCard, isSheetVisible: $combatViewModel.isSheetVisible).background(ClearBackgroundView())
        }
        //Alerta do final do jogo
        .alert(isPresented: $combatViewModel.isGameEndAlertPresented) {
            Alert(title: Text("Fim do Jogo"), message: Text("O jogo acabou!"), dismissButton: .default(Text("OK")))
        }
    }
}

struct SheetView: View {
    var cards: Cards
    @Binding var selectedCard: String
    @Binding var isSheetVisible: Bool

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    selectedCard = cards.attack
                    isSheetVisible = false
                }) {
                    Image(cards.attack)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 250)
                }

                Button(action: {
                    selectedCard = cards.defense
                    isSheetVisible = false
                }) {
                    Image(cards.defense)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 250)
                }

                Button(action: {
                    selectedCard = cards.recharge
                    isSheetVisible = false
                }) {
                    Image(cards.recharge)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 250)
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
