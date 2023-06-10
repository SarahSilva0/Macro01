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
    
    //MARK: FUNCAO QUE PEGA CARTA SELECIONADA E SUBSTITUI ELA
    //MARK: MELHORAR AQUI DEPOIS
    func replaceSelectedCardRandomly() {
        let index = cards.firstIndex(of: selectedCard)
        guard let currentIndex = index else { return }

        let cardsInstance = Cards()
        let newCard = cardsInstance.randomCard() // Usando a função randomCard() na instância de Cards
        cards[currentIndex] = newCard
        selectedCard = newCard
    }
    
    
    //MARK: LOGICA BOT:
    func playCard() -> String{
        switch self.mana {
            //se o mana for 0
        case 0:
            return noMana()
            //se o mana for 1
        case 1:
            return withMana()
            //se o mana for 2
        case 2:
            return twoManas()
            //defaut é defesa porque defesa é a unica carta que pode jogar independente do cenario.
        default:
            return Cards().defense
        }
    }
    
    //Não pode ter +2 manas. Não pode usar carta de recarga
    private func twoManas() -> String {
        let randomIndex = Int.random(in: 0..<2)
        switch randomIndex {
        case 0:
            return Cards().defense
        case 1:
            return Cards().attack
        default:
            return Cards().defense
        }
    }
    
    //Sem mana não ataca. Somente defende ou recarga.
    private func noMana() -> String {
        let randomIndex = Int.random(in: 0..<2)
        switch randomIndex {
        case 0:
            return Cards().defense
        case 1:
            return Cards().recharge
        default:
            return Cards().defense
        }
    }
    
    //Com mais de um mana e menos de 2 pode usar qualquer uma aleatória.
    private func withMana() -> String {
        let randomIndex = Int.random(in: 0..<3)
        switch randomIndex {
        case 0:
            return Cards().defense
        case 1:
            return Cards().recharge
        case 2:
            return Cards().attack
        default:
            return Cards().defense
        }
    }
}
