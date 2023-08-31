//
//  SplashScreen.swift
//  Macro01
//
//  Created by Higor  Lo Castro on 03/08/23.
//

import SwiftUI

struct SplashScreen: View {
    @State private var showHomeView = false
    @State var scale = 0.6
    @State var opacity = 0.6
        
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    
    var body: some View {
        
        GeometryReader { geometry  in
            ZStack {
                Image("BG GERAL")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea(.all)
                VStack {
                    if showHomeView {
                        MainView()
                    } else {
                        VStack {
                            Image("logoSplash")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 300, height: 300)
                        }
                        .scaleEffect(scale)
                        .opacity(opacity)
                        .onAppear {
                            withAnimation(
                                .easeIn(duration: 1.5)){
                                    self.scale = 1.0
                                    self.opacity = 1.0
                                }
                            withAnimation(Animation.linear.delay(2)) {
                                showHomeView = true
                            }
                        }
                    }
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

