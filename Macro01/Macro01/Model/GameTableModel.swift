//
//  GameTableModel.swift
//  Macro01
//
//  Created by Higor  Lo Castro on 27/05/23.
//

import SwiftUI

struct GameModel {
    var handPlayer: [Card]
    var players: [Player]
    
    init() {
        handPlayer = cardData
        players = [Player(cards: handPlayer, characterImage: "character"),
                   Player(cards: handPlayer, characterImage: "character")]
        
        print(players[0])
        print(players[1])
    }
}

struct Player: Identifiable {
    var id = UUID()
    var cards: [Card]
    var characterImage: String
    var mana: Int = 1
    var points: Int = 0
    
}


struct Card: Identifiable, Equatable {
    var id = UUID()
    var image: String
    var type: String
}

struct Deck: Identifiable {
    var id = UUID()
    var cards: [Card] = cardData
}

var cardData = [
    Card(image: "attack", type: "attack"),
    Card(image: "defense", type: "defense"),
    Card(image: "recharge", type: "recharge")
]
