//
//  Cards.swift
//  Macro01
//
//  Created by Sarah dos Santos Silva on 05/06/23.
//

import Foundation

//MARK: MODEL CARDS COM A LOGICA DA ALEATORIEDADE
struct Cards {
    enum CardType: String {
        case attack
        case defense
        case recharge
        case empty
        case block
    }

    let type: CardType

    init(type: CardType) {
        self.type = type
    }
}


struct Card: Equatable, Hashable{
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
