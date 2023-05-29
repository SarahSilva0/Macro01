import SwiftUI

struct MatchView: View {
    @ObservedObject var gameModel: GameTableModel
    
    @State private var showCardOverlay = false
    @State private var selectedCard: CardModel?
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    if let cards = gameModel.players[0].cards {
                        ForEach(cards) { card in
                            CardComponent(image: Image(card.image))
                                .frame(width: UIScreen.main.bounds.width * 0.1, height: UIScreen.main.bounds.height * 0.5)
                                .onTapGesture {
                                    selectedCard = card
                                    showCardOverlay = true
                                }
                        }
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width * 0.85, height: UIScreen.main.bounds.height * 1.6)
        }
     
        .sheet(isPresented: $showCardOverlay) {
            CardOverlayView(showCardOverlay: $showCardOverlay, selectedCard: $selectedCard, gameModel: gameModel)
            
        }
    }
}
