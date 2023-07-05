//
//  AboutAndPoliticsView.swift
//  Macro01
//
//  Created by Higor  Lo Castro on 05/07/23.
//

import SwiftUI

import SwiftUI

struct AboutAndPoliticsView: View {
    @ScaledMetric(relativeTo: .body) var buttonSize: CGFloat = 50
    @Binding var isPresented: Bool
    
    var title: String
    var text: String
    
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
                
                HStack {
                    VStack  {
                        ZStack {
                            HStack  {
                                Text(title)
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                            }
                            
                            HStack  {
                                Spacer()
                                ButtonGenRound(action: {
                                    print("SOM")
                                },
                                               image: "sound",
                                               foregroundColor: (Color(hex: "FFF2D9")),
                                               backgroundColor: (Color(hex: "FFF2D9")))
                            }
                            .frame(width: geometry.size.width * 0.38, height: geometry.size.height * 0.2)
                        }
                        
                        Spacer()
                            .frame(height: geometry.size.height * 0.1)
                        
                        VStack {
                            Text(text)
                                  .font(Font.custom("SF Pro", size: 16))
                                  .multilineTextAlignment(.center)
                    
                        }
                        .frame(width: geometry.size.width * 0.4, height: geometry.size.height * 0.5)
                        Spacer()
                    }
                    .frame(width: geometry.size.width * 0.4)
                    .background(Color(hex: "FFF2D9"))
                    .cornerRadius(10)
                    .shadow(radius: 2)
                }
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


