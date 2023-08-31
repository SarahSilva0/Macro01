//
//  PolicyAndPrivacyView.swift
//  Macro01
//
//  Created by Higor  Lo Castro on 20/07/23.
//

import SwiftUI

struct PolicyAndPrivacyView: View {
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
                        .frame(width: geometry.size.width * 0.01, height: geometry.size.height * 0.85)
                        .background(.white)
                    
                }
                .frame(width: geometry.size.width * 0.98, height: geometry.size.height * 0.1)
                
                    VStack {
                        
                        HStack  {
                            Text("Política e Privacidade".localizedLanguage())
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                        }
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.15)
                    
                            Text("""
                             Este aplicativo é mantido e operado por Higor Crisostomo, Julia Mendes, Sarah dos Santos Silva e Thiago Akira Nakayama.
                             
                             Nós NÃO coletamos e utilizamos nenhum
                             dado pessoal que pertencem àqueles que
                             utilizam nosso aplicativo.
                             
                             Para esclarecer quaisquer dúvidas sobre
                             esta Política de Privacidade ou sobre
                             o aplicativo, entre em contato conosco, pelo
                             canal mencionado abaixo:
                             
                             E-mail:
                             folkardbattlecard@gmail.com
                             """.localizedLanguage()
                            )
                                  .font(Font.custom("SF Pro", size: 12))
                                  .foregroundColor(.black)
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
