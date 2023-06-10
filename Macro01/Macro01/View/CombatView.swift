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
//                    .aspectRatio(contentMode: .fill)
//                    .ignoresSafeArea()

                VStack {
                    HStack (alignment: .center) {
                        //Placar
                        ScoreView(player1Wins: combatViewModel.player1.winTurno,
                                  player2Wins: combatViewModel.player2.winTurno)
                        
                        
                        .frame(width: geometry.size.width * 0.2, height: geometry.size.height * 0.2)
                    }
                    .frame(width: geometry.size.width * 0.2, height: geometry.size.height * 0.2)
                    //                    .background(Color.yellow)
                    
                    Spacer (minLength: 70)
                    
                    HStack (alignment: .top) {
                        if combatViewModel.isCountdownVisible {
                            Text("\(combatViewModel.countdown)")
                                .font(.largeTitle)
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                            
                        }
                    }
                    .frame(width: geometry.size.width * 0.1, height: geometry.size.height * 0.1)
                    //                    .background(Color.white)
                    
                    HStack {
                        //JOGADOR 1
                        VStack {
                            Text("Mana: \(combatViewModel.player1.mana)")
                                .foregroundColor(.red)
                            
                            CharacterTextBox(character: "player1")
                            
                        }
                        //                        .background(.black)
                        .frame(width: geometry.size.width * 0.2, height: geometry.size.height * 0.2)
                        
                        Spacer ()
                        
                        HStack (spacing: 100) {
                            //Seleçao Carta Player 1
                            VStack {
                                Image(combatViewModel.player1.selectedCard)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                
                            }
                            .frame(width: geometry.size.width * 0.15, height: geometry.size.height * 0.15)
                            
                            
                            //Seleçao Carta Player 2
                            VStack {
                                //Mudei para o player2 Receber a carta quando a Sheet Fechar
                                if !combatViewModel.isSheetVisible {
                                    Image(combatViewModel.player2.selectedCard)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                }
                                else{
                                    Image("")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                    
                                }
                            }
                            .frame(width: geometry.size.width * 0.15, height: geometry.size.height * 0.15)
                            
                        }
                        .frame(width: geometry.size.width * 0.5, height: geometry.size.height * 0.3)
                        //                            .background(.blue)
                        
                        Spacer()
                        
                        //JOGADOR 2
                        VStack{
                            Text("Mana: \(combatViewModel.player2.mana)")
                                .foregroundColor(.red)
                            
                            CharacterTextBox(character: "player1")
                        }
                        //                        .background(.black)
                        .frame(width: geometry.size.width * 0.2, height: geometry.size.height * 0.2)
                    }
                    
                    Spacer(minLength: 100)
                    
                    //CARTAS DO PLAYER 1
                    HStack {
                        ForEach(combatViewModel.player1.cards, id: \.self) { card in
                            CardComponent(image: Image(card))
                        }
                    }
                    .allowsHitTesting(combatViewModel.isInteractionEnabled)
                    //                    .background(.white)
                    .frame(width: geometry.size.width * 0.2, height: geometry.size.height * 0.2)
                    
                }
            }
            .background (Color(hex: "3C3634"))
            
            .onAppear {
                combatViewModel.startCountdown()
            }
            .ignoresSafeArea()
            .background(Color.white)
            
            
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






