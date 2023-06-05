//
//  Cards.swift
//  Macro01
//
//  Created by Sarah dos Santos Silva on 05/06/23.
//

import Foundation

//MARK: MODEL CARDS COM A LOGICA DA ALEATORIEDADE
struct Cards {
    let defense = "defense"
    let attack = "attack"
    let recharge = "recharge"
    
    func randomCard() -> String {
        let randomValue = Double.random(in: 0..<1)
        
        if randomValue < 0.4 { // 40% de chance para ataque
            return attack
        } else if randomValue < 0.7 { // 30% de chance para recarga
            return recharge
        } else { // 25% de chance para defesa
            return defense
        }
    }
}
