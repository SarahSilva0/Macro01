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
        ZStack {
            Image("backgroundOne")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            //MARK: CONTADOR DO CENTRO DA TELA
            VStack {
                if combatViewModel.isCountdownVisible {
                    Text("\(combatViewModel.countdown)")
                        .font(.custom("Helvetica Neue", size: 50))
                        .foregroundColor(Color(hex: "3C3634"))
                        .fontWeight(.bold)
                }
                
            }
            
            GeometryReader { geometry in
                VStack {
                    //MARK: PLACAR
                    VStack {
                        ScoreView(player1Wins: combatViewModel.player1.winTurno,
                                  player2Wins: combatViewModel.player2.winTurno)
                        .padding(.bottom)
                    }
                    .frame(width: geometry.size.width * 0.25, height: geometry.size.height * 0.22, alignment: .center)
                    Spacer()
                    
                    VStack {
                        //MARK: CARTA JOGADA NO CENTRO PELO PLAYER 1
                        HStack (alignment: .center) {
                            Image(combatViewModel.player1.selectedCard)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: geometry.size.height * 0.4)
                            
                            Spacer(minLength: 130)
                            
                            if !combatViewModel.isSheetVisible {
                                Image(combatViewModel.player2.selectedCard)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: geometry.size.height * 0.4)
                            } else {
                                Image("")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            }
                        }
                        .frame(width: geometry.size.width * 0.3, height: geometry.size.height * 0.7, alignment: .center)
                    }
                    .frame(height: geometry.size.height * 0.5, alignment: .bottom)
                    
                    //MARK: AS 3 CARTAS DO PLAYER 1 NA PARTE DEBAIXO
                    HStack {
                            ForEach(combatViewModel.player1.cards, id: \.self) { card in
                                CardComponentMainScreen(image: Image(card))
                            }
                            .frame(width: geometry.size.width * 0.13, height: geometry.size.height * 0.1)
                        
                        }
                        .frame(width: geometry.size.width * 0.2, height: geometry.size.height * 0.2, alignment: .bottom)
                }
                //AQUI MEXE NA ALTURA DAS CARTAS EM RELACAO AS CARTAS DO CENTRO
                .frame(width: geometry.size.width, height: geometry.size.height * 1.1, alignment: .center)
                
                ZStack {
                    VStack{
                        //MARK: BOTÃO DE PAUSE
                        HStack{
                            ButtonGenRound(action: {
                                presentationMode.wrappedValue.dismiss()
                            },
                                           image: "pause",
                                           foregroundColor: Color(hex: "FFF2D9"),
                                           backgroundColor: Color(hex: "FFF2D9"))
                            .frame(width: 40, height: 40)
                            .padding(.all)
                        }
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.5, alignment: .topLeading)
                        
                        HStack {
                            //MARK: PERSONAGEM PLAYER 1
                            VStack {
                                Character(character: "player1")
                                    .frame(width: geometry.size.width * 0.2, height: geometry.size.height * 0.25)
                            }
                            
                            Spacer()
                            
                            //MARK: PERSONAGEM PLAYER 2
                            VStack {
                                Character(character: "player2")
                                    .frame(width: geometry.size.width * 0.2, height: geometry.size.height * 0.32)
                            }
                        }
                        .ignoresSafeArea()
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.5, alignment: .bottom)
                    }
                }
            }
        }
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
        .navigationBarHidden(true)
    }
}

struct CombatView_Previews: PreviewProvider {
    static var previews: some View {
        CombatView()
    }
}








