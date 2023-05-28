//
//  File.swift
//  Macro01
//
//  Created by Higor  Lo Castro on 28/05/23.
//

import Foundation

struct CardModel: Identifiable, Equatable {
    var id = UUID()
    var image: String
    var type: String
}
