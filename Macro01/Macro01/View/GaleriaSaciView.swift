//
//  GaleriaSaciView.swift
//  Macro01
//
//  Created by Sarah dos Santos Silva on 29/07/23.
//

import Foundation
import SwiftUI

struct GaleriaSaciView: View {
    
    @State private var count = 0
    @Binding var isPresented: Bool
    @ScaledMetric(relativeTo: .body) var buttonSize: CGFloat = 50
    @State var Images: [String] = ["saci01",
                                   "saci02",
                                   "saci03",
                                   "raya01",
                                   "raya02",
                                   "raya03"]
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                
                ViewComponent(count: $count, Images: Images)
                VStack {
                    HStack {
                        ButtonGenRound(action: {
                            withAnimation {
                                isPresented = false
                            }
                            
                        },
                                       image: "out",
                                       foregroundColor: (Color(hex: "FFF2D9")),
                                       backgroundColor: (Color(hex: "FFF2D9")))
                        .frame(width: buttonSize, height: buttonSize)
                        .offset(x: -10,y: 10)
                        Spacer()
                    }
                    Spacer()
                }
            }
        }
    }
}
