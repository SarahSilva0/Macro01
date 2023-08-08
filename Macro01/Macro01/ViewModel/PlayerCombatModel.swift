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
    @Published var winTurno = 0
    @Published var mana: Int = 1
    @Published var cards: [Card]
    @Published var selectedCard = Card(type: .empty, name: "")
    
    init(image: String, mana: Int = 1, cards: [Card]) {
        self.image = image
        self.mana = mana
        self.cards = cards
    }
    
    func SPBot() -> Card {
        let probabilities: [[(Cards.CardType, Double)]] = [
            [(.recharge, 0.6), (.defense, 0.4)],     // Probabilidades para mana = 0
            [(.attack, 0.4), (.recharge, 0.3), (.defense, 0.3)],  // Probabilidades para mana = 1
            [(.attack, 0.5), (.defense, 0.5)]      // Probabilidades para mana = 2
        ]
        
        let randomValue = Double.random(in: 0..<1)
        let manaIndex = min(mana, probabilities.count - 1)
        
        let possibleCards = probabilities[manaIndex]
        var cumulativeProbability: Double = 0.0
        
        var updatedCards = cards  // Create a copy of the current cards
        
        let attackCount = updatedCards.filter { $0.type == .attack }.count
        let rechargeCount = updatedCards.filter { $0.type == .recharge }.count
        
        if attackCount >= 3 {
            return Card(type: .defense, name: "defenseSaci")
        }
        
        if rechargeCount >= 3 {
            return Card(type: .defense, name: "defenseSaci")
        }
        
        for (cardType, probability) in possibleCards {
            if cardType == .attack && attackCount >= 2 {
                cumulativeProbability += 0.0
            } else if cardType == .recharge && rechargeCount >= 2 {
                cumulativeProbability += 0.0
            } else {
                cumulativeProbability += probability
            }
            
            if randomValue < cumulativeProbability {
                return Card(type: cardType, name: "\(cardType.rawValue)Saci")
            }
        }
        
        return Card(type: .defense, name: "defenseSaci")
    }
    
    func replaceSelectedCardRandomlyEasy() {
        let index = self.cards.firstIndex(of: self.selectedCard)
        guard let currentIndex = index else { return }
        
        let newCard = SPBot()
        self.cards[currentIndex] = newCard
        self.selectedCard = newCard
    }
    
}


