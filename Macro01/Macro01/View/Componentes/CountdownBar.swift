//
//  CountdownBar.swift
//  Macro01
//
//  Created by Higor  Lo Castro on 06/08/23.
//


import SwiftUI

struct CountdownBar : View {
    var countdownFraction: CGFloat

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 15, height: 230)
                .foregroundColor(Color(hex: "FFF2D9"))

            RoundedRectangle(cornerRadius: 10)
                .frame(width: 15, height: 230 * (1 - countdownFraction))
                .foregroundColor(Color(hex: "#12e05e"))
        }
    }
}
