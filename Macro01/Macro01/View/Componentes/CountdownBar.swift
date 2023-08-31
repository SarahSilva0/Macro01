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
        let greenColor = Color(hex: "78E478")
        let yellowColor = Color(hex: "FAE15A")
        let redColor = Color(hex: "FA5A5A")
        
        if countdownFraction >= 0.67 {
            return redColor
        } else if countdownFraction >= 0.33 {
            return yellowColor
        } else {
            return greenColor
        }
    }
}

    



