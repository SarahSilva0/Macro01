import SwiftUI

class GameTableModel: ObservableObject {
    @Published var players: [Player]!
    @Published var handPlayer: [CardModel]
    @Published var deck: DeckModel
    
    let cardData = [
        CardModel(image: "attack", type: "attack"),
        CardModel(image: "defense", type: "defense"),
        CardModel(image: "recharge", type: "recharge")
    ]
    
    init() {
        players = [
            Player(cards: [], characterImage: "character"),
            Player(cards: [], characterImage: "character")
        ]
        deck = DeckModel(cards: cardData)
        handPlayer = cardData
        
        dealCardsToPlayers()
       
    }

    private func dealCardsToPlayers() {
        for card in handPlayer {
            players[0].cards.append(card)
            players[1].cards.append(card)
        }
    }
    
    func refillDeck() {
         deck.cards += cardData
         deck.cards.shuffle()
     }
}
