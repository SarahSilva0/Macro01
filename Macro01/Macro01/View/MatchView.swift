import SwiftUI

struct MatchView: View {
    @Binding var gameModelBinding: GameTableModel?
    @State private var showCardOverlay = false
    @State private var selectedPlayerCards: [CardModel]?
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                if let characterImage = gameModelBinding?.players[0].characterImage {
                    CharacterTextBox(character: characterImage)
                        .frame(width: UIScreen.main.bounds.width * 0.3, height: UIScreen.main.bounds.height * 1.5)
                }
                
                    Spacer()
                    HStack {
                        if let cards = gameModelBinding?.players[0].cards {
                            ForEach(cards.indices, id: \.self) { index in
                                if index < cards.count {
                                    let card = cards[index]
                                    Button(action: {
                                        selectedPlayerCards = cards
                                        showCardOverlay = true
                                    }) {
                                        CardComponent(image: Image(card.image))
                                            .frame(width: UIScreen.main.bounds.width * 0.1, height: UIScreen.main.bounds.height * 0.5)
                                    }
                                }
                            }
                        }
                    }
                .frame(width: UIScreen.main.bounds.width * 0.1, height: UIScreen.main.bounds.height * 1.0)
               
                HStack {
                    
                    if let characterImage = gameModelBinding?.players[1].characterImage {
                        CharacterTextBox(character: characterImage)
                            .frame(width: UIScreen.main.bounds.width * 0.85, height: UIScreen.main.bounds.height * 0.22)
                    }
                }
                Spacer()
            }
            .sheet(isPresented: $showCardOverlay) {
                CardOverlayView(showCardOverlay: $showCardOverlay, selectedPlayerCards: selectedPlayerCards, gameModel: $gameModelBinding)
            }
        }
        
    }
}
