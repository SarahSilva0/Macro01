//
//  DificultyViewModel.swift
//  Macro01
//
//  Created by Higor  Lo Castro on 31/08/23.
//
import Foundation
import SwiftUI

class DificultyViewModel: ObservableObject {
    @AppStorage("Raia") var raiaWin: Bool = true
    @AppStorage("Boto") var botoWin: Bool = true
    @AppStorage("Cuca") var cucaWin: Bool = true
}
