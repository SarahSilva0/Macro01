import SwiftUI

struct CardOverlayView: View {
    @Binding var showCardOverlay: Bool
    var selectedPlayerCards: [Card]?
    var gameModel: GameModel
    
    var body: some View {
        VStack {
            Text("Cartas do Primeiro Jogador")
                .font(.headline)
                .foregroundColor(.white)
            
            Spacer()
            
            LazyHStack {
                ForEach(gameModel.players[0].cards) { card in
                    GeometryReader { geometry in
                        CardComponent(image: Image(card.image))
                            .frame(width: geometry.size.height * 1.0, height: geometry.size.height * 1.0)
                            .padding()
                    }
                    .frame(width: UIScreen.main.bounds.height * 0.5)
                }
            }
            .padding(.horizontal, 10)
            
            Spacer()
        }
        .background(Color.clear)
        .onTapGesture {
            showCardOverlay = false
        }
    }
}

struct CardOverlayView_Previews: PreviewProvider {
    static var previews: some View {
        let gameModel = GameModel()
        let selectedPlayerCards = gameModel.players[0].cards
        
        return CardOverlayView(showCardOverlay: .constant(true), selectedPlayerCards: selectedPlayerCards, gameModel: gameModel)
    }
}
