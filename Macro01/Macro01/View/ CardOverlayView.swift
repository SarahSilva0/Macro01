import SwiftUI

struct CardOverlayView: View {
    @Binding var showCardOverlay: Bool
    @Binding var selectedCard: CardModel?
    @ObservedObject var gameModel: GameTableModel
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack{
                Color(.black)
                    .opacity(0.7)
                
                    VStack {
                        Text("Cartas do Primeiro Jogador")
                            .font(.headline)
                                        
                        if let players = gameModel.players {
                            HStack {
                                ForEach(players[0].cards.indices, id: \.self) { index in
                                    let card = players[0].cards[index]
                                    
                                    Button(action: {
                                        handleCardSelection(index: index)
                                        showCardOverlay = false
                                        
                                    }) {
                                        CardComponent(image: Image(card.image))
                                            .padding()
                                    }
                                }
                            }
                        }
                    }
                    .frame(width: geometry.size.width * 0.9)
                
            }
            .ignoresSafeArea(.all)
        }
    }
        
    
    func checkAndRefillDeck() -> Bool {
        if gameModel.deck.cards.isEmpty {
            gameModel.refillDeck()
            return true
        }
        return false
    }

    //Revisar função pra criar outras funcoes menores
    func handleCardSelection(index: Int) {
        if let selectedCard = selectedCard {
            if let newCard = gameModel.deck.cards.first {
                if let handIndex = gameModel.handPlayer.firstIndex(of: selectedCard) {
                    gameModel.handPlayer[handIndex] = newCard
                    gameModel.players[0].cards[index] = newCard
                    gameModel.deck.cards.removeFirst()
                }
            } else if checkAndRefillDeck() {
  
            }
        }
    }
}
