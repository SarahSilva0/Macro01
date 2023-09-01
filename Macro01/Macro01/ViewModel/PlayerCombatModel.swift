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
        [(.attack, 0.6), (.recharge, 0.3), (.defense, 0.1)], // melhorar isso aqui
        [(.attack, 0.6), (.defense, 0.4)]
    ])
    
    let RaiaProbabilities = CardProbabilities(probabilities: [
        [(.recharge, 0.6), (.defense, 0.4)],
        [(.attack, 0.4), (.recharge, 0.3), (.defense, 0.3)],
        [(.attack, 0.6), (.defense, 0.4)]
    ])
    
    //MARK: FUNCAO GENERICA DA LOGICA DA PROBABILIDADE DAS CARTAS
    func playerLogic(with probabilities: CardProbabilities, for bot: String) -> Card {
        let manaIndex = min(mana, probabilities.probabilities.count - 1)
        let randomValue = Double.random(in: 0...1)
        
        let possibleCards = probabilities.probabilities[manaIndex]
        var updatedCards = cards
        
        let attackCount = updatedCards.filter { $0.type == .attack }.count
        let rechargeCount = updatedCards.filter { $0.type == .recharge }.count
        let defenseCount = updatedCards.filter { $0.type == .defense }.count
        
        return chooseCard(from: possibleCards, with: randomValue, attackCount: attackCount, rechargeCount: rechargeCount, defenseCount: defenseCount, bot: bot)
    }
    //MARK: FUNCAO QUE IRA RETORNAR A CARTA
    func chooseCard(from possibleCards: [(cardType: Cards.CardType, probability: Double)], with randomValue: Double, attackCount: Int, rechargeCount: Int, defenseCount: Int, bot: String) -> Card {
        var cumulativeProbability: Double = 0.0
        
        for (cardType, probability) in possibleCards {
            if shouldSkipCard(cardType: cardType, count: getCount(for: cardType, attackCount: attackCount, rechargeCount: rechargeCount, defenseCount: defenseCount)) {
                
                if attackCount == 2 && mana < 2  {
                    switch randomValue {
                    case 0..<0.6:
                        print("RECARGA") // 80% de chance de cair recarga
                        return Card(type: .recharge, name: "recharge\(bot)")
                        
                    default:
                        print("Defesa") // 20% de chance de cair defesa
                        return Card(type: .defense, name: "defense\(bot)")
                    }
                }
                
                if defenseCount >= 2 && mana < 2 {
                    print("DEFESAAAAAA")
                    switch randomValue {
                    case 0..<0.6:
                        print("RECARGA") // 60% de chance de cair recarga
                        return Card(type: .attack, name: "attack\(bot)")
                        
                    default:
                        print("RECARGA") // 40% de chance de cair defesa
                        return Card(type: .recharge, name: "recharge\(bot)")
                    }
                }
                
                if defenseCount >= 2 && mana >= 2 {
                    print("ATAQUEEEE")
                    return Card(type: .attack, name: "attack\(bot)")
                }
                
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
    
    //MARK: verifica a contagem das cartas que estao na mao
    func shouldSkipCard(cardType: Cards.CardType, count: Int) -> Bool {
        switch cardType {
        case .attack, .recharge, .defense:
            return count >= 2
        case .empty, .block:
            return false
        }
    }
    
    //MARK: SETANDO OS TAMANHOS
    func getCount(for cardType: Cards.CardType, attackCount: Int, rechargeCount: Int, defenseCount: Int) -> Int {
        switch cardType {
        case .attack: return attackCount
        case .recharge: return rechargeCount
        case .defense: return defenseCount
        case .empty: return 0
        case .block: return 0
        }
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




