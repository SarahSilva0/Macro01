//
//  File.swift
//  Macro01
//
//  Created by Higor  Lo Castro on 28/05/23.
//

import Foundation

struct DeckModel: Identifiable {
    var id = UUID()
    var cards: [CardModel]
}
