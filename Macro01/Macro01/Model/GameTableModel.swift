import SwiftUI

class GameTableModel: ObservableObject {
    @Published var players: [Player]!
    @Published var deck: [DeckModel]
    
    let cardDataPlayerOne = [
        CardModel(image: "attack", type: "attack"),
        CardModel(image: "defense", type: "defense"),
        CardModel(image: "recharge", type: "recharge")
    ]
    
    let cardDataPlayerTwo = [
        CardModel(image: "attack", type: "attack"),
        CardModel(image: "defense", type: "defense"),
        CardModel(image: "recharge", type: "recharge")
    ]
    
    init() {
        players = [
            Player(cards: [], characterImage: "character"),
            Player(cards: [], characterImage: "character")
        ]
        
        deck = [
            DeckModel(cards: []),
            DeckModel(cards: [])
        ]
        
        // Chamando a função que coloca as cartas dentro do Player 1 e Player 2
        dealCardsToPlayers(cardData: cardDataPlayerOne, playerIndex: 0)
        dealCardsToPlayers(cardData: cardDataPlayerTwo, playerIndex: 1)
        
        // Chamando a função para encher o deckOne e o deckTwo
        dealCardsToDeck(cardData: cardDataPlayerOne, deckIndex: 0)
        dealCardsToDeck(cardData: cardDataPlayerTwo, deckIndex: 1)
    }
    
    
    // Coloca as cartas dentro do deck
    func dealCardsToDeck(cardData: [CardModel], deckIndex: Int) {
        deck[deckIndex].cards.append(contentsOf: cardData)
    }
    
    // Coloca as cartas dentro do Player 1 e Player 2
    func dealCardsToPlayers(cardData: [CardModel], playerIndex: Int) {
        players[playerIndex].cards.append(contentsOf: cardData)
    }
    

    // Embaralha as cartas do Deck
    func refillDeck() {
        deck[0].cards.shuffle()
        deck[1].cards.shuffle()
    }
    
    // Seleciona uma carta do CardOverlayView
        func selectCard(_ card: CardModel) {
            guard let playerIndex = players.firstIndex(where: { $0.cards.contains(card) }) else {
                return
            }
            
            players[playerIndex].cards.removeAll(where: { $0 == card })
            
            if let deckIndex = deck.firstIndex(where: { $0.cards.isEmpty }) {
                deck[deckIndex].cards.append(card)
            }
            
            refillDeck()
        }
}
