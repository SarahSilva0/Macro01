//
//  CharacterCircle.swift
//  Macro01
//
//  Created by Higor  Lo Castro on 12/06/23.
//

import SwiftUI

struct CharacterCircle: View {
    
    var sizeWidth: CGFloat
    var sizeHeight: CGFloat
    var colorHex: String
    
    
    var body: some View {
        let color = Color(hex: colorHex)
        
        Circle()
            .fill(color)
            .frame(width: sizeWidth, height: sizeHeight)
    }
}

struct CharacterCircle_Previews: PreviewProvider {
    static var previews: some View {
        CharacterCircle(sizeWidth: 300, sizeHeight: 300, colorHex: "#00FF00")
    }
}
