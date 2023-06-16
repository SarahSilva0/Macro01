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
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        HStack(spacing: 20){
                            Button {
                                combatViewModel.easyDiff.selectdedLevel.toggle()
                                print("BOTAAAAAAAO\(combatViewModel.easyDiff.selectdedLevel)")
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
                            
                            Image("intermediario")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                            Image("dificil")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        .frame(width: geo.size.width * 0.6)
                        .padding(.vertical) // mudar aqui caso não de certo
                        Text("Raya")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }.frame(height: geo.size.height * 0.8, alignment: .bottom)
                }.frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                
            }.sheet(isPresented: $shouldNavigate){
                CombatView(combatViewModel: combatViewModel) // Passando a mesma instância de combatViewModel

            }
            .onAppear{
                print("AQUIIIIIIIIIIIIIIIIIIIIIIIIII \(combatViewModel.easyDiff.selectdedLevel)")
            }
        }
    }
}

//struct DificultyView__Previews: PreviewProvider {
//    static var previews: some View {
//        DificultyView_()
//    }
//}
