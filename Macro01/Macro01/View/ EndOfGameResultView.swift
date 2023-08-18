//
//  EndOfGameResult.swift
//  Macro01
//
//  Created by Higor  Lo Castro on 18/08/23.
//

import SwiftUI

struct EndOfGameResultView: View {
    
    var body: some View {
        GeometryReader { geometry in
            
            ZStack {
                VStack {
                    HStack (alignment: .center) {
                        WinnerDefeatText(text: "Oi", size: 50, paddingSize: 0)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                }
            }
            .ignoresSafeArea(.all)
            
        }
    }
    
}


