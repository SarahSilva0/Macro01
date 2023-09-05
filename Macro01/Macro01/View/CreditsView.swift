//
//  CreditsView.swift
//  Macro01
//
//  Created by Higor  Lo Castro on 04/09/23.
//

import SwiftUI

struct CreditsView: View {
    @ScaledMetric(relativeTo: .body) var buttonSize: CGFloat = 50
    @Binding var isPresented: Bool
    private let sound = SoundManager.instance
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(.black)
                    .opacity(0.65)
                
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
                    }
                    .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.85)
                    
                }
                .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.1)
                .background(.red)
                
                VStack {
                    Spacer()
                    VStack {
                        Text("Créditos".localizedLanguage())
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("Desenvolvimento".localizedLanguage())
                            .font(.system(size: 12))
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                        
                        Text("""
                                Higor Lo Castro
                                Júlia Mendes
                                Sarah Silva
                                """)
                        .font(Font.custom("SF Pro", size: 12))
                        .multilineTextAlignment(.center)
                        .lineSpacing(5)
                        .foregroundColor(.black)
                        
                        Spacer()
                        
                        Text("Design".localizedLanguage())
                            .font(.system(size: 12))
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                        
                        Text("""
                                Thiago Nakayama
                                """)
                        .foregroundColor(.black)
                        .font(.system(size: 12))
                        
                        Spacer()
                        
                        Text("Música e Sons".localizedLanguage())
                            .font(.system(size: 12))
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                        
                        Text("""
                                Fiftysounds
                                Freesound
                                """)
                        .font(Font.custom("SF Pro", size: 12))
                        .multilineTextAlignment(.center)
                        .lineSpacing(5)
                        .foregroundColor(.black)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.7)
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

