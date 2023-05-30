//
//  SecondView .swift
//  Macro01
//
//  Created by Sarah dos Santos Silva on 30/05/23.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                VStack {
                    ButtonGenRound(action: {
                        print("botao")
                    }, image: "",
                    foregroundColor: Color.red,
                    backgroundColor: Color.blue)
                    .frame(width: geometry.size.width * 0.07, height: geometry.size.width * 0.07)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack {
                    HStack(spacing: geometry.size.width * 0.1) {
                        CardComponent(image: Image("Imagem"))
                        .frame(width: geometry.size.width * 0.25, height: geometry.size.width * 0.45)
                        
                        CardComponent(image: Image("cadeado"))
                            .frame(width: geometry.size.width * 0.25, height: geometry.size.width * 0.45)
                        
                        CardComponent(image: Image("cadeado"))
                            .frame(width: geometry.size.width * 0.25, height: geometry.size.width * 0.45)
                    }
                }
            }.padding()
        }
    }
}

struct SecondView__Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
