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
    @State private var isTextVisible = false

    var body: some View {
        Text("\(text)")
            .font(Font.custom("CooperBlackStd", size: CGFloat(size)))
            .foregroundColor(Color(hex: "3C3634"))
            .bold()
            .zIndex(1)
            .baselineOffset(-10)
            .opacity(isTextVisible ? 1 : 0)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation {
                        isTextVisible = true
                    }
                }
            }
    }
}

