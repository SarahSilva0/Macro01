//
//  ContentView.swift
//  Macro01
//
//  Created by Sarah dos Santos Silva on 23/05/23.
//

import SwiftUI

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            GeometryReader { geometry in
                Text("Aqui é  Main")
                
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
