//
//  CardComponent.swift
//  Macro01
//
//  Created by Sarah dos Santos Silva on 24/05/23.
//

import Foundation
import SwiftUI

struct CardComponent: View {
    var image: Image

    var body: some View {
        GeometryReader { geometry in
            VStack {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geometry.size.width * 0.75, height: geometry.size.height * 0.5)
                    .cornerRadius(10)
//                    .padding()
            }
//            .background(Color.white)
//            .cornerRadius(10)
//            .shadow(radius: 5)
//            .padding()
        }
    }
}



