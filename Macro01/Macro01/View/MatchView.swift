import SwiftUI

struct MatchView: View {
    
    @ObservedObject var gameModel: GameTableModel
    
    @State private var showCardOverlay = false
    @State private var selectedCardPlayOne: CardModel?
    @State private var selectedCardPlayTwo: CardModel?
    
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
                            Text("\(gameModel.players[1].mana)")
                            Text("\(gameModel.players[1].points)")
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
                                        gameModel: gameModel,
                                        compareCards: compareCards)
                            .frame(width: geometry.size.width)
                    }
                }
            }
        }
        .onChange(of: selectedCardPlayTwo) { newValue in
            if let cardPlayOne = selectedCardPlayOne, let cardPlayTwo = newValue {
                compareCards(cardPlayOne: cardPlayOne, cardPlayTwo: cardPlayTwo)
                selectedCardPlayOne = nil
                selectedCardPlayTwo = nil
            }
        }
    }
    
    func compareCards(cardPlayOne: CardModel, cardPlayTwo: CardModel) {
        // Comparar as cartas selecionadas
        if cardPlayOne.type == "attack" && cardPlayTwo.type == "attack" {
            // Ambos perdem mana
            gameModel.players[0].mana -= 1
            gameModel.players[1].mana -= 1
        } else if cardPlayOne.type == "attack" && cardPlayTwo.type == "recharge" {
            // Player 1 perde mana e ganha 1 ponto
            gameModel.players[0].mana -= 1
            gameModel.players[0].points += 1
        } else if cardPlayOne.type == "defense" && cardPlayTwo.type == "attack" {
            // Player 2 perde mana e ganha 1 ponto
            gameModel.players[1].mana -= 1
            gameModel.players[1].points += 1
        } else if cardPlayOne.type == "defense" && cardPlayTwo.type == "recharge" {
            // Player 2 ganha 1 ponto
            gameModel.players[1].points += 1
        } else if cardPlayOne.type == "recharge" && cardPlayTwo.type == "attack" {
            // Player 2 perde mana e ganha 1 ponto
            gameModel.players[1].mana -= 1
            gameModel.players[1].points += 1
        } else if cardPlayOne.type == "recharge" && cardPlayTwo.type == "defense" {
            // Player 1 ganha 1 ponto
            gameModel.players[0].points += 1
        }
    }
}
