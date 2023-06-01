//
//  File.swift
//  Macro01
//
//  Created by Higor  Lo Castro on 28/05/23.
//

import SwiftUI

//struct Player: Identifiable, Equatable {
//    var id = UUID()
//    var cards: [CardModel]
//    var characterImage: String
//    var mana: Int = 1
//    var points: Int = 0
//}

//Player Model  simplificado
struct Player {
    var name: String
    var mana: Int
    var life: Int
    var pointColor: Color
}
