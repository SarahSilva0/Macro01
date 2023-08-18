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
    
    @Binding var raiaWin: Bool
    
    var body: some View {
        VStack {
            HStack (alignment: .center) {
                Text("FUNCIONOU")
                    .font(.system(size: 40))
                    .foregroundColor(.black)
 
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.blue)
        .onAppear {
            combatViewModel.gameReset()
            raiaWin = combatViewModel.RaiaDiff.winLevel
            combatViewModel.isGameEndAlertPresented = false
            presentationMode.wrappedValue.dismiss()
        }
    }

}






