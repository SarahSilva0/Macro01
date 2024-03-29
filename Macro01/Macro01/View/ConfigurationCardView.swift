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
    @State private var showCredits = false
    
    private let sound = SoundManager.instance
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(.black)
                    .opacity(0.65)
                    .onTapGesture {}
                
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
                        .frame(width: geometry.size.width * 0.01, height: geometry.size.height * 0.853)
                }
                .frame(width: geometry.size.width * 0.98, height: geometry.size.height * 0.1)
                
                HStack {
                    VStack  {
                        ZStack {
                            HStack  {
                                Text("Configuração".localizedLanguage())
                                    .font(.system(size: 20))
                                    .foregroundColor(.black)
                                    .fontWeight(.bold)
                            }
                            
                            HStack  {
                                Spacer()
                                ButtonGenRound(action: {
                                    sound.buttonSound()
                                },
                                               image: "",
                                               foregroundColor: (Color(hex: "FFF2D9")),
                                               backgroundColor: (Color(hex: "FFF2D9")))
                                .frame(width: 30, height: 30)
                                
                            }
                            .frame(width: geometry.size.width * 0.38, height: geometry.size.height * 0.2)
                        }
                        
                        Spacer()
                            .frame(height: geometry.size.height * 0.1)
                        
                        VStack {
                            TransparentConfigurationButton(text: "Manual".localizedLanguage(), icon: "book") {
                                sound.buttonSound()
                                showTutorial = true
                            }
                            TransparentConfigurationButton(text: "Sobre".localizedLanguage(), icon: "info") {
                                sound.buttonSound()
                                showAbout = true
                            }
                            
                            TransparentConfigurationButton(text: "Políticas de Privacidade".localizedLanguage(), icon: "policies") {
                                sound.buttonSound()
                                showPolicyAndPrivacy = true
                            }
                            
                            TransparentConfigurationButton(text: "Créditos".localizedLanguage(), icon: "credits") {
                                showCredits = true
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
            .frame(width: geometry.size.width, height: geometry.size.height)
            
            
            
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
                TutorialView(isPresented: $showTutorial).background(ClearBackgroundView())
            }
            .sheet(isPresented: $showCredits) {
                CreditsView(isPresented: $showCredits).background(ClearBackgroundView())
            }
            
        }
        
    }
    
}


