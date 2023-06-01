//
//  GameEndAlert.swift
//  Macro01
//
//  Created by Higor  Lo Castro on 01/06/23.
//

import SwiftUI

struct GameEndAlert: View {
    @Binding var isPresented: Bool

    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Text("Fim de Jogo")
                    .font(.title)
                    .padding()

                Button("OK") {
                    isPresented = false
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
