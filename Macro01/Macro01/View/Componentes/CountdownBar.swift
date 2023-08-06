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
                .foregroundColor(getBarColor())
        }
    }
    
    func getBarColor() -> Color {
        let greenColor = Color(hex: "#15e012")
        let yellowColor = Color(hex: "#d6e012")
        let redColor = Color(hex: "#e01212")
        
        if countdownFraction >= 0.67 {
            return redColor
        } else if countdownFraction >= 0.33 {
            return yellowColor
        } else {
            return greenColor
        }
    }
}

