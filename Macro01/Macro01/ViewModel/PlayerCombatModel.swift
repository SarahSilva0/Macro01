//
//  PlayerCombatModel.swift
//  Macro01
//
//  Created by Sarah dos Santos Silva on 05/06/23.
//

import Foundation

//MARK: MODEL JOGADOR
class PlayerCombat: ObservableObject {
    var image: String
    var name: String
    @Published var winTurno = 0
    @Published var mana: Int = 1
    @Published var cards: [Card]
    @Published var selectedCard = Card(type: .empty, name: "")
    
    init(image: String, name: String, mana: Int = 1, cards: [Card] = []) {
        self.image = image
        self.name = name
        self.mana = mana
        self.cards = cards
    }
    
    //MARK: CRIANDO AS PROBABILIDADES DOS BOTS
    let SPProbabilities = CardProbabilities(probabilities: [
        [(.recharge, 0.6), (.defense, 0.4)],
        [(.attack, 0.6), (.recharge, 0.2), (.defense, 0.2)], // melhorar isso aqui
        [(.attack, 0.6), (.defense, 0.4)]
    ])
    
    let RaiaProbabilities = CardProbabilities(probabilities: [
        [(.recharge, 0.6), (.defense, 0.4)],
        [(.attack, 0.4), (.recharge, 0.3), (.defense, 0.3)],
        [(.attack, 0.6), (.defense, 0.4)]
    ])
    
    //MARK: FUNCAO GENERICA DA LOGICA DA PROBABILIDADE DAS CARTAS
    func playerLogic(with probabilities: CardProbabilities, for bot: String) -> Card {
        let randomValue = Double.random(in: 0..<1)
        let manaIndex = min(mana, probabilities.probabilities.count - 1)

        let possibleCards = probabilities.probabilities[manaIndex]
        var cumulativeProbability: Double = 0.0
        var updatedCards = cards
        
        let attackCount = updatedCards.filter { $0.type == .attack }.count
        let rechargeCount = updatedCards.filter { $0.type == .recharge }.count

        for (cardType, probability) in possibleCards {
            if cardType == .attack && attackCount >= 2 {
                print("2 CARTAS DE ATAQUE")
                cumulativeProbability += 0.0
            } else if cardType == .recharge && rechargeCount >= 2 {
                print("2 CARTAS DE RECARGA")
                cumulativeProbability += 0.0
            } else {
                cumulativeProbability += probability
            }
            
            if randomValue < cumulativeProbability {
                return Card(type: cardType, name: "\(cardType.rawValue)\(bot)")
            }
        }
        
        return Card(type: .defense, name: "defense\(bot)")
    }

    //MARK: FUNCAO PARA SUBSTITUIR A CARTA QUE O JOGADOR JOGOU
    func replaceSelectedCardRandomly(with probabilities: CardProbabilities, for bot: String) {
        let index = self.cards.firstIndex(of: self.selectedCard)
        guard let currentIndex = index else { return }

        let newCard = playerLogic(with: probabilities, for: bot)
        self.cards[currentIndex] = newCard
        self.selectedCard = newCard
    }
    


    
}




