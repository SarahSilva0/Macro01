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
                    VStack(alignment: .center){
                        Text("Selecione o nível")
                            .font(Font.custom("CooperBlackStd", size: 25))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        HStack(spacing: 20){
                            Button {
                                combatViewModel.mediumDiff.selectdedLevel = false
                                combatViewModel.hardDiff.selectdedLevel = false
                                combatViewModel.easyDiff.selectdedLevel = true
                                shouldNavigate.toggle()
                                
                            } label: {
                                if combatViewModel.easyDiff.winLevel == true{
                                    Image(combatViewModel.easyDiff.imageWin)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                }
                                else{
                                    Image(combatViewModel.easyDiff.imageSillhoute)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                }
                            }
                        
                            
                            Button {
                                combatViewModel.easyDiff.selectdedLevel = false
                                combatViewModel.hardDiff.selectdedLevel = false
                                combatViewModel.mediumDiff.selectdedLevel = true
                                print("BOTAAAAAAAO\(combatViewModel.mediumDiff.selectdedLevel)")
                                shouldNavigate.toggle()
                                
                            } label: {
                            if combatViewModel.mediumDiff.winLevel == true {
                                Image(combatViewModel.mediumDiff.imageWin)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            } else {
                                Image(combatViewModel.mediumDiff.imageSillhoute)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }
                            
                        }.disabled(!combatViewModel.easyDiff.winLevel)
                            
                            
                            Button {
                                combatViewModel.easyDiff.selectdedLevel = false
                                combatViewModel.mediumDiff.selectdedLevel = false
                                combatViewModel.hardDiff.selectdedLevel = true
                                shouldNavigate.toggle()
                                
                            } label: {
                                if combatViewModel.mediumDiff.winLevel == false {
                                    Image("dificil")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                }
                                else {
                                    if combatViewModel.hardDiff.winLevel == true{
                                        Image(combatViewModel.hardDiff.imageWin)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                    }
                                    else{
                                        Image(combatViewModel.hardDiff.imageSillhoute)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                    }
                                }
                            }.disabled(!combatViewModel.mediumDiff.winLevel)
                        }
                        .frame(width: geo.size.width * 0.6)
                        .padding(.vertical) // mudar aqui caso não de certo
                        Text("Raya")
                            .font(Font.custom("CooperBlackStd", size: 25))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
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
}


