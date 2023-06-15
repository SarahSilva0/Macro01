//
//  CombatView.swift
//  Macro01
//
//  Created by Sarah dos Santos Silva on 30/05/23.
//

import SwiftUI

//MARK: VIEW DO COMBATE. ESSA VIEW PRECISA SER REFATORADA DEPOIS E DEIXADA MAIS RESPONSIVA
struct CombatView: View {
    
    @StateObject private var combatViewModel = CombatViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                Image("backgroundOne")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                
        
                VStack(alignment: .center) {
                    Spacer ()
                    if combatViewModel.isCountdownVisible {
                            Text("\(combatViewModel.countdown)")
                                .font(.custom("Helvetica Neue", size: 50))
                                .foregroundColor(Color(hex: "3C3634"))
                                .fontWeight(.bold)
                        }
                    Spacer()
                    }
                    .frame(width: geometry.size.width * 0.1, height: geometry.size.height * 0.1)
                
                
                .onAppear {
                    combatViewModel.startCountdown()
                }
                
                .sheet(isPresented: $combatViewModel.isSheetVisible, onDismiss: {
                }) {
                    SheetView(combatViewModel: combatViewModel, isSheetVisible: $combatViewModel.isSheetVisible, countdownSheet: $combatViewModel.countdownSheet).background(ClearBackgroundView())
                }
                .alert(isPresented: $combatViewModel.isGameEndAlertPresented) {
                    Alert(title: Text("Fim do Jogo"),
                          message: Text("\(combatViewModel.getScore())"),
                          dismissButton: .default(Text("OK"), action: {
                        presentationMode.wrappedValue.dismiss()
                    }))
                }
                
            }
        }
   
    }
}

struct CombatView_Previews: PreviewProvider {
    static var previews: some View {
        CombatView()
    }
}






