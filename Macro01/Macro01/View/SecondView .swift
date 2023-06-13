//
//  SecondView .swift
//  Macro01
//
//  Created by Sarah dos Santos Silva on 30/05/23.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
        ZStack{
            Color(hex: "3C3634")
                .ignoresSafeArea()
            VStack{
                HStack(spacing: 30){
                    CardComponent(image: Image("personagem"))
                        .frame( width: 173, height: 260)
                        .background(Color(hex: "FFF2D9"))
                        .cornerRadius(10)
                    CardComponent(image: Image("personagem"))
                        .frame( width: 173, height: 260)
                        .background(Color(hex: "FFF2D9"))
                        .cornerRadius(10)
                    CardComponent(image: Image("personagem"))
                        .frame( width: 173, height: 260)
                        .background(Color(hex: "FFF2D9"))
                        .cornerRadius(10)
                }
            }
        }
    }
}

struct SecondView__Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
