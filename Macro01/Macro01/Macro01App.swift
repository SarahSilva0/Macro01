//
//  Macro01App.swift
//  Macro01
//
//  Created by Sarah dos Santos Silva on 23/05/23.
//

import SwiftUI

@main
struct Macro01App: App {
    
    //Inicializa o aplicativo Horizontal
    init() {
        UIDevice.current.setValue(UIInterfaceOrientation.landscapeRight.rawValue, forKey: "orientation")
    }
    
    var body: some Scene {
        WindowGroup {
//            MainView()
            MatchView(gameModel: GameModel())
           
        }
    }
}
