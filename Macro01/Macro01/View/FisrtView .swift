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
            VStack {
                VStack{
                    HStack(spacing: 20) {
                        ButtonGenRound(action: {
                            print("Configuração")
                        },
                                       image: "",
                                       foregroundColor: Color.red,
                                       backgroundColor: Color.red)
                        .frame(width: buttonSize, height: buttonSize)
                        
                        ButtonGenRound(action: {
                            print("Galeria")
                        },
                                       image: "",
                                       foregroundColor: Color.red,
                                       backgroundColor: Color.red)
                        .frame(width: buttonSize, height: buttonSize)
                        
                        Spacer()
                    }
                    .padding(.leading)
                }.frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.2)
                
                VStack {
                    Text("Título")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                    
                    VStack {
                        ButtonComponent(buttonText: "Modo História") {
                            print("modo história")
                        }
                        NavigationLink(destination: CombatView()){
                            Text("CO OP")
                        }
                        
//                        ButtonComponent(buttonText: "Modo Co-op") {
//                            print("modo co-op")
//                        }
                    }
                    .padding()
                }
                .frame(width: geometry.size.width, height: geometry.size.height * 0.5)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}



struct FisrtView__Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
