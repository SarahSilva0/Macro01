//
//  SwiftUIView.swift
//  Macro01
//
//  Created by Julia Mendes on 07/08/23.
//

import SwiftUI

struct WinnerText: View {
    
    var text: String = ""
    var size: Int
    var paddingSize: Int
    
    var body: some View {
        Text("\(text)")
            .font(Font.custom("CooperBlackStd", size: CGFloat(size)))
            .foregroundColor(Color(hex: "3C3634"))
            .bold()
            .zIndex(1)
            .padding(.top, CGFloat(paddingSize))
    }
}
