//
//  ScoreView.swift
//  Macro01
//
//  Created by Higor  Lo Castro on 10/06/23.
//

import SwiftUI

struct ScoreView: View {
    
    let maxScore: Int
    let currentScore: Int
    
    var body: some View {
        HStack (spacing: 10) {
            ForEach(Array(0..<maxScore), id: \.self) { index in
                Circle()
                    .foregroundColor(index < currentScore ? .green : .gray)
                    .frame(width: index == maxScore / 2 ? 24 : 20, height: index == maxScore / 2 ? 24 : 20)
                    .scaleEffect(index == maxScore / 2 ? 1.2 : 1.0)
                
            }
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(maxScore: 5, currentScore: 1)
    }
}

