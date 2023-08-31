//
// Cards.swift
// Macro01
//
// Created by Sarah dos Santos Silva on 05/06/23.
//

import Foundation

struct Cards {
    enum CardType: String {
        case attack
        case defense
        case recharge
        case empty
        case block
    }
}

struct Card: Equatable, Hashable {
    let type: Cards.CardType
    let name: String

    init(type: Cards.CardType, name: String) {
        self.type = type
        self.name = name
        // Implemente aqui a lógica para associar o nome da carta à imagem.
        // Por exemplo, se as imagens estão armazenadas com nomes padronizados, você pode fazer algo como:
        // self.imageName = "\(name)_image" (considerando que as imagens se chamem "nomedacarta_image")
        // Caso as imagens tenham nomes específicos, você pode associar manualmente cada nome à imagem correspondente.
    }
}

struct CardProbabilities {
    let probabilities: [[(Cards.CardType, Double)]]

    init(probabilities: [[(Cards.CardType, Double)]]) {
        self.probabilities = probabilities
    }
}
