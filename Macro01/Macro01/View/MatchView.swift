import SwiftUI

struct MatchView: View {
    
    @ObservedObject var gameModel: GameTableModel
    
    @State private var showCardOverlay = false
    @State private var selectedCardPlayOne: CardModel?
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack(spacing: 0) {
                    HStack {
                        Text("PLACAR")
                            .foregroundColor(.white)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.2)
                    .background(Color.black)
                    
                    HStack(alignment: .bottom, spacing: 0) {
                        VStack {
                            Text("JOGADOR 1")
                        }
                        .frame(width: geometry.size.width * 0.3, height: geometry.size.height)
                        .background(Color.green)
                        
                        VStack(spacing: 0) {
                            HStack {
                                if let selectedCard = selectedCardPlayOne {
                                    CardComponent(image: Image(selectedCard.image))
                                        .padding()
                                }
                            }
                            .frame(width: geometry.size.width * 0.2, height: geometry.size.height * 0.4)
                            .background(Color.yellow)
                            
                            Spacer()
                            
                            HStack {
                                if let cards = gameModel.players?[0].cards {
                                    ForEach(cards) { card in
                                        CardComponent(image: Image(card.image))
                                            .onTapGesture {
                                                selectedCardPlayOne = card
                                                showCardOverlay = true
                                            }
                                    }
                                }
                            }
                            .frame(width: geometry.size.width * 0.4, height: geometry.size.height * 0.2)
                            .background(Color.white)
                        }
                        
                        VStack {
                            Text("JOGADOR 2")
                        }
                        .frame(width: geometry.size.width * 0.3, height: geometry.size.height)
                        .background(Color.blue)
                    }
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                
                if showCardOverlay {
                    VStack {
                        CardOverlayView(showCardOverlay: $showCardOverlay,
                                        selectedCard: $selectedCardPlayOne,
                                        gameModel: gameModel)
                            .frame(width: geometry.size.width)
                    }
                }
            }
        }
    }
}
