import SwiftUI

struct CardOverlayView: View {
    @Binding var showCardOverlay: Bool
    @Binding var selectedCard: CardModel?
    @ObservedObject var gameModel: GameTableModel
    
    var body: some View {
        VStack {
            Text("Cartas do Primeiro Jogador")
                .font(.headline)
                .foregroundColor(.white)
            
            Spacer()
            
            if let players = gameModel.players {
                LazyHStack {
                    ForEach(players[0].cards.indices, id: \.self) { index in
                        let card = players[0].cards[index]
                        GeometryReader { geometry in
                            Button(action: {
                                if let selectedCard = selectedCard {
                                    if let newCard = gameModel.deck.cards.first {
                                        if let handIndex = gameModel.handPlayer.firstIndex(of: selectedCard) {
                                            gameModel.handPlayer[handIndex] = newCard
                                            gameModel.players[0].cards[index] = newCard
                                            gameModel.deck.cards.removeFirst()
                                        }
                                    } else {
                                        if gameModel.deck.cards.isEmpty {
                                            gameModel.refillDeck()
                                        }
                                    }
                                }
                                showCardOverlay = false
                            }) {
                                CardComponent(image: Image(card.image))
                                    .frame(width: geometry.size.height * 1.0, height: geometry.size.height * 1.0)
                                    .padding()
                            }
                        }
                        .frame(width: UIScreen.main.bounds.height * 0.5)
                    }
                }
                .padding(.horizontal, 10)
            }
            
            Spacer()
        }
        .background(Color.clear)
    }
}
