import SwiftUI

struct MatchView: View {
    @ObservedObject var gameModel: GameTableModel
    
    @State private var showCardOverlay = false
    @State private var selectedCard: CardModel?
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                if let cards = gameModel.players[0].cards {
                    ForEach(cards) { card in
                        Button(action: {
                            selectedCard = card
                            showCardOverlay = true
                        }) {
                            CardComponent(image: Image(card.image))
                                .frame(width: UIScreen.main.bounds.width * 0.1, height: UIScreen.main.bounds.height * 0.5)
                        }
                    }
                }
            }
            
            Spacer()
        }
        .sheet(isPresented: $showCardOverlay) {
            CardOverlayView(showCardOverlay: $showCardOverlay, selectedCard: $selectedCard, gameModel: gameModel)
        }
    }
}




