//
//  FisrtView .swift
//  Macro01
//
//  Created by Sarah dos Santos Silva on 29/05/23.
//

import SwiftUI

struct FirstView: View {
    @ScaledMetric(relativeTo: .body) var buttonSize: CGFloat = 50
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                Color.black
                    .ignoresSafeArea()
                Image("BG GERAL")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea(.all)
                VStack {
                    VStack{
                        HStack(spacing: 20) {
                            ButtonGenRound(action: {
                                print("Configuração")
                            },
                                           image: "Configuração",
                                           foregroundColor: Color(hex: "FFF2D9"),
                                           backgroundColor: Color(hex: "FFF2D9"))
                            .frame(width: buttonSize, height: buttonSize)
                            
                            ButtonGenRound(action: {
                                print("Galeria")
                            },
                                           image: "Galeria",
                                           foregroundColor: Color(hex: "FFF2D9"),
                                           backgroundColor: Color(hex: "FFF2D9"))
                            .frame(width: buttonSize, height: buttonSize)
                            
                            Spacer()
                        }
                        .padding(.leading)
                    }.frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.1)
                    
                    VStack {
                       Image("titulo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.vertical)
        
                            NavigationLink(destination: DificultyView_(combatViewModel: CombatViewModel())){
                                Text("Jogo Livre")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                    .frame(width: 200, height: 15)
                                    .padding()
                                    .background(Color(hex: "FFF2D9"))
                                    .cornerRadius(10)
                            }
                        
                    }.frame(width: geometry.size.width * 0.7, height: geometry.size.height * 0.8, alignment: .center)
                }
            }.frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
        }
    }
}



struct FisrtView__Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
