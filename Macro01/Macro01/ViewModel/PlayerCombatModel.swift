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
    @Published var cards: [String]
    @Published var selectedCard = ""
    
    
    init(image: String, mana: Int = 1, cards: [String] = ["attack", "defense", "recharge"], selectedCard: String = "") {
        self.image = image
        self.mana = mana
        self.cards = cards
        self.selectedCard = selectedCard
    }
    
    //MARK: LOGICA JOGADOR FACIL:
    
    func playCardPlayerEasy() -> String{
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
            return Cards().defense
        }
    }
    
    //Não pode ter +2 manas. Não pode usar carta de recarga
    private func twoManasPlayerEasy() -> String {
        let randomValue = Double.random(in: 0..<1)

            if randomValue < 0.8 { // 80% de chance para ataque
                return Cards().attack
            } else { // 20% de chance para defesa
                return Cards().defense
            }
    }
    
    //Sem mana não ataca. Somente defende ou recarga.
    private func noManaPlayerEasy() -> String {
        let randomValue = Double.random(in: 0..<1)

            if randomValue < 0.8 { // 80% de chance para recarga
                return Cards().recharge
            } else { // 20% de chance para defesa
                return Cards().defense
            }
    }
    
    //Com mais de um mana e menos de 2 pode usar qualquer uma aleatória.
    private func withManaPlayerEasy() -> String {
        let randomValue = Double.random(in: 0..<1)

        if randomValue < 0.8 { // 80% de chance para ataque
            return Cards().attack
        } else if randomValue < 0.9 { // 10% de chance para recarga
            return Cards().recharge
        } else { // 10% de chance para defesa
            return Cards().defense
        }

    }
    
    func replaceSelectedCardRandomly() {
        let index = self.cards.firstIndex(of: self.selectedCard)
        guard let currentIndex = index else { return }
        
        let newCard = playCardPlayerHard()
        self.cards[currentIndex] = newCard
        self.selectedCard = newCard
    }
    
    
    
    func playCardPlayerHard() -> String{
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
            return Cards().defense
        }
    }
    
    //Não pode ter +2 manas. Não pode usar carta de recarga
    private func twoManasPlayerHard() -> String {
        let randomValue = Double.random(in: 0..<1)

            if randomValue < 0.9 { // 90% de chance para ataque
                return Cards().attack
            } else { // 10% de chance para defesa
                return Cards().defense
            }
    }
    
    //Sem mana não ataca. Somente defende ou recarga.
    private func noManaPlayerHard() -> String {
        let randomValue = Double.random(in: 0..<1)
            
            if randomValue < 0.5 { // 50% de chance para recarga
                return Cards().recharge
            } else { // 50% de chance para defesa
                return Cards().defense
            }
    }
    
    //Com mais de um mana e menos de 2 pode usar qualquer uma aleatória.
    private func withManaPlayerHard() -> String {
        let randomValue = Double.random(in: 0..<1)

        if randomValue < 0.7 { // 70% de chance para ataque
            return Cards().attack
        } else if randomValue < 0.8 { // 10% de chance para recarga
            return Cards().recharge
        } else { // 10% de chance para defesa
            return Cards().defense
        }

    }
    
}

    
