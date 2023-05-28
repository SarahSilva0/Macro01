import SwiftUI

class GameTableModel: ObservableObject {
    @Published var handPlayer: [CardModel]
    @Published var players: [Player]!
    @Published var deck: DeckModel
    
    init() {
        players = [Player(cards: [], characterImage: "character"),
                   Player(cards: [], characterImage: "character")]
        deck = DeckModel(cards: cardData)
        handPlayer = cardData
        updatePlayersHand()
    }
    
    var cardData = [
        CardModel(image: "attack", type: "attack"),
        CardModel(image: "defense", type: "defense"),
        CardModel(image: "recharge", type: "recharge")
    ]
    
    func updatePlayersHand() {
        players[0].cards = handPlayer
        players[1].cards = handPlayer
    }
}
