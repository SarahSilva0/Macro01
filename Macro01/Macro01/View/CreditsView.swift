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
                      
                        Spacer()
                        
                    }
                    Spacer()
                        .frame(width: geometry.size.width * 0.01, height: geometry.size.height * 0.85)
                    
                }
                .frame(width: geometry.size.width * 0.98, height: geometry.size.height * 0.1)
                Spacer()
                
                    VStack {
                        HStack  {
                            Text("Créditos".localizedLanguage())
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                        }
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.15)

                        VStack {
                            Text("Desenvolvimento".localizedLanguage())
                            .font(Font.custom("SF Pro", size: 12))
                            .foregroundColor(.black)
                            
                            Text("""
                                Higor Lo Castro
                                Júlia Mendes
                                Sarah Silva
                            """)
                            .multilineTextAlignment(.center)
                            .lineSpacing(5)
                            .foregroundColor(.black)
                            
                            Spacer()
                            
                            Text("Design".localizedLanguage())
                            .font(Font.custom("SF Pro", size: 12))
                            .foregroundColor(.black)
                            
                            Text("""
                                Thiago Nakayama
                            """)
                            .foregroundColor(.black)
                            
                            Spacer()
                            
                            Text("Música e Sons".localizedLanguage())
                            .font(Font.custom("SF Pro", size: 12))
                            .foregroundColor(.black)
                            
                            Text("""
                                Fiftysounds
                                Freesound
                            """)
                            .multilineTextAlignment(.center)
                            .lineSpacing(5)
                            .foregroundColor(.black)
                            
                            
                        }
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.7)
                        Spacer()
                            .background(.red)
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
