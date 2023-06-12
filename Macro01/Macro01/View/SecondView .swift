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
                        .background(Color.red)
                    CardComponent(image: Image("personagem"))
                    CardComponent(image: Image("personagem"))
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
