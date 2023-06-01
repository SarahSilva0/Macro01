//import SwiftUI
//
//class GameTableModel: ObservableObject {
//    @Published var players: [Player]!
//    @Published var deck: [DeckModel]
//
//    var cardDataPlayerOne = [
//        CardModel(image: "attack", type: "attack"),
//        CardModel(image: "defense", type: "defense"),
//        CardModel(image: "recharge", type: "recharge")
//    ]
//
//    let cardDataPlayerTwo = [
//        CardModel(image: "attackTwo", type: "attack"),
//        CardModel(image: "defenseTwo", type: "defense"),
//        CardModel(image: "rechargeTwo", type: "recharge")
//    ]
//
//    init() {
//        players = [
//            Player(cards: [], characterImage: "player1"),
//            Player(cards: [], characterImage: "player2")
//        ]
//
//        deck = [
//            DeckModel(cards: []),
//            DeckModel(cards: [])
//        ]
//
//        // Chamando a função que coloca as cartas dentro do Player 1 e Player 2
//        dealCardsToPlayers(cardData: cardDataPlayerOne, playerIndex: 0)
//        dealCardsToPlayers(cardData: cardDataPlayerTwo, playerIndex: 1)
//
//        // Chamando a função para encher o deckOne e o deckTwo
//        dealCardsToDeck(cardData: cardDataPlayerOne, deckIndex: 0)
//        dealCardsToDeck(cardData: cardDataPlayerTwo, deckIndex: 1)
//    }
//
//
//    // Coloca as cartas dentro do deck
//    func dealCardsToDeck(cardData: [CardModel], deckIndex: Int) {
//        deck[deckIndex].cards.append(contentsOf: cardData)
//    }
//
//    // Coloca as cartas dentro do Player 1 e Player 2
//    func dealCardsToPlayers(cardData: [CardModel], playerIndex: Int) {
//        players[playerIndex].cards.append(contentsOf: cardData)
//    }
//
//
//    // Embaralha as cartas do Deck e enche o deck
//    func refillDeck() {
//        refillDeckAtIndex(deckIndex: 0)
//        refillDeckAtIndex(deckIndex: 1)
//    }
//
//
//    //Verifica e enche o Deck usando parametro
//    private func refillDeckAtIndex(deckIndex: Int) {
//        guard let randomCardIndex = deck[deckIndex].cards.indices.randomElement() else {
//            return
//        }
//
//        let randomCard = deck[deckIndex].cards[randomCardIndex]
//        deck[deckIndex].cards.remove(at: randomCardIndex)
//        deck[deckIndex].cards.append(randomCard)
//        deck[deckIndex].cards.shuffle()
//    }
//
//
//    // Seleciona uma carta do CardOverlayView
//    func selectCard(_ card: CardModel) {
//        guard let playerIndex = players.firstIndex(where: { $0.cards.contains(card) }) else {
//            return
//        }
//
//        players[playerIndex].cards.removeAll(where: { $0 == card })
//
//        if let deckIndex = deck.firstIndex(where: { $0.cards.isEmpty }) {
//            deck[deckIndex].cards.append(card)
//        }
//
//    }
//
//
//    //Adiciona Carta aleatória no player um que vem do Deck
//    func addRandomCardToPlayerOneFromDeck() {
//        refillDeck()
//        guard let randomCardIndex = deck[0].cards.indices.randomElement() else {
//            return
//        }
//
//        let randomCard = deck[0].cards.remove(at: randomCardIndex)
//        players[0].cards.append(randomCard)
//
//
//    }
//
//
//    //Adiciona Carta aleatória no playerDois um que vem do Deck
//    func addRandomCardToPlayerTwoFromDeck() {
//        refillDeck()
//        guard let randomCardIndex = deck[1].cards.indices.randomElement() else {
//            return
//        }
//
//        let randomCard = deck[1].cards.remove(at: randomCardIndex)
//        players[1].cards.append(randomCard)
//
//
//    }
//}
