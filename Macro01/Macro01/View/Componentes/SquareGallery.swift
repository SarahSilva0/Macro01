//
//  SquareGallery.swift
//  Macro01
//
//  Created by Julia Mendes on 24/05/23.
//

import SwiftUI

struct SquareGallery: View {
    
    var body: some View {
        Rectangle()
            .fill(.gray)
            .frame(width: 300,height: 300)
            .border(.black)
            .cornerRadius(10)
    }
}
struct SquareGallery_Previews: PreviewProvider {
    static var previews: some View {
        SquareGallery()
    }
}
