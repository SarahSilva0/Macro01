//
//  DificultyView .swift
//  Macro01
//
//  Created by Sarah dos Santos Silva on 13/06/23.
//

import SwiftUI

struct DificultyView_: View {
    
    @State private var shouldNavigate = false
    @ObservedObject var combatViewModel: CombatViewModel
    @Environment(\.presentations) private var presentations
    
    
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("BG Galeria")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                VStack{
                    VStack(alignment: .center, spacing: 20){
                        Text("Selecione um oponente")
                            .font(Font.custom("CooperBlackStd", size: 25))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        HStack(spacing: 20){
                            Button {
                                print("Raia")
                                combatViewModel.RaiaDiff.selectdedLevel = true
                                shouldNavigate.toggle()
                                
                            } label: {
                                Image("charIara")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }
                        
                            Button {
                                print("Boto")
                                
                            } label: {
                                Image("charBlockBoto")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }.disabled(!combatViewModel.RaiaDiff.winLevel)
                            
                            Button {
                                print("Cuca")
                                
                            } label: {
                                Image("charBlockCuca")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }.disabled(!combatViewModel.RaiaDiff.winLevel)


                            
                        }
                    }
                    .frame(width: geo.size.width * 0.6)
                    .padding(.vertical) // mudar aqui caso não de certo
                }.frame(height: geo.size.height * 0.8, alignment: .bottom)
            }.frame(width: geo.size.width, height: geo.size.height, alignment: .center)
            
        }.sheet(isPresented: $shouldNavigate, onDismiss: {
            combatViewModel.startCountdown()
            combatViewModel.gameReset()
        }){
            CombatView(combatViewModel: combatViewModel)
                .environment(\.presentations, presentations + [$shouldNavigate])
        }
    }
}



