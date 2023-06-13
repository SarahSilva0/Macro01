//
//  CombatView.swift
//  Macro01
//
//  Created by Sarah dos Santos Silva on 30/05/23.
//

import SwiftUI

//MARK: VIEW DO COMBATE. ESSA VIEW PRECISA SER REFATORADA DEPOIS E DEIXADA MAIS RESPONSIVA
struct CombatView: View {
    
    @StateObject private var combatViewModel = CombatViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.6)
                    .padding(.top, -20)
                
                HStack (alignment: .center) {
                    if combatViewModel.isCountdownVisible {
                        Text("\(combatViewModel.countdown)")
                            .font(.custom("Helvetica Neue", size: 50))
                            .foregroundColor(Color (hex: "3C3634"))
                            .fontWeight(.bold)
                    }
                }
                .frame(width: geometry.size.width * 0.1, height: geometry.size.height * 0.1)
                //                                    .background(Color.white)
                
                VStack {
                    HStack (alignment: .center) {
                        //Placar
                        ScoreView(player1Wins: combatViewModel.player1.winTurno,
                                  player2Wins: combatViewModel.player2.winTurno)
                        
                    }
                    .frame(width: geometry.size.width * 0.2, height: geometry.size.height * 0.2)
                    //                                        .background(Color.yellow)
                    
                    Spacer (minLength: 100)
                    
                    VStack {
                        VStack (alignment: .center){
                            HStack (spacing: 100) {
                                //CARTA AO CENTRO DO PLAYER 1
                                VStack {
                                        Image(combatViewModel.player1.selectedCard)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .animation(.easeIn(duration: 0.3))
                                            .frame(width: geometry.size.width * 0.13, height: geometry.size.height * 0.13)
                                }
                                .animation(.easeIn(duration: 0.3))
                                .frame(width: geometry.size.width * 0.13, height: geometry.size.height * 0.13)
                                
                                //CARTA AO CENTRO DO PLAYER 1
                                VStack {
                                    //Mudei para o player2 Receber a carta quando a Sheet Fechar
                                    if !combatViewModel.isSheetVisible {
                                        Image(combatViewModel.player2.selectedCard)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                    }
                                    else {
                                        Image("")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                    }
                                }
                                .animation(.easeIn(duration: 0.3))
                                .frame(width: geometry.size.width * 0.13, height: geometry.size.height * 0.13)
                            }
                            .frame(width: geometry.size.width * 0.5, height: geometry.size.height * 0.3)
                            //                                .background(.blue)
                        }
                    }
                    
                    Spacer(minLength: 100)
                    
                    //CARTAS DO PLAYER 1 NO CENTRO
                    HStack {
                        ForEach(combatViewModel.player1.cards, id: \.self) { card in
                            CardComponent(image: Image(card))
                        }
                    }
                    .allowsHitTesting(combatViewModel.isInteractionEnabled)
                    //                    .background(.white)
                    .animation(.easeIn(duration: 0.3))
                    .frame(width: geometry.size.width * 0.2, height: geometry.size.height * 0.2)
                }
                
                HStack {
                    ZStack {
                        VStack {
                            Spacer()
                            CharacterCircle(sizeWidth: 180, sizeHeight: 180, colorHex: "FFC097")
                        }
                        .padding(.bottom, 50) // Mover o círculo para cima
                        
                        VStack {
                            Spacer(minLength: 420)
                            Character(character: "player1")
                        }
                        .frame(width: geometry.size.width * 0.30, height: geometry.size.height * 0.30)
                    }
                    
                    Spacer(minLength: 100)
                    
                    ZStack {
                        VStack {
                            Spacer()
                            CharacterCircle(sizeWidth: 180, sizeHeight: 180, colorHex: "89B9E5")
                        }
                        .padding(.bottom, 50) // Mover o círculo para cima
                        
                        VStack {
                            Spacer(minLength: 420)
                            Character(character: "player1")
                        }
                        .frame(width: geometry.size.width * 0.30, height: geometry.size.height * 0.30)
                    }
                }
            }
            .background (Color(hex: "3C3634"))
            .ignoresSafeArea()
            
            .onAppear {
                combatViewModel.startCountdown()
            }
            
            .sheet(isPresented: $combatViewModel.isSheetVisible, onDismiss: {
            }) {
                SheetView(combatViewModel: combatViewModel, isSheetVisible: $combatViewModel.isSheetVisible, countdownSheet: $combatViewModel.countdownSheet).background(ClearBackgroundView())
            }
            .alert(isPresented: $combatViewModel.isGameEndAlertPresented) {
                Alert(title: Text("Fim do Jogo"),
                      message: Text("\(combatViewModel.getScore())"),
                      dismissButton: .default(Text("OK"), action: {
                    presentationMode.wrappedValue.dismiss()
                }))
            }
        }
    }
}






