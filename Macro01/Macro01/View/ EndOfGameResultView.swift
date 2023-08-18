//
//  EndOfGameResult.swift
//  Macro01
//
//  Created by Higor  Lo Castro on 18/08/23.
//

import SwiftUI

struct EndOfGameResultView: View {
    @ObservedObject var combatViewModel: CombatViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack (alignment: .center) {
                Text("FUNCIONOU")
                    .font(.system(size: 30))
                    .foregroundColor(.blue)
                // Coloque aqui o código que deseja exibir no fim do jogo
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.7))
        .onAppear {
            combatViewModel.gameReset()
            raiaWin = combatViewModel.RaiaDiff.winLevel
            combatViewModel.isGameEndAlertPresented = false
            presentationMode.wrappedValue.dismiss()
        }
    }
}






