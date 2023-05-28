import SwiftUI

struct MatchView: View {
    @Binding var gameModelBinding: GameTableModel?
    
    @State private var showCardOverlay = false
    @State private var selectedPlayerCards: [CardModel]?
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                GeometryReader { geometry in
                    HStack {
                        VStack(alignment: .trailing) {
                            Spacer()
                            CharacterTextBox(character: gameModelBinding?.players[0].characterImage ?? "")
                                .frame(width: geometry.size.width * 0.85, height: geometry.size.height * 0.22)
                        }
                        
                        VStack {
                            Spacer()
                            HStack {
                                ForEach(gameModelBinding?.players[0].cards ?? []) { card in
                                    Button(action: {
                                        selectedPlayerCards = gameModelBinding?.players[0].cards
                                        showCardOverlay = true
                                    }) {
                                        CardComponent(image: Image(card.image))
                                            .frame(width: geometry.size.width * 0.1, height: geometry.size.height * 0.5)
                                    }
                                }
                            }
                        }
                        .frame(width: geometry.size.width * 0.1, height: geometry.size.height * 1.0)

                        VStack(alignment: .leading) {
                            Spacer()
                            CharacterTextBox(character: gameModelBinding?.players[1].characterImage ?? "")
                                .frame(width: geometry.size.width * 0.85, height: geometry.size.height * 0.22)
                        }
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                }
            }
        }
        .sheet(isPresented: $showCardOverlay) {
            CardOverlayView(showCardOverlay: $showCardOverlay, selectedPlayerCards: selectedPlayerCards, gameModel: $gameModelBinding)
        }
    }
}
