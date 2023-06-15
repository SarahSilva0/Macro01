//
//  DifficultyModel.swift
//  Macro01
//
//  Created by Sarah dos Santos Silva on 15/06/23.
//

import Foundation
import SwiftUI

class DifficultyModel{
    var imageInitial: String
    var imageSillhoute: String
    var imageWin: String
    var winCard: String
    var selectdedLevel: Bool
    
    init(imageInitial: String, imageSillhoute: String, imageWin: String, winCard: String, selectdedLevel: Bool) {
        self.imageInitial = imageInitial
        self.imageSillhoute = imageSillhoute
        self.imageWin = imageWin
        self.winCard = winCard
        self.selectdedLevel = selectdedLevel
    }
}
