//
//  SheetView.swift
//  Macro01
//
//  Created by Sarah dos Santos Silva on 05/06/23.
//

import SwiftUI

//MARK: SHEET VIEW EM QUE AS VIEWS APARECEM. PRECISA SER SEPARADA EM OUTRO ARQUIVO
struct SheetView: View {
    @ObservedObject var combatViewModel: CombatViewModel
    @Binding var isSheetVisible: Bool
    
    var body: some View {
        VStack {
            HStack {
                ForEach(combatViewModel.player1.cards, id: \.self) { card in
                    CardComponent(image: Image(card))
                        .onTapGesture {
                            combatViewModel.player1.selectedCard = card
                            print(combatViewModel.player1.selectedCard)
                            isSheetVisible = false
                        }
                }
            }
        }
    }
}

