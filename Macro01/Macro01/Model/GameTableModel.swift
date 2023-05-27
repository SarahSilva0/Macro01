//
//  GameTableModel.swift
//  Macro01
//
//  Created by Higor  Lo Castro on 27/05/23.
//

import SwiftUI

struct Player: Identifiable {
    var id = UUID()
    var cards: [Card]
    var characterImage: String
    var mana: Int = 1
    var points: Int = 0
}

var handPlayer: [Card] = cardData
var players: [Player] = [Player(cards: handPlayer, characterImage: "character"), Player(cards: handPlayer, characterImage: "character")]

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
