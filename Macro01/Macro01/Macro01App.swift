//
//  Macro01App.swift
//  Macro01
//
//  Created by Sarah dos Santos Silva on 23/05/23.
//

import SwiftUI

@main
struct Macro01App: App {
    var body: some Scene {
        WindowGroup {
            MainView()
            BotaoGenRedondoView(action: {},
                                image: "Saci",
                                foregroundColor: .white,
                                padding: 10,
                                backgroundColor: .blue)
        }
    }
}
