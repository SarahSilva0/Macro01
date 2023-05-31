import SwiftUI

struct MatchView: View {
    @ObservedObject var gameModel: GameTableModel
    @State private var showCardOverlay = false
    @State private var centerCards: [CardModel] = []
    
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
                            Text("\(gameModel.players[0].mana)")
                            Text("\(gameModel.players[0].points)")
                        }
                        .frame(width: geometry.size.width * 0.3, height: geometry.size.height)
                        .background(Color.green)
                        
                        VStack(spacing: 0) {
                            HStack {
                                Text("Cartas no centro")
                                ForEach(centerCards) { card in
                                    CardComponent(image: Image(card.image))
                                }
                            }
                            .frame(width: geometry.size.width * 0.2, height: geometry.size.height * 0.4)
                            .background(Color.yellow)
                            
                            Spacer()
                        
                            .onTapGesture {
                                showCardOverlay.toggle()
                            }
                            
                            HStack(alignment: .top, spacing: 0) {
                                ForEach(gameModel.players[0].cards.prefix(3)) { card in
                                    CardComponent(image: Image(card.image))
                                        .frame(width: geometry.size.width * 0.1, height: geometry.size.height * 0.1)
                                }
                            }
                            .frame(width: geometry.size.width * 0.4, height: geometry.size.height * 0.2)
                            .background(Color.white)
                            
                            
                            .onTapGesture {
                                showCardOverlay.toggle()
                            }
                        }
                        
                        VStack {
                            Text("JOGADOR 2")
                            Text("\(gameModel.players[1].mana)")
                            Text("\(gameModel.players[1].points)")
                        }
                        .frame(width: geometry.size.width * 0.3, height: geometry.size.height)
                        .background(Color.blue)
                    }
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                
                if showCardOverlay {
                    CardOverlayView(cards: gameModel.players[0].cards) { selectedCard in
                        gameModel.selectCard(selectedCard)
                        centerCards.append(selectedCard)
                        showCardOverlay = false
                    }
                }
            }
        }
    }
}
