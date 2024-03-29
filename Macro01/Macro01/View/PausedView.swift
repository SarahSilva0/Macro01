//
//  PausedView.swift
//  Macro01
//
//  Created by Sarah dos Santos Silva on 01/08/23.
//

import SwiftUI

struct PausedView: View {
    
    @ScaledMetric(relativeTo: .body) var buttonSize: CGFloat = 50
    
    @Binding var isPresented: Bool
    @ObservedObject var combatViewModel: CombatViewModel
    @Environment(\.presentations) private var presentations
    private let sound = SoundManager.instance

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(.black)
                    .opacity(0.65)
                HStack {
                    VStack  {
                        ZStack {
                            HStack  {
                                Text("Pausa".localizedLanguage())
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                            }
                            
                            HStack  {
                                Spacer()
                                ButtonGenRound(action: {
                                    sound.buttonSound()
                                    print("SOM")
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
                            TransparentConfigurationButton(text: "Continuar".localizedLanguage(), icon: "buttonCancel") {
                                combatViewModel.isPaused = false
                                sound.buttonSound()
                                if !combatViewModel.timer!.isValid{
                                    combatViewModel.startTimer()
                                   
                                }
                            }
                            TransparentConfigurationButton(text: "Sair".localizedLanguage(), icon: "buttonExit") {
                                sound.buttonSound()
                                sound.playSound(music: .lobbyMusic)
                                combatViewModel.gameReset()
                                presentations.forEach{
                                    $0.wrappedValue = false
                                }
                           
                            }
                        }
                        .frame(width: geometry.size.width * 0.35)
                    }
                    .frame(width: geometry.size.width * 0.4, height: geometry.size.height * 0.5)
                    Spacer()
                }
                .frame(width: geometry.size.width * 0.4)
                .background(Color(hex: "FFF2D9"))
                .cornerRadius(10)
                .shadow(radius: 2)
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .bottomLeading)
            
        }
        .ignoresSafeArea()
        .transition(.move(edge: .leading))
        .animation(.easeOut(duration: 4), value: false)
        .onDisappear {
            DispatchQueue.main.async {
                isPresented = false
            }
        }
        
    }
    
}


