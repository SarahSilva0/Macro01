import SwiftUI

struct CardOverlayView: View {
    @Binding var showCardOverlay: Bool
    var selectedPlayerCards: [CardModel]?
    @Binding var gameModel: GameTableModel? // Alterado para ser um Binding opcional
    
    var body: some View {
        VStack {
            Text("Cartas do Primeiro Jogador")
                .font(.headline)
                .foregroundColor(.white)
            
            Spacer()
            
            if let players = gameModel?.players { // Desembrulhamos com segurança players
                LazyHStack {
                    ForEach(players[0].cards.indices, id: \.self) { index in
                        let card = players[0].cards[index]
                        GeometryReader { geometry in
                            CardComponent(image: Image(card.image))
                                .frame(width: geometry.size.height * 1.0, height: geometry.size.height * 1.0)
                                .padding()
                        }
                        .frame(width: UIScreen.main.bounds.height * 0.5)
                        .onTapGesture {
                            if let selectedCard = selectedPlayerCards?.first,
                               let newCard = gameModel?.deck.cards.first {
                                if let handIndex = gameModel?.handPlayer.firstIndex(of: selectedCard),
                                   let playerIndex = gameModel?.players.firstIndex(where: { $0 == players[0] }) {
                                    gameModel?.handPlayer[handIndex] = newCard
                                    gameModel?.players[playerIndex].cards[index] = newCard
                                    gameModel?.deck.cards.removeFirst()
                                }
                            }
                            showCardOverlay = false // Fechar o CardOverlayView após a substituição
                        }
                    }
                }
                .padding(.horizontal, 10)
            }
            
            Spacer()
        }
        .background(Color.clear)
    }
}
