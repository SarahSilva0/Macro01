//
//  AboutView.swift
//  Macro01
//
//  Created by Higor  Lo Castro on 05/07/23.
//

import SwiftUI


struct AboutView: View {
    @ScaledMetric(relativeTo: .body) var buttonSize: CGFloat = 50
    @Binding var isPresented: Bool
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(.black)
                    .opacity(0.65)
                
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
                      
                        Spacer()
                        
                    }
                    Spacer()
                        .frame(width: geometry.size.width * 0.01, height: geometry.size.height * 0.69)
                        .background(.white)
                    
                }
                .frame(width: geometry.size.width * 0.86, height: geometry.size.height * 0.1)
                
                    VStack {
                        Spacer()
                                Text("Sobre")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                        Spacer()

                            Text("""
                             Folkard é um jogo de cartas com tema
                             folclórico, onde seu objetivo é duelar contra
                             seus oponentes para conquistar todas as
                             cartas!
                             """
                            )
                                  .font(Font.custom("SF Pro", size: 12))
                                  .multilineTextAlignment(.center)
                                  .lineSpacing(5)
                        Spacer()
                    
                    }
                    .frame(width: geometry.size.width * 0.4)
                    .background(Color(hex: "FFF2D9"))
                    .cornerRadius(10)
                    .shadow(radius: 2)

            }
            .ignoresSafeArea()
            .frame(width: geometry.size.width, height: geometry.size.height)
            .transition(.move(edge: .leading))
            .animation(.easeOut(duration: 4), value: false)
            
            .onDisappear {
                DispatchQueue.main.async {
                    isPresented = false
                }
            }
        }
    }
}








