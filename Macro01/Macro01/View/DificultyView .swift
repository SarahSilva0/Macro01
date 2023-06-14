//
//  DificultyView .swift
//  Macro01
//
//  Created by Sarah dos Santos Silva on 13/06/23.
//

import SwiftUI

struct DificultyView_: View {
    var body: some View {
        ZStack{
            Image("BG Galeria")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            GeometryReader { geo in
                VStack{
                    VStack(alignment: .center){
                        Text("Selecione o nível")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        HStack(spacing: 20){
                            NavigationLink(destination: CombatView()){
                                Image("facil")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
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
                    
            }
        }
    }
}

struct DificultyView__Previews: PreviewProvider {
    static var previews: some View {
        DificultyView_()
    }
}
