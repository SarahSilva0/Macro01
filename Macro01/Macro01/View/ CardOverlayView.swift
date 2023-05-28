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
                    ForEach(players[0].cards) { card in
                        GeometryReader { geometry in
                            CardComponent(image: Image(card.image))
                                .frame(width: geometry.size.height * 1.0, height: geometry.size.height * 1.0)
                                .padding()
                        }
                        .frame(width: UIScreen.main.bounds.height * 0.5)
                    }
                }
                .padding(.horizontal, 10)
            }
            
            Spacer()
        }
        .background(Color.clear)
        .onTapGesture {
            if var deck = gameModel?.deck { // Desembrulhamos com segurança deck
                if let selectedCard = selectedPlayerCards?.first,
                   let index = gameModel?.players[0].cards.firstIndex(of: selectedCard) {
                    var updatedPlayers = gameModel?.players // Desembrulhamos com segurança players
                    if !deck.cards.isEmpty {
                        updatedPlayers?[0].cards[index] = deck.cards.removeFirst()
                    }
                    gameModel?.players = updatedPlayers // Atualizamos usando optional chaining
                }
            }
            
            showCardOverlay = false
        }
    }
}
