//
//  DificultyViewModel.swift
//  Macro01
//
//  Created by Higor  Lo Castro on 31/08/23.
//
import Foundation
import SwiftUI

class DificultyViewModel: ObservableObject {
    @AppStorage("Raia") var raiaWin: Bool = false
    @AppStorage("Boto") var botoWin: Bool = false
    @AppStorage("Cuca") var cucaWin: Bool = false
}
