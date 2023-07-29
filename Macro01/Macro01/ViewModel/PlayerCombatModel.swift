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
    
    init(image: String, mana: Int = 1, cards: [Card] = [
        Card(type: .attack, name: "attack"),
        Card(type: .defense, name: "defense"),
        Card(type: .recharge, name: "recharge")
    ]) {
        self.image = image
        self.mana = mana
        self.cards = cards
//        self.selectedCard = selectedCard
    }
    
    //MARK: LOGICA JOGADOR FACIL:
    
    func playCardPlayerEasy() -> Card {
        switch mana {
        //se o mana for 0
        case 0:
            return noManaPlayerEasy()
        //se o mana for 1
        case 1:
            return withManaPlayerEasy()
        //se o mana for 2
        case 2:
            return twoManasPlayerEasy()
        //defaut é defesa porque defesa é a unica carta que pode jogar independente do cenario.
        default:
            return Card(type: .defense, name: "defenseSaci")
        }
    }

    //Não pode ter +2 manas. Não pode usar carta de recarga
    private func twoManasPlayerEasy() -> Card {
        let randomValue = Double.random(in: 0..<1)

        if randomValue < 0.8 { // 80% de chance para ataque
            return Card(type: .attack, name: "attackSaci")
        } else { // 20% de chance para defesa
            return Card(type: .defense, name: "defenseSaci")
        }
    }

    //Sem mana não ataca. Somente defende ou recarga.
    private func noManaPlayerEasy() -> Card {
        let randomValue = Double.random(in: 0..<1)

        if randomValue < 0.8 { // 80% de chance para recarga
            return Card(type: .recharge, name: "rechargeSaci")
        } else { // 20% de chance para defesa
            return Card(type: .defense, name: "defenseSaci")
        }
    }

    //Com mais de um mana e menos de 2 pode usar qualquer uma aleatória.
    private func withManaPlayerEasy() -> Card {
        let randomValue = Double.random(in: 0..<1)

        if randomValue < 0.8 { // 80% de chance para ataque
            return Card(type: .attack, name: "attackSaci")
        } else if randomValue < 0.9 { // 10% de chance para recarga
            return Card(type: .recharge, name: "rechargeSaci")
        } else { // 10% de chance para defesa
            return Card(type: .defense, name: "defenseSaci")
        }
    }

    
    func replaceSelectedCardRandomlyEasy() {
        let index = self.cards.firstIndex(of: self.selectedCard)
        guard let currentIndex = index else { return }
        
        let newCard = playCardPlayerEasy()
        self.cards[currentIndex] = newCard
        self.selectedCard = newCard
    }
    
    
    
    func playCardPlayerHard() -> Card{
        switch mana {
            //se o mana for 0
        case 0:
            return noManaPlayerHard()
            //se o mana for 1
        case 1:
            return withManaPlayerHard()
            //se o mana for 2
        case 2:
            return twoManasPlayerHard()
            //defaut é defesa porque defesa é a unica carta que pode jogar independente do cenario.
        default:
            return Card(type: .defense, name: "defenseSaci")
        }
    }
    
    //Não pode ter +2 manas. Não pode usar carta de recarga
    private func twoManasPlayerHard() -> Card {
        let randomValue = Double.random(in: 0..<1)

        if randomValue < 0.9 { // 90% de chance para ataque
            return Card(type: .attack, name: "attackSaci")
        } else { // 10% de chance para defesa
            return Card(type: .defense, name: "defenseSaci")
        }
    }

    private func noManaPlayerHard() -> Card {
        let randomValue = Double.random(in: 0..<1)

        if randomValue < 0.5 { // 50% de chance para recarga
            return Card(type: .recharge, name: "rechargeSaci")
        } else { // 50% de chance para defesa
            return Card(type: .defense, name: "defenseSaci")
        }
    }

    private func withManaPlayerHard() -> Card {
        let randomValue = Double.random(in: 0..<1)

        if randomValue < 0.7 { // 70% de chance para ataque
            return Card(type: .attack, name: "attackSaci")
        } else if randomValue < 0.8 { // 10% de chance para recarga
            return Card(type: .recharge, name: "rechargeSaci")
        } else { // 20% de chance para defesa
            return Card(type: .defense, name: "defenseSaci")
        }
    }
    
    func replaceSelectedCardRandomlyHard() {
        let index = self.cards.firstIndex(of: self.selectedCard)
        guard let currentIndex = index else { return }
        
        let newCard = playCardPlayerHard()
        self.cards[currentIndex] = newCard
        self.selectedCard = newCard
    }
}

    
