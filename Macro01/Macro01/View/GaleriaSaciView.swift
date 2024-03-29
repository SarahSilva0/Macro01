//
//  GaleriaSaciView.swift
//  Macro01
//
//  Created by Sarah dos Santos Silva on 29/07/23.
//

import Foundation
import SwiftUI

struct GaleriaSaciView: View {
    
    private let sound = SoundManager.instance
    @State private var count = 0
    
    @Binding var isPresented: Bool
    @ScaledMetric(relativeTo: .body) var buttonSize: CGFloat = 50
    
    @EnvironmentObject var dificultyViewModel: DificultyViewModel
    
    @State var Images: [String] = ["saci1PT".localizedLanguage(),
                                   "saci2PT".localizedLanguage(),
                                   "saci3PT".localizedLanguage()]
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                
                ViewComponent(count: $count, Images: Images)
                VStack {
                    HStack {
                        ButtonGenRound(action: {
                            sound.buttonSound()
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
        .onAppear {
            if dificultyViewModel.raiaWin {
                Images.append(contentsOf: [
                    "raia1PT".localizedLanguage(),
                    "raia2PT".localizedLanguage(),
                    "raia3PT".localizedLanguage()
                ])
            }
            if dificultyViewModel.botoWin {
                Images.append(contentsOf: [
                    "otto1PT".localizedLanguage(),
                    "otto2PT".localizedLanguage(),
                    "otto3PT".localizedLanguage()
                ])
            }
            if dificultyViewModel.cucaWin {
                Images.append(contentsOf: [
                    "lucia1PT".localizedLanguage(),
                    "lucia2PT".localizedLanguage(),
                    "lucia3PT".localizedLanguage()
                ])
            }
        }
    }
}


