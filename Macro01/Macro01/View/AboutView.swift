//
//  AboutView.swift
//  Macro01
//
//  Created by Higor  Lo Castro on 05/07/23.
//

import SwiftUI

struct AboutView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            Color(.black)
                .opacity(0.65)
            AboutAndPolitics(isPresented: $isPresented,
                                 title: "Sobre",
                                 text: "Testando")
        }
        .ignoresSafeArea()
    }
}



