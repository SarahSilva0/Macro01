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
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("Raia") var raiaWin: Bool = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("BG Galeria")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                
                
                VStack {
                    HStack {
                        ButtonGenRound(action: {
                            withAnimation {
                                self.presentationMode.wrappedValue.dismiss()
                            }
                        },
                                       image: "out",
                                       foregroundColor: (Color(hex: "FFF2D9")),
                                       backgroundColor: (Color(hex: "FFF2D9")))
                                       .frame(width: 50, height: 50)
                    
                        Spacer()
                        
                    }
                    Spacer()
                        .frame(width: geo.size.width * 0.01, height: geo.size.height * 0.8)
                }
                .frame(width: geo.size.width * 1.06, height: geo.size.height * 0.1)
                
                
                
                VStack{
                    VStack(alignment: .center, spacing: 35){
                        Text("Selecione um Oponente")
                            .font(Font.custom("CooperBlackStd", size: 25))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        HStack(spacing: 20){
                            Button {
                                print("Raia")
                                combatViewModel.RaiaDiff.selectdedLevel = true
                                combatViewModel.setPlayer()
                                shouldNavigate.toggle()
                                
                            } label: {
                                if raiaWin == true {
                                    Image("charWinIara")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                }
                                else{
                                    Image("charIara")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                }
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
            CombatView(combatViewModel: combatViewModel, raiaWin: $raiaWin)
                .environment(\.presentations, presentations + [$shouldNavigate])
        }
    }
}



