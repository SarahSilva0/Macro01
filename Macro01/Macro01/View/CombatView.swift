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
                Image("backgroundOne")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                
                //CONTADOR DO CENTRO
                VStack(alignment: .center) {
                    Spacer ()
                    if combatViewModel.isCountdownVisible {
                        Text("\(combatViewModel.countdown)")
                            .font(.custom("Helvetica Neue", size: 50))
                            .foregroundColor(Color(hex: "3C3634"))
                            .fontWeight(.bold)
                    }
                    Spacer()
                }
                .frame(width: geometry.size.width * 0.1, height: geometry.size.height * 0.1)
                
              
                
                //CARTA DOS PLAYERS
                VStack {
                    VStack {
                        HStack (alignment: .top){
                            //PLACAR
                            ScoreView(player1Wins: combatViewModel.player1.winTurno,
                                      player2Wins: combatViewModel.player2.winTurno)
                        }
                        .background(.black)
                        .frame(width: geometry.size.width * 0.4, height: geometry.size.height * 0.4)
                        Spacer()
                    }
                    .padding(.top, -65)
                    
                    //CARTAS AO CENTRO
                    HStack (alignment: .center){
                        Image(combatViewModel.player1.selectedCard)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width * 0.135, height: geometry.size.height * 0.1)
                        
                        Spacer(minLength: 130)
                        
                        if !combatViewModel.isSheetVisible {
                            Image(combatViewModel.player2.selectedCard)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: geometry.size.width * 0.135, height: geometry.size.height * 0.1)
                        } else {
                            Image("")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
//                                .frame(width: geometry.size.width * 0.13, height: geometry.size.height * 0.1)
                        }
                    }
                    .frame(width: geometry.size.width * 0.2, height: geometry.size.height * 0.2)
                    
                    // PERSONAGENS
                    HStack {
                        Character(character: "player1")
                        
                        Spacer()
                        
                        //CARTAS DO PLAYER 1
                        HStack (alignment: .center) {
                            ForEach(combatViewModel.player1.cards, id: \.self) { card in
                                CardComponent(image: Image(card))
                            }
                            .frame(width: geometry.size.width * 0.13, height: geometry.size.height * 0.1)
                            .allowsHitTesting(combatViewModel.isInteractionEnabled)
                        }
                        .frame(width: geometry.size.width * 0.6, height: geometry.size.height * 0.6)
                        .padding(.bottom, -160)
                        
                        Character(character: "player2")
                    }
                    .frame(width: geometry.size.width * 0.4, height: geometry.size.height * 0.4)
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
            
            
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

struct CombatView_Previews: PreviewProvider {
    static var previews: some View {
        CombatView()
    }
}






