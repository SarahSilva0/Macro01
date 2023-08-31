//
//  TutorialView.swift
//  Macro01
//
//  Created by Julia Mendes on 14/06/23.
//

import SwiftUI

struct TutorialView: View {

    @State private var count = 0
    @Binding var isPresented: Bool
    @ScaledMetric(relativeTo: .body) var buttonSize: CGFloat = 50
    @State var tutorialImages: [String] = ["duelo01".localizedLanguage(),
                                           "duelo02".localizedLanguage(),
                                           "duelo03".localizedLanguage(),
                                           "duelo04".localizedLanguage()]
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ViewComponent(count: $count, Images: tutorialImages)
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

