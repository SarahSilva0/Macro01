//
//  ConfigurationCardView.swift
//  Macro01
//
//  Created by Higor  Lo Castro on 20/07/23.
//

import SwiftUI

struct ConfigurationCardView: View {
    @ScaledMetric(relativeTo: .body) var buttonSize: CGFloat = 50
    
    @Binding var isPresented: Bool
    @State private var showAbout = false
    @State private var showPolicyAndPrivacy = false
    @State private var showTutorial = false
    
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(.black)
                    .opacity(0.65)
                    .onTapGesture {}
                
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
                        .frame(width: geometry.size.width * 0.01, height: geometry.size.height * 0.853)
                }
                .frame(width: geometry.size.width * 0.858, height: geometry.size.height * 0.1)
                
                HStack {
                    VStack  {
                        ZStack {
                            HStack  {
                                Text("Configuração")
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
                                .frame(width: 30, height: 30)
                                
                            }
                            .frame(width: geometry.size.width * 0.38, height: geometry.size.height * 0.2)
                        }
                        
                        Spacer()
                            .frame(height: geometry.size.height * 0.1)
                        
                        VStack {
                            TransparentConfigurationButton(text: "Tutorial", icon: "book") {
                                print("Tutorial")
                                showTutorial = true
                            }
                            TransparentConfigurationButton(text: "Sobre", icon: "info") {
                                showAbout = true
                            }
                            
                            TransparentConfigurationButton(text: "Suporte", icon: "email") {
                                print("email")
                            }
                            
                            TransparentConfigurationButton(text: "Políticas de Privacidade", icon: "info") {
                                showPolicyAndPrivacy = true
                            }
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
            .frame(width: geometry.size.width, height: geometry.size.height )
            

            
            .transition(.move(edge: .leading))
            .animation(.easeOut(duration: 4), value: false)
            
            .onDisappear {
                DispatchQueue.main.async {
                    isPresented = false
                }
            }
            
            .sheet(isPresented: $showAbout) {
                AboutView(isPresented: $showAbout).background(ClearBackgroundView())
                
            }
            .sheet(isPresented: $showPolicyAndPrivacy) {
                PolicyAndPrivacyView(isPresented: $showPolicyAndPrivacy).background(ClearBackgroundView())
                
            }
            .sheet(isPresented: $showTutorial){
                TutorialView()
            }
           
        }
        
    }
       
}
    
struct ConfigurationCard_Previews: PreviewProvider {
    static var previews: some View {
        ConfigurationCardView(isPresented: .constant(true))
    }
}
